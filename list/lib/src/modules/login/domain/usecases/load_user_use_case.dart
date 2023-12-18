import 'package:dartz/dartz.dart';
import '../../../../utils/usecase.dart';
import '../repositories/login_repository.dart';

class LoadUserUseCase extends UseCase<String?> {
  LoadUserUseCase(this.repository);

  final LoginRepository repository;

  @override
  Future<Either<String?, Exception>> execute() async {
    return await repository.loadUser();
  }
}
