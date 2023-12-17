import 'package:dartz/dartz.dart';
import '../../../../utils/usecase.dart';
import '../entities/student_entity.dart';
import '../repositories/student_remote_repository.dart';

class FetchStudentsUseCase
    extends UseCase<List<StudentEntity>> {
  FetchStudentsUseCase(this.repository);

  final StudentRemoteRepository repository;

  @override
  Future<Either<List<StudentEntity>, Exception>> execute() async {
    return await repository.fetchStudents();
  }
}
