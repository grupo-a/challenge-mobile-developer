import 'package:core_services/core_services.dart';
import 'package:lists_joao_nogueira/src/modules/login/domain/entities/login_entity.dart';

import '../../domain/datasources/login_datasource.dart';

class LoginLocalDataSourceImpl implements LoginLocalDataSource {
  final CoreStorageInterface coreStorage;

  LoginLocalDataSourceImpl({required this.coreStorage});

  @override
  Future<void> saveUser(LoginEntity params) async {
    await coreStorage.saveToken(
      params.token!,
    );
    await coreStorage.save(
      key: 'userId',
      value: params.id!,
    );
  }

  @override
  Future<String?> loadUser() async {
    return await coreStorage.get(
      key: 'userId',
    );
  }
}
