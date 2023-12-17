import 'package:core_services/core_services.dart';

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
      () => LoginStore(
        coreStorage: CoreStorage(),
      ),
    );
  }

  @override
  void registerDataSources(ServiceLocatorWrapper sl) {}

  @override
  void registerRepositories(ServiceLocatorWrapper sl) {}

  @override
  void registerUseCases(ServiceLocatorWrapper sl) {}

  @override
  void registerServices(ServiceLocatorWrapper sl) {}
}
