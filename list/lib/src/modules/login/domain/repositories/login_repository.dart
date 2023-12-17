import 'package:dartz/dartz.dart';
import '../entities/login_entity.dart';

abstract class LoginRepository {
  Future<Either<LoginEntity, Exception>> getToken(LoginEntity params);
  Future<Either<LoginEntity, Exception>> resgisterUser(LoginEntity params);
  Future<Either<void, Exception>> saveUser(LoginEntity params);
  Future<Either<String?, Exception>> loadUser();
}
