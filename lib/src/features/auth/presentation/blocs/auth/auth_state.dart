part of 'auth_bloc.dart';

class AuthState extends Equatable {
  final AuthStatus status;
  final LoggedInUser user;

  const AuthState._({
    this.status = AuthStatus.unknown,
    this.user = LoggedInUser.empty,
  });

  const AuthState.unknown() : this._();

  const AuthState.authenticated({required LoggedInUser user})
      : this._(status: AuthStatus.authenticated, user: user);

  const AuthState.unauthenticated()
      : this._(status: AuthStatus.unauthenticated);

  @override
  List<Object> get props => [status, user];
}
