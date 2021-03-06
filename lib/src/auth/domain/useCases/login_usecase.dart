import 'package:dartz/dartz.dart';
import 'package:toro_mobile/src/auth/domain/entities/logged_user.dart';
import 'package:toro_mobile/src/auth/domain/errors/errors.dart';
import 'package:toro_mobile/src/auth/domain/repositories/auth_repository.dart';

abstract class ILoginUseCase {
  Future<Either<AuthException, LoggedUser>> execute(CredentialParams params);
}

class LoginUseCase implements ILoginUseCase {
  final AuthRepository repository;

  LoginUseCase(this.repository);

  @override
  Future<Either<AuthException, LoggedUser>> execute(
      CredentialParams params) async {
    if (params.password.isEmpty) {
      return Left(AuthException('Senha vazia.'));
    }

    return await repository.login(params);
  }
}

class CredentialParams {
  final String email;
  final String password;
  // final String cpf;
  CredentialParams({required this.email, required this.password});
}
