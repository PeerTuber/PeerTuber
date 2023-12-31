import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:injectable/injectable.dart';
import 'package:peertuber/src/core/constants/enums.dart';
import 'package:peertuber/src/core/error/exceptions.dart';
import 'package:peertuber/src/core/error/failures.dart';
import 'package:peertuber/src/core/network/cache_client.dart';
import 'package:peertuber/src/features/auth/domain/entities/logged_in_user.dart';

/// A type that represents a client record containing a client ID and client secret.
typedef ClientRecord = ({String clientId, String clientSecret});

abstract class RemoteAuthDataSource {
  Stream<AuthStatus> get status;
  LoggedInUser get loggedInUser;
  Future<LoggedInUser> login(Username username, Password password);
  Future<void> signup({required LoggedInUser user, required Password password});
  Future<void> logout();
}

@LazySingleton(as: RemoteAuthDataSource)
class RemoteAuthDataSourceImpl implements RemoteAuthDataSource {
  final CacheClient cacheClient;
  final http.Client httpClient;
  final _controller = StreamController<AuthStatus>();

  RemoteAuthDataSourceImpl(
      {required this.cacheClient, required this.httpClient});

  // Cache key for the logged in user
  static const userCacheKey = '__user_cache_key';
  static const clientCacheKey = '__client_cache_key';

  @override
  Stream<AuthStatus> get status async* {
    yield AuthStatus.unauthenticated;
    yield* _controller.stream;
  }

  @override

  /// Returns a [Future] that resolves to the currently logged in user.
  LoggedInUser get loggedInUser {
    return cacheClient.read(userCacheKey) ?? LoggedInUser.empty;
  }

  @override

  /// Logs in the user with the given [username] and [password].
  ///
  /// If the client record is not cached, it is fetched from the server and cached.
  /// Returns a [LoggedInUser] object representing the logged in user.
  Future<LoggedInUser> login(Username username, Password password) async {
    ClientRecord? clientRecord = cacheClient.read(clientCacheKey);

    // Cache the client record if it is not cached
    if (clientRecord == null) {
      clientRecord = await _getClientKeys();
      cacheClient.write(key: clientCacheKey, value: clientRecord);
    }

    // Log in the user
    final user = await _loginUser(
        clientRecord: clientRecord!, username: username, password: password);

    // Update the logged in user
    _updateLoggedInUser(
      username: user.username,
      accessToken: user.accessToken,
      refreshToken: user.refreshToken,
    );

    // Emit the new authentication status
    _controller.add(AuthStatus.authenticated);

    // Return the logged in user
    return user;
  }

  @override
  Future<void> logout() {
    return Future.delayed(const Duration(seconds: 1), () {
      cacheClient.remove(key: userCacheKey);
      cacheClient.remove(key: clientCacheKey);
      _controller.add(AuthStatus.unauthenticated);
    });
  }

  @override
  Future<void> signup(
      {required LoggedInUser user, required Password password}) async {
    // Sign up the user
    await _signUpUser(user: user, password: password);

    // Update the logged in user
    _updateLoggedInUser(username: user.username, email: user.email);

    // Emit the new authentication status
    _controller.add(AuthStatus.unauthenticated);
  }

  Future<ClientRecord>? _getClientKeys() async {
    // TODO(mikehuntington): remove neovibe.app from url
    const url = 'https://vids.neovibe.app/api/v1/oauth-clients/local';
    final uri = Uri.parse(url);
    late http.Response response;

    try {
      response = await httpClient
          .get(uri, headers: {'Content-Type': 'application/json'});
    } on http.ClientException {
      throw const LoginFailure(reason: LoginFailureReason.clientKeyError);
    }

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = jsonDecode(response.body);

      return (
        clientId: data['client_id'] as String,
        clientSecret: data['client_secret'] as String
      );
    } else {
      throw const LoginFailure(reason: LoginFailureReason.clientKeyError);
    }
  }

  /// Updates the logged-in user.
  void _updateLoggedInUser(
      {int? id,
      Username? username,
      Email? email,
      String? accessToken,
      String? refreshToken}) {
    LoggedInUser loggedInUser =
        cacheClient.read(userCacheKey) ?? LoggedInUser.empty;

    loggedInUser = loggedInUser.copyWith(
      accessToken: accessToken ?? loggedInUser.accessToken,
      refreshToken: refreshToken ?? loggedInUser.refreshToken,
      id: id ?? loggedInUser.id,
      username: username ?? loggedInUser.username,
      email: email ?? loggedInUser.email,
    );

    cacheClient.write(key: userCacheKey, value: loggedInUser);
  }

  /// Logs in a user with the provided [clientRecord], [username], and [password].
  ///
  /// Returns a [LoggedInUser] object containing the user's access token, refresh token, and username.
  ///
  /// Throws a [ServerException] if the response status code is not 200.
  Future<LoggedInUser> _loginUser(
      {required ClientRecord clientRecord,
      required Username username,
      required Password password}) async {
    // TODO(mikehuntington): remove neovibe.app from url
    const url = 'https://vids.neovibe.app/api/v1/users/token';
    final uri = Uri.parse(url);
    late http.Response response;

    try {
      response = await http.post(
        uri,
        body: {
          "client_id": clientRecord.clientId,
          "client_secret": clientRecord.clientSecret,
          "grant_type": "password",
          "username": username.value,
          "password": password.value,
        },
        encoding: Encoding.getByName('utf-8'),
        headers: {
          'Content-Type': 'application/x-www-form-urlencoded',
        },
      );
    } on http.ClientException {
      throw ServerException();
    }

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = jsonDecode(response.body);
      const user = LoggedInUser.empty;

      return user.copyWith(
          accessToken: data['access_token'] as String,
          refreshToken: data['refresh_token'] as String,
          username: username);
    } else {
      switch (response.statusCode) {
        case 400:
          throw const LoginFailure(
              reason: LoginFailureReason.credentialsNotValid);
        case 401:
          throw const LoginFailure(reason: LoginFailureReason.tokenExpired);
        default:
          throw ServerException();
      }
    }
  }

  Future<void> _signUpUser(
      {required LoggedInUser user, required Password password}) async {
    // TODO(mikehuntington): remove neovibe.app from url
    const url = 'https://vids.neovibe.app/api/v1/users/register';
    final uri = Uri.parse(url);
    late http.Response response;

    try {
      response = await http.post(
        uri,
        body: jsonEncode({
          "username": user.username.value,
          "password": password.value,
          "email": user.email.value,
        }),
        encoding: Encoding.getByName('utf-8'),
        headers: {
          'Content-Type': 'application/json',
        },
      );
    } on http.ClientException {
      throw ServerException();
    }

    final Map<String, dynamic> responseJson = jsonDecode(response.body);
    switch (response.statusCode) {
      case 400:
        throw const SignupFailure(reason: SignupFailureReason.unknown);
      case 403:
        throw SignupFailure(
            reason: SignupFailureReason.registrationNotEnabled,
            message: responseJson['error'] as String);
      case 409:
        throw SignupFailure(
            reason: SignupFailureReason.usernameOrEmailTaken,
            message: responseJson['error'] as String);
    }
  }
}
