import 'package:dartz/dartz.dart';
import '../../../../utils/usecase.dart';
import '../entities/student_entity.dart';
import '../repositories/student_remote_repository.dart';

class PostStudentUseCase extends UseCaseWithParameter<StudentEntity, StudentEntity> {
  PostStudentUseCase(this.repository);

  final StudentRemoteRepository repository;

  @override
  Future<Either<StudentEntity, Exception>> call(StudentEntity params) async {
    return await repository.postStudent(params);
  }
}
