import 'package:core_services/core_services.dart';
import 'data/datasources/student_local_data_source_impl.dart';
import 'data/datasources/student_remote_data_source_impl.dart';
import 'data/repositories/student_local_repository_impl.dart';
import 'data/repositories/student_remote_repository_impl.dart';
import 'domain/datasources/student_datasource.dart';
import 'domain/repositories/student_local_repository.dart';
import 'domain/repositories/student_remote_repository.dart';
import 'domain/usecases/get_student_use_case.dart';
import 'domain/usecases/load_student_use_case.dart';
import 'domain/usecases/post_student_use_case.dart';
import 'domain/usecases/put_student_use_case.dart';
import 'domain/usecases/save_student_use_case.dart';

class CreateEditStudentsServiceLocatorConfig
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
    // sl.registerFactory(
    //   () => LoginStore(),
    // );
  }

  @override
  void registerDataSources(ServiceLocatorWrapper sl) {
    sl.registerLazySingleton<StudentRemoteDataSource>(() =>
        StudentRemoteDataSourceImpl(
            coreRequester: CoreHttpClient(customInterceptors: [])));
    sl.registerLazySingleton<StudentLocalDataSource>(
        () => StudentLocalDataSourceImpl(coreStorage: HiveDatabase()));
  }

  @override
  void registerRepositories(ServiceLocatorWrapper sl) {
    sl.registerLazySingleton<StudentRemoteRepository>(() =>
        StudentRemoteRepositoryImpl(
            remoteDataSource: sl<StudentRemoteDataSource>()));
    sl.registerLazySingleton<StudentLocalRepository>(() =>
        StudentLocalRepositoryImpl(
            localDataSource: sl<StudentLocalDataSource>()));
  }

  @override
  void registerUseCases(ServiceLocatorWrapper sl) {
    sl.registerFactory(() => GetStudentUseCase(sl<StudentRemoteRepository>()));
    sl.registerFactory(() => LoadStudentUseCase(sl<StudentLocalRepository>()));
    sl.registerFactory(() => PostStudentUseCase(sl<StudentRemoteRepository>()));
    sl.registerFactory(() => PutStudentUseCase(sl<StudentRemoteRepository>()));
    sl.registerFactory(() => SaveStudentUseCase(sl<StudentLocalRepository>()));
  }

  @override
  void registerServices(ServiceLocatorWrapper sl) {}
}
