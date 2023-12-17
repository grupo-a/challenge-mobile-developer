import 'package:dartz/dartz.dart';

abstract class UseCase<Type> {
  Future<Either<Type, dynamic>> execute();
}

abstract class UseCaseWithParameter<Type, Params> {
  Future<Either<Type, Exception>> call(Params params);
}
