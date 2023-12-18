import 'package:dartz/dartz.dart';
import '../../domain/datasources/student_datasource.dart';
import '../../domain/entities/student_entity.dart';
import '../../domain/repositories/student_remote_repository.dart';

class StudentRemoteRepositoryImpl implements StudentRemoteRepository {
  StudentRemoteRepositoryImpl({
    required this.remoteDataSource,
  });

  final StudentRemoteDataSource remoteDataSource;

  @override
  Future<Either<void, Exception>> deleteStudent(String params) async {
    try {
      await remoteDataSource.deleteStudent(params);
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
  Future<Either<List<StudentEntity>, Exception>> fetchStudents() async {
    try {
      var list = await remoteDataSource.fetchStudents();
      return Left<List<StudentEntity>, Exception>(list);
    } catch (e) {
      return Right<List<StudentEntity>, Exception>(
        Exception(
          e.toString(),
        ),
      );
    }
  }

  @override
  Future<Either<StudentEntity, Exception>> getStudent(String params) async {
    try {
      var student = await remoteDataSource.getStudent(params);
      return Left<StudentEntity, Exception>(student);
    } catch (e) {
      return Right<StudentEntity, Exception>(
        Exception(
          e.toString(),
        ),
      );
    }
  }

  @override
  Future<Either<StudentEntity, Exception>> postStudent(
      StudentEntity params) async {
    try {
      var student = await remoteDataSource.postStudent(params);
      return Left<StudentEntity, Exception>(student);
    } catch (e) {
      return Right<StudentEntity, Exception>(
        Exception(
          e.toString(),
        ),
      );
    }
  }

  @override
  Future<Either<StudentEntity, Exception>> putStudent(
      StudentEntity params) async {
    try {
      var student = await remoteDataSource.putStudent(params);
      return Left<StudentEntity, Exception>(student);
    } catch (e) {
      return Right<StudentEntity, Exception>(
        Exception(
          e.toString(),
        ),
      );
    }
  }
}
