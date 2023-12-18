import 'package:dartz/dartz.dart';
import '../../../../utils/usecase.dart';
import '../entities/student_entity.dart';
import '../repositories/student_remote_repository.dart';

class PutStudentUseCase extends UseCaseWithParameter<StudentEntity, StudentEntity> {
  PutStudentUseCase(this.repository);

  final StudentRemoteRepository repository;

  @override
  Future<Either<StudentEntity, Exception>> call(StudentEntity params) async {
    return await repository.putStudent(params);
  }
}
