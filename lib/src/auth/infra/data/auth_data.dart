import 'package:toro_mobile/src/auth/domain/entities/logged_user.dart';
import 'package:toro_mobile/src/auth/domain/useCases/login_usecase.dart';

abstract class AuthData {
  Future<LoggedUser> login(CredentialParams params);
}
