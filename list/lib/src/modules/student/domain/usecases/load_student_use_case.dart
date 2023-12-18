import 'package:dartz/dartz.dart';
import 'package:lists_joao_nogueira/src/modules/student/domain/entities/student_entity.dart';
import '../../../../utils/usecase.dart';
import '../repositories/student_local_repository.dart';

class LoadStudentUseCase extends UseCaseWithParameter<StudentEntity?, String> {
  LoadStudentUseCase(this.repository);

  final StudentLocalRepository repository;

  @override
  Future<Either<StudentEntity?, Exception>> call(String params) async {
    return await repository.loadStudent(params);
  }
}
