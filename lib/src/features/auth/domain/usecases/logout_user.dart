import 'package:injectable/injectable.dart';
import 'package:peertuber/src/features/auth/domain/repositories/auth_repository.dart';
import 'package:peertuber/src/features/common/domain/usecases/usecase.dart';

@lazySingleton
class LogoutUser implements UseCase<void, NoParams> {
  final AuthRepository authRepository;

  LogoutUser(this.authRepository);

  @override
  Future<void> call(NoParams params) async {
    return await authRepository.logout();
  }
}
