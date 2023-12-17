import 'package:core_services/core_services.dart';
import 'package:lists_joao_nogueira/environment_interface.dart';
import 'package:lists_joao_nogueira/src/modules/login/domain/entities/login_entity.dart';

import '../../domain/datasources/login_datasource.dart';
import '../models/login_model.dart';

class LoginRemoteDataSourceImpl implements LoginRemoteDataSource {
  final CoreRequester coreRequester;

  LoginRemoteDataSourceImpl({required this.coreRequester});

  @override
  Future<LoginModel> getToken(LoginEntity params) async {
    var response = await coreRequester.fetch(
      url:
          '${EnvironmentInterface.api}/login?email=${params.email}&password=${params.password}',
      fromJson: (value) => LoginModel.fromMap(value),
      fromJsonError: (value) => value,
    );

    return response;
  }

  @override
  Future<LoginModel> resgisterUser(LoginEntity params) async {
    var response = await coreRequester.post(
      url: '${EnvironmentInterface.api}/login',
      body: params.toJson(),
      fromJson: (value) => LoginModel.fromMap(value),
      fromJsonError: (value) => value,
    );

    return response;
  }
}
