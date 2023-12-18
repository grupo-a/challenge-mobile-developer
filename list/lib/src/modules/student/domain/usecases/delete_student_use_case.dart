import 'package:dartz/dartz.dart';
import '../../../../utils/usecase.dart';
import '../repositories/student_remote_repository.dart';

class DeleteStudentUseCase extends UseCaseWithParameter<void, String> {
  DeleteStudentUseCase(this.repository);

  final StudentRemoteRepository repository;

  @override
  Future<Either<void, Exception>> call(String params) async {
    return await repository.deleteStudent(params);
  }
}
