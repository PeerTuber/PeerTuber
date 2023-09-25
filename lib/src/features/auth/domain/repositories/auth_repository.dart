import 'package:peertuber/src/features/auth/data/datasources/remote_auth_data_source.dart';
import 'package:peertuber/src/features/auth/domain/entities/logged_in_user.dart';
import 'package:peertuber/src/features/common/domain/entities/entities.dart';

abstract class AuthRepository {
  Stream<AuthStatus> get status;
  Future<LoggedInUser> get loggedInUser;
  Future<LoggedInUser> login(Username username, Password password);
  Future<void> signup({required LoggedInUser user, required Password password});
  Future<void> logout();
}
