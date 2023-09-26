import 'package:dartz/dartz.dart';
import 'package:peertuber/src/core/constants/enums.dart';
import 'package:peertuber/src/core/error/failures.dart';
import 'package:peertuber/src/features/auth/domain/entities/logged_in_user.dart';

abstract class AuthRepository {
  Stream<AuthStatus> get status;
  LoggedInUser get loggedInUser;
  Future<Either<Failure, LoggedInUser>> login(
      Username username, Password password);
  Future<Either<Failure, void>> signup(
      {required LoggedInUser user, required Password password});
  Future<void> logout();
}
