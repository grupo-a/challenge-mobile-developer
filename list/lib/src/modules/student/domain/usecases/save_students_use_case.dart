import 'package:dartz/dartz.dart';
import '../../../../utils/usecase.dart';
import '../entities/student_entity.dart';
import '../repositories/student_repository.dart';

class SaveStudentsUseCase extends UseCaseWithParameter<void, List<StudentEntity>> {
  SaveStudentsUseCase(this.repository);

  final StudentRepository repository;

  @override
  Future<Either<void, Exception>> call(List<StudentEntity> params) async {
    return await repository.saveStudents(params);
  }
}
