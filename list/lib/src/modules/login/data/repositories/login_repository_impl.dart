import 'package:dartz/dartz.dart';
import '../../domain/datasources/login_datasource.dart';
import '../../domain/entities/login_entity.dart';
import '../../domain/repositories/login_repository.dart';

class LoginRepositoryImpl implements LoginRepository {
  LoginRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
  });

  final LoginRemoteDataSource remoteDataSource;
  final LoginLocalDataSource localDataSource;

  @override
  Future<Either<LoginEntity, Exception>> getToken(LoginEntity params) async {
    try {
      var response = await remoteDataSource.getToken(params);
      return Left<LoginEntity, Exception>(response);
    } catch (e) {
      return Right<LoginEntity, Exception>(
        Exception(
          e.toString(),
        ),
      );
    }
  }

  @override
  Future<Either<LoginEntity, Exception>> resgisterUser(
      LoginEntity params) async {
    try {
      var response = await remoteDataSource.resgisterUser(params);
      return Left<LoginEntity, Exception>(response);
    } catch (e) {
      return Right<LoginEntity, Exception>(
        Exception(
          e.toString(),
        ),
      );
    }
  }

  @override
  Future<Either<void, Exception>> saveUser(LoginEntity params) async {
    try {
      await localDataSource.saveUser(params);
      return const Left<void, Exception>(null);
    } catch (e) {
      return Right<LoginEntity, Exception>(
        Exception(
          e.toString(),
        ),
      );
    }
  }

  @override
  Future<Either<String?, Exception>> loadUser() async {
    try {
      var response = await localDataSource.loadUser();
      return Left<String?, Exception>(response);
    } catch (e) {
      return Right<String?, Exception>(
        Exception(
          e.toString(),
        ),
      );
    }
  }
}
