import '../entities/login_entity.dart';

abstract class LoginRemoteDataSource {
  Future<LoginEntity> getToken(LoginEntity params);
  Future<LoginEntity> resgisterUser(LoginEntity params);
}

abstract class LoginLocalDataSource {
  Future<void> saveUser(LoginEntity params);
  Future<String?> loadUser();
}
