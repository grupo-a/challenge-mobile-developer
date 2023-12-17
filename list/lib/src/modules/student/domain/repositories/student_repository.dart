import 'package:dartz/dartz.dart';
import '../entities/student_entity.dart';

abstract class StudentRepository {
  Future<Either<void, Exception>> deleteStudent(String params);
  Future<Either<void, Exception>> editStudent(StudentEntity params);
  Future<Either<void, Exception>> eraseStudent(String params);
  Future<Either<List<StudentEntity>, Exception>> fetchStudents();
  Future<Either<StudentEntity, Exception>> getStudent(String params);
  Future<Either<StudentEntity, Exception>> loadStudent(String params);
  Future<Either<StudentEntity, Exception>> postStudent(StudentEntity params);
  Future<Either<StudentEntity, Exception>> putStudent(StudentEntity params);
  Future<Either<void, Exception>> saveStudent(StudentEntity params);
  Future<Either<void, Exception>> saveStudents(List<StudentEntity> params);
}
