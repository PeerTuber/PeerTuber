import 'package:equatable/equatable.dart';
import 'package:peertuber/src/core/constants/enums.dart';

abstract class Failure extends Equatable {
  const Failure([List properties = const <dynamic>[]]) : super();
}

class ServerFailure extends Failure {
  final String? message;

  const ServerFailure({this.message = 'Server Failure'});

  @override
  List<Object?> get props => [message];
}

class CacheFailure extends Failure {
  @override
  List<Object?> get props => [];
}

class NetworkFailure extends Failure {
  @override
  List<Object?> get props => [];
}

class SignupFailure extends Failure {
  final SignupFailureReason reason;
  final String? message;

  const SignupFailure({required this.reason, this.message});

  @override
  List<Object?> get props => [reason, message];
}

class LoginFailure extends Failure {
  final LoginFailureReason reason;

  const LoginFailure({required this.reason});

  static String fromReason(LoginFailureReason reason) {
    switch (reason) {
      case LoginFailureReason.credentialsNotValid:
        return 'Username or password is not valid';
      case LoginFailureReason.tokenExpired:
        return 'Loggin session expired. Please login again';
      case LoginFailureReason.clientKeyError:
        return 'There was a problem authenticating with the server. Please try again later';
      default:
        return 'Unknown error';
    }
  }

  @override
  List<Object?> get props => [reason];
}
