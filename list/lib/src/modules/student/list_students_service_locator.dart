import 'package:core_services/core_services.dart';
import 'presentation/stores/student_list_store.dart';
import 'data/datasources/student_local_data_source_impl.dart';
import 'data/datasources/student_remote_data_source_impl.dart';
import 'data/repositories/student_local_repository_impl.dart';
import 'data/repositories/student_remote_repository_impl.dart';
import 'domain/datasources/student_datasource.dart';
import 'domain/repositories/student_local_repository.dart';
import 'domain/repositories/student_remote_repository.dart';
import 'domain/usecases/delete_student_use_case.dart';
import 'domain/usecases/erase_student_use_case.dart';
import 'domain/usecases/fetch_students_use_case.dart';
import 'domain/usecases/save_students_use_case.dart';

class ListStudentsServiceLocatorConfig
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
      () => StudentListStore(),
    );
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
    sl.registerFactory(
        () => DeleteStudentUseCase(sl<StudentRemoteRepository>()));
    sl.registerFactory(() => EraseStudentUseCase(sl<StudentLocalRepository>()));
    sl.registerFactory(
        () => FetchStudentsUseCase(sl<StudentRemoteRepository>()));
    sl.registerFactory(() => SaveStudentsUseCase(sl<StudentLocalRepository>()));
  }

  @override
  void registerServices(ServiceLocatorWrapper sl) {}
}
