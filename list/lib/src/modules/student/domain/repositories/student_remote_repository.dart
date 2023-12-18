import 'package:dartz/dartz.dart';
import '../entities/student_entity.dart';

abstract class StudentRemoteRepository {
  Future<Either<void, Exception>> deleteStudent(String params);
  Future<Either<List<StudentEntity>, Exception>> fetchStudents();
  Future<Either<StudentEntity, Exception>> getStudent(String params);
  Future<Either<StudentEntity, Exception>> postStudent(StudentEntity params);
  Future<Either<StudentEntity, Exception>> putStudent(StudentEntity params);
}
