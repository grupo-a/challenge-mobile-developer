import 'package:dartz/dartz.dart';
import '../../../../utils/usecase.dart';
import '../entities/student_entity.dart';
import '../repositories/student_local_repository.dart';

class SaveStudentUseCase extends UseCaseWithParameter<void, StudentEntity> {
  SaveStudentUseCase(this.repository);

  final StudentLocalRepository repository;

  @override
  Future<Either<void, Exception>> call(StudentEntity params) async {
    return await repository.saveStudent(params);
  }
}
