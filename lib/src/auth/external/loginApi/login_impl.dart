import 'package:toro_mobile/src/auth/domain/useCases/login_usecase.dart';
import 'package:toro_mobile/src/auth/domain/entities/logged_user.dart';
import 'package:toro_mobile/src/auth/infra/data/auth_data.dart';

class LoginImpl implements AuthData {
  @override
  Future<LoggedUser> login(CredentialParams params) async {
    return LoggedUser(email: 'Patrick', cpf: '111', password: '12');
  }
}
