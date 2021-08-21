import 'package:flutter_test/flutter_test.dart';
import 'package:toro_mobile/src/auth/domain/entities/logged_user.dart';
import 'package:toro_mobile/src/auth/domain/errors/errors.dart';
import 'package:toro_mobile/src/auth/domain/repositories/auth_repository.dart';
import 'package:toro_mobile/src/auth/domain/useCases/login_usecase.dart';

class AuthRepositoryMock implements AuthRepository {
  @override
  Future<LoggedUser> login(CredentialParams params) async {
    return LoggedUser(
      email: params.email,
      cpf: '111',
      password: '',
    );
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

    expect(result, isA<LoggedUser>());
    expect(result.cpf, '111');
  });

  test('Error if password is empty', () async {
    final result = useCase.execute(CredentialParams(
      email: 'patrick@gmail.com',
      password: '',
    ));

    expect(() async => await result, throwsA(isA<AuthException>()));
  });
}
