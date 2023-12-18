import 'package:dartz/dartz.dart';
import '../../../../utils/usecase.dart';
import '../repositories/student_local_repository.dart';

class EraseStudentUseCase extends UseCaseWithParameter<void, String> {
  EraseStudentUseCase(this.repository);

  final StudentLocalRepository repository;

  @override
  Future<Either<void, Exception>> call(String params) async {
    return await repository.eraseStudent(params);
  }
}
