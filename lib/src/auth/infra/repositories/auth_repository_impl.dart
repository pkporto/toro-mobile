import 'package:toro_mobile/src/auth/domain/errors/errors.dart';
import 'package:toro_mobile/src/auth/domain/entities/logged_user.dart';
import 'package:dartz/dartz.dart';
import 'package:toro_mobile/src/auth/domain/repositories/auth_repository.dart';
import 'package:toro_mobile/src/auth/domain/useCases/login_usecase.dart';
import 'package:toro_mobile/src/auth/infra/data/auth_data.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthData data;

  AuthRepositoryImpl(this.data);

  @override
  Future<Either<AuthException, LoggedUser>> login(
      CredentialParams params) async {
    try {
      final user = await data.login(params);
      return Right(user);
    } on AuthException catch (e) {
      return Left(e);
    } on Exception {
      return Left(AuthException('Erro desconhecido'));
    }
  }
}
