import 'package:core_services/core_services.dart';
import 'domain/usecases/load_user_use_case.dart';
import 'domain/usecases/post_user_use_case.dart';
import 'domain/usecases/save_user_use_case.dart';
import 'data/datasources/login_local_data_source_impl.dart';
import 'data/datasources/login_remote_data_source_impl.dart';
import 'data/repositories/login_repository_impl.dart';
import 'domain/datasources/login_datasource.dart';
import 'domain/repositories/login_repository.dart';
import 'domain/usecases/get_login_use_case.dart';
import 'presentation/stores/login_store.dart';

class LoginServiceLocatorConfig
    implements ServiceLocatorConfigInternals, ServiceLocatorConfig {
  @override
  Future<void> configure(ServiceLocatorWrapper sl) async {
    registerManagerState(sl);
    registerUseCases(sl);
    registerRepositories(sl);
    registerDataSources(sl);
    registerServices(sl);
  }

  @override
  void registerManagerState(ServiceLocatorWrapper sl) {
    sl.registerFactory(
      () => LoginStore(),
    );
  }

  @override
  void registerDataSources(ServiceLocatorWrapper sl) {
    sl.registerLazySingleton<LoginRemoteDataSource>(() =>
        LoginRemoteDataSourceImpl(
            coreRequester: CoreHttpClient(customInterceptors: [])));
    sl.registerLazySingleton<LoginLocalDataSource>(
        () => LoginLocalDataSourceImpl(coreStorage: CoreStorage()));
  }

  @override
  void registerRepositories(ServiceLocatorWrapper sl) {
    sl.registerLazySingleton<LoginRepository>(() => LoginRepositoryImpl(
        localDataSource: sl<LoginLocalDataSource>(),
        remoteDataSource: sl<LoginRemoteDataSource>()));
  }

  @override
  void registerUseCases(ServiceLocatorWrapper sl) {
    sl.registerFactory(() => GetLoginUseCase(sl<LoginRepository>()));
    sl.registerFactory(() => LoadUserUseCase(sl<LoginRepository>()));
    sl.registerFactory(() => PostUserUseCase(sl<LoginRepository>()));
    sl.registerFactory(() => SaveUserUseCase(sl<LoginRepository>()));
  }

  @override
  void registerServices(ServiceLocatorWrapper sl) {}
}
