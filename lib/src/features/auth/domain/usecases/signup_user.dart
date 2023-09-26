import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:peertuber/src/core/error/failures.dart';
import 'package:peertuber/src/features/auth/domain/entities/logged_in_user.dart';
import 'package:peertuber/src/features/auth/domain/repositories/auth_repository.dart';
import 'package:peertuber/src/features/common/domain/usecases/usecase.dart';

@lazySingleton
class SignupUser implements UseCase<void, SignupUserParams> {
  final AuthRepository authRepository;

  SignupUser(this.authRepository);

  @override
  Future<Either<Failure, void>> call(SignupUserParams params) async {
    return await authRepository.signup(
        user: params.user, password: params.password);
  }
}

class SignupUserParams extends Params {
  final LoggedInUser user;
  final Password password;

  SignupUserParams({required this.user, required this.password});

  @override
  List<dynamic> get props => [user, password];
}
