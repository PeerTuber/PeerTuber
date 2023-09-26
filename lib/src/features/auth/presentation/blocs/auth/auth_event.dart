part of 'auth_bloc.dart';

sealed class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class AuthGetStatus extends AuthEvent {
  final AuthStatus status;

  const AuthGetStatus(this.status);

  @override
  List<Object> get props => [status];
}

class AuthLogoutUser extends AuthEvent {}
