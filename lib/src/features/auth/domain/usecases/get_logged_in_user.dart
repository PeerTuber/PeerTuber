import 'package:injectable/injectable.dart';
import 'package:peertuber/src/features/auth/domain/entities/logged_in_user.dart';
import 'package:peertuber/src/features/auth/domain/repositories/auth_repository.dart';
import 'package:peertuber/src/features/common/domain/usecases/usecase.dart';

@lazySingleton
class GetLoggedInUser implements UseCase<LoggedInUser, NoParams> {
  final AuthRepository authRepository;

  GetLoggedInUser(this.authRepository);

  @override
  Future<LoggedInUser> call(NoParams params) async {
    return authRepository.loggedInUser;
  }
}
