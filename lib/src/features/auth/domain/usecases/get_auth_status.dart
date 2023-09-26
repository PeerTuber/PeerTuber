import 'package:injectable/injectable.dart';
import 'package:peertuber/src/core/constants/enums.dart';
import 'package:peertuber/src/features/auth/domain/repositories/auth_repository.dart';
import 'package:peertuber/src/features/common/domain/usecases/usecase.dart';

@lazySingleton
class GetAuthStatus implements UseCase<Stream<AuthStatus>, NoParams> {
  final AuthRepository authRepository;

  GetAuthStatus(this.authRepository);

  @override
  Stream<AuthStatus> call(NoParams params) {
    return authRepository.status;
  }
}
