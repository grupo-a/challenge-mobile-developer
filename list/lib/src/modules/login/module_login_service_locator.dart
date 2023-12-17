import 'package:core_services/core_services.dart';

import 'login_service_locator_config.dart';

class ModuleLoginServiceLocator implements ServiceLocatorModuleConfig {
  final List<ServiceLocatorConfig> _features = [
    LoginServiceLocatorConfig(),
  ];

  @override
  void setup(ServiceLocatorWrapper sl) {
    for (var serviceLocatorConfig in _features) {
      serviceLocatorConfig.configure(sl);
    }
  }
}
