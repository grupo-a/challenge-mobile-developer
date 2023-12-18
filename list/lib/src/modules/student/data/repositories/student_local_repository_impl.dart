import 'package:dartz/dartz.dart';
import '../../domain/datasources/student_datasource.dart';
import '../../domain/entities/student_entity.dart';
import '../../domain/repositories/student_local_repository.dart';

class StudentLocalRepositoryImpl implements StudentLocalRepository {
  StudentLocalRepositoryImpl({
    required this.localDataSource,
  });

  final StudentLocalDataSource localDataSource;

  @override
  Future<Either<void, Exception>> eraseStudent(String params) async {
    try {
      await localDataSource.eraseStudent(params);
      return const Left<void, Exception>(null);
    } catch (e) {
      return Right<void, Exception>(
        Exception(
          e.toString(),
        ),
      );
    }
  }

  @override
  Future<Either<StudentEntity?, Exception>> loadStudent(String params) async {
    try {
      var student = await localDataSource.loadStudent(params);
      return Left<StudentEntity?, Exception>(student);
    } catch (e) {
      return Right<StudentEntity?, Exception>(
        Exception(
          e.toString(),
        ),
      );
    }
  }

  @override
  Future<Either<void, Exception>> saveStudent(StudentEntity params) async {
    try {
      await localDataSource.saveStudent(params);
      return const Left<void, Exception>(null);
    } catch (e) {
      return Right<void, Exception>(
        Exception(
          e.toString(),
        ),
      );
    }
  }

  @override
  Future<Either<void, Exception>> saveStudents(List<StudentEntity> params) async {
    try {
      await localDataSource.saveStudents(params);
      return const Left<void, Exception>(null);
    } catch (e) {
      return Right<void, Exception>(
        Exception(
          e.toString(),
        ),
      );
    }
  }
}
