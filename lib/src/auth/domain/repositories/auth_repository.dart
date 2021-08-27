import 'package:dartz/dartz.dart';
import 'package:toro_mobile/src/auth/domain/entities/logged_user.dart';
import 'package:toro_mobile/src/auth/domain/errors/errors.dart';
import 'package:toro_mobile/src/auth/domain/useCases/login_usecase.dart';

abstract class AuthRepository {
  Future<Either<AuthException, LoggedUser>> login(CredentialParams params);
}
