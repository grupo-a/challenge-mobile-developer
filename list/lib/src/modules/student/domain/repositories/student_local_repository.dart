import 'package:dartz/dartz.dart';
import '../entities/student_entity.dart';

abstract class StudentLocalRepository {
  Future<Either<void, Exception>> eraseStudent(String params);
  Future<Either<StudentEntity?, Exception>> loadStudent(String params);
  Future<Either<void, Exception>> saveStudent(StudentEntity params);
  Future<Either<void, Exception>> saveStudents(List<StudentEntity> params);
}
