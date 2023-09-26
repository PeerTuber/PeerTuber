import 'package:dartz/dartz.dart';
import 'package:peertuber/src/core/error/exceptions.dart';
import 'package:peertuber/src/core/error/failures.dart';
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
  LoggedInUser get loggedInUser => remoteDataSource.loggedInUser;

  @override
  Stream<AuthStatus> get status => remoteDataSource.status;

  @override
  Future<Either<Failure, LoggedInUser>> login(
      Username username, Password password) async {
    try {
      final user = await remoteDataSource.login(username, password);
      return Right(user);
    } on ServerException {
      return const Left(ServerFailure());
    }
  }

  @override
  Future<void> logout() {
    return remoteDataSource.logout();
  }

  @override
  Future<Either<Failure, void>> signup(
      {required LoggedInUser user, required Password password}) async {
    try {
      await remoteDataSource.signup(user: user, password: password);
      return const Right(null);
    } on SignupFailure catch (failure) {
      return Left(failure);
    }
  }
}
