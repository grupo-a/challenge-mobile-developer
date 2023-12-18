import 'package:dartz/dartz.dart';
import '../../../../utils/usecase.dart';
import '../entities/login_entity.dart';
import '../repositories/login_repository.dart';

class GetLoginUseCase
    extends UseCaseWithParameter<LoginEntity, LoginEntity> {
  GetLoginUseCase(this.repository);

  final LoginRepository repository;

  @override
  Future<Either<LoginEntity, Exception>> call(LoginEntity params) async {
    return await repository.getToken(params);
  }
}
