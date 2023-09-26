part of 'login_cubit.dart';

class LoginState extends Equatable {
  final Username username;
  final Password password;
  final FormzSubmissionStatus status;
  final String? errorText;

  const LoginState({
    this.username = const Username.pure(),
    this.password = const Password.pure(),
    this.status = FormzSubmissionStatus.initial,
    this.errorText,
  });

  factory LoginState.initial() {
    return const LoginState(
      username: Username.pure(),
      password: Password.pure(),
      status: FormzSubmissionStatus.initial,
      errorText: null,
    );
  }

  LoginState copyWith({
    Username? username,
    Password? password,
    FormzSubmissionStatus? status,
    String? errorText,
  }) {
    return LoginState(
      username: username ?? this.username,
      password: password ?? this.password,
      status: status ?? this.status,
      errorText: errorText ?? this.errorText,
    );
  }

  @override
  List<Object?> get props => [username, password, status, errorText];
}
