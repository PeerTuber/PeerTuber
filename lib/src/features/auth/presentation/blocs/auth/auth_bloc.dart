import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:peertuber/src/core/constants/enums.dart';
import 'package:peertuber/src/features/auth/domain/entities/logged_in_user.dart';
import 'package:peertuber/src/features/auth/domain/usecases/get_auth_status.dart';
import 'package:peertuber/src/features/auth/domain/usecases/get_logged_in_user.dart';
import 'package:peertuber/src/features/auth/domain/usecases/logout_user.dart';
import 'package:peertuber/src/features/common/domain/usecases/usecase.dart';

part 'auth_event.dart';
part 'auth_state.dart';

@injectable
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final LogoutUser _logoutUser;
  final GetAuthStatus _getAuthStatus;
  final GetLoggedInUser _getLoggedInUser;

  late StreamSubscription _authStatusSubscription;

  AuthBloc({
    required LogoutUser logoutUser,
    required GetAuthStatus getAuthStatus,
    required GetLoggedInUser getLoggedInUser,
  })  : _logoutUser = logoutUser,
        _getAuthStatus = getAuthStatus,
        _getLoggedInUser = getLoggedInUser,
        super(const AuthState.unknown()) {
    on<AuthGetStatus>(_onGetStatus);
    on<AuthLogoutUser>(_onLogoutUser);

    _authStatusSubscription =
        _getAuthStatus(NoParams()).listen((AuthStatus status) {
      add(AuthGetStatus(status));
    });
  }

  void _onGetStatus(AuthGetStatus event, Emitter<AuthState> emit) async {
    switch (event.status) {
      case AuthStatus.authenticated:
        final user = await _getLoggedInUser(NoParams());
        emit(AuthState.authenticated(user: user));
        break;
      case AuthStatus.unauthenticated:
        emit(const AuthState.unauthenticated());
        break;
      default:
        emit(const AuthState.unknown());
    }
  }

  void _onLogoutUser(AuthLogoutUser event, Emitter<AuthState> emit) async {
    await _logoutUser(NoParams());
    emit(const AuthState.unauthenticated());
  }

  @override
  Future<void> close() {
    _authStatusSubscription.cancel();
    return super.close();
  }
}
