import 'package:injectable/injectable.dart';
import 'package:peertuber/src/features/auth/data/datasources/remote_auth_data_source.dart';
import 'package:peertuber/src/features/auth/domain/repositories/auth_repository.dart';
import 'package:peertuber/src/features/common/domain/usecases/usecase.dart';

@lazySingleton
class GetAuthStatus implements UseCase<Stream<AuthStatus>, NoParams> {
  final AuthRepository authRepository;

  GetAuthStatus(this.authRepository);

  @override
  Future<Stream<AuthStatus>> call(NoParams params) async {
    return authRepository.status;
  }
}
