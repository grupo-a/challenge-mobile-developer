import 'package:dartz/dartz.dart';
import '../../../../utils/usecase.dart';
import '../entities/login_entity.dart';
import '../repositories/login_repository.dart';

class PostUserUseCase extends UseCaseWithParameter<LoginEntity, LoginEntity> {
  PostUserUseCase(this.repository);

  final LoginRepository repository;

  @override
  Future<Either<LoginEntity, Exception>> call(LoginEntity params) async {
    return await repository.resgisterUser(params);
  }
}
