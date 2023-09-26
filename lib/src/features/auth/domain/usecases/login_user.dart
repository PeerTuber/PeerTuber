import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:peertuber/src/core/error/failures.dart';
import 'package:peertuber/src/features/auth/domain/entities/logged_in_user.dart';
import 'package:peertuber/src/features/auth/domain/repositories/auth_repository.dart';
import 'package:peertuber/src/features/common/domain/entities/entities.dart';
import 'package:peertuber/src/features/common/domain/usecases/usecase.dart';

@lazySingleton
class LoginUser
    implements UseCase<Future<Either<Failure, LoggedInUser>>, LoginUserParams> {
  final AuthRepository authRepository;

  LoginUser(this.authRepository);

  @override
  Future<Either<Failure, LoggedInUser>> call(LoginUserParams params) async {
    return await authRepository.login(params.username, params.password);
  }
}

class LoginUserParams extends Params {
  final Username username;
  final Password password;

  LoginUserParams({required this.username, required this.password});

  @override
  List<dynamic> get props => [username, password];
}
