import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:peertuber/src/core/error/failures.dart';
import 'package:peertuber/src/features/auth/domain/entities/logged_in_user.dart';
import 'package:peertuber/src/features/auth/domain/usecases/login_user.dart';
import 'package:formz/formz.dart';

part 'login_state.dart';

@injectable
class LoginCubit extends Cubit<LoginState> {
  final LoginUser _loginUser;

  LoginCubit({required LoginUser loginUser})
      : _loginUser = loginUser,
        super(LoginState.initial());

  void usernameChanged(String value) {
    final username = Username.dirty(value);
    emit(state.copyWith(
      username: username,
      status: Formz.validate([username, state.password])
          ? FormzSubmissionStatus.success
          : FormzSubmissionStatus.canceled,
    ));
  }

  void passwordChanged(String value) {
    final password = Password.dirty(value);
    emit(state.copyWith(
      password: password,
      status: Formz.validate([password, state.username])
          ? FormzSubmissionStatus.success
          : FormzSubmissionStatus.canceled,
    ));
  }

  Future<void> loginWithCredentials() async {
    if (!state.status.isSuccess) return;
    emit(state.copyWith(status: FormzSubmissionStatus.inProgress));

    final result = await _loginUser(LoginUserParams(
      username: state.username,
      password: state.password,
    ));
    result.fold(
      (failure) {
        if (failure is LoginFailure) {
          emit(state.copyWith(
            status: FormzSubmissionStatus.failure,
            errorText: LoginFailure.fromReason(failure.reason),
          ));
        } else if (failure is ServerFailure) {
          emit(state.copyWith(
            status: FormzSubmissionStatus.failure,
            errorText: failure.message,
          ));
        }
      },
      (user) {
        emit(state.copyWith(
          status: FormzSubmissionStatus.success,
          errorText: null,
        ));
      },
    );
  }
}
