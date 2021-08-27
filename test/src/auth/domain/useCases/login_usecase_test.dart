import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:toro_mobile/src/auth/domain/entities/logged_user.dart';
import 'package:toro_mobile/src/auth/domain/errors/errors.dart';
import 'package:toro_mobile/src/auth/domain/repositories/auth_repository.dart';
import 'package:toro_mobile/src/auth/domain/useCases/login_usecase.dart';

class AuthRepositoryMock implements AuthRepository {
  @override
  Future<Either<AuthException, LoggedUser>> login(
      CredentialParams params) async {
    // TODO: implement login
    return Right((LoggedUser(email: params.email, cpf: '123', password: '11')));
  }
}

void main() {
  final repository = AuthRepositoryMock();
  final useCase = LoginUseCase(repository);
  test('Login', () async {
    final result = await useCase.execute(CredentialParams(
      email: 'patrick@gmail.com',
      password: '123',
    ));

    expect(result.isRight(), true);
    // expect(result.cpf, '111');
  });

  test('Error if password is empty', () async {
    final result = await useCase.execute(CredentialParams(
      email: 'patrick@gmail.com',
      password: '',
    ));

    expect(result.isLeft(), true);
  });
}
