import '../entities/student_entity.dart';

abstract class StudentRemoteDataSource {
  Future<void> deleteStudent(String params);
  Future<List<StudentEntity>> fetchStudents();
  Future<StudentEntity> getStudent(String params);
  Future<StudentEntity> postStudent(StudentEntity params);
  Future<StudentEntity> putStudent(StudentEntity params);
}

abstract class StudentLocalDataSource {
  Future<void> editStudent(StudentEntity params);
  Future<void> eraseStudent(String params);
  Future<StudentEntity> loadStudent(String params);
  Future<void> saveStudent(StudentEntity params);
  Future<void> saveStudents(List<StudentEntity> params);
}
