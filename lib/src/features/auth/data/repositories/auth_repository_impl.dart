import 'package:peertuber/src/features/auth/data/datasources/remote_auth_data_source.dart';
import 'package:peertuber/src/features/auth/domain/entities/logged_in_user.dart';
import 'package:peertuber/src/features/auth/domain/repositories/auth_repository.dart';
import 'package:peertuber/src/features/common/domain/entities/user.dart';
import 'package:peertuber/src/core/network/network_info.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: AuthRepository)
class AuthRespositoryImpl implements AuthRepository {
  final RemoteAuthDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  AuthRespositoryImpl({
    required this.remoteDataSource,
    required this.networkInfo,
  });

  @override
  Future<LoggedInUser> get loggedInUser => remoteDataSource.loggedInUser;

  @override
  Stream<AuthStatus> get status => remoteDataSource.status;

  @override
  Future<LoggedInUser> login(Username username, Password password) {
    return remoteDataSource.login(username, password);
  }

  @override
  Future<void> logout() {
    return remoteDataSource.logout();
  }

  @override
  Future<void> signup(
      {required LoggedInUser user, required Password password}) {
    return remoteDataSource.signup(user: user, password: password);
  }
}
