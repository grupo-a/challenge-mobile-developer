import 'package:dartz/dartz.dart';
import '../../../../utils/usecase.dart';
import '../entities/login_entity.dart';
import '../repositories/login_repository.dart';

class GetTokenUseCase
    extends UseCaseWithParameter<LoginEntity, LoginEntity> {
  GetTokenUseCase(this.repository);

  final LoginRepository repository;

  @override
  Future<Either<LoginEntity, Exception>> call(LoginEntity params) async {
    return await repository.getToken(params);
  }
}
