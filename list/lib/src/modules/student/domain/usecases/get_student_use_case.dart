import 'package:dartz/dartz.dart';
import '../../../../utils/usecase.dart';
import '../entities/student_entity.dart';
import '../repositories/student_remote_repository.dart';

class GetStudentUseCase extends UseCaseWithParameter<StudentEntity, String> {
  GetStudentUseCase(this.repository);

  final StudentRemoteRepository repository;

  @override
  Future<Either<StudentEntity, Exception>> call(String params) async {
    return await repository.getStudent(params);
  }
}
