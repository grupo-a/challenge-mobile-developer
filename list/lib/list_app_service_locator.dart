import 'package:core_services/core_services.dart';

import 'src/modules/login/module_login_service_locator.dart';

class ListAppSetupLocator {
  final List<ServiceLocatorModuleConfig> _modules = [
    ModuleLoginServiceLocator(),
  ];

  void setup(ServiceLocatorWrapper sl) {
    for (var serviceLocatorConfig in _modules) {
      serviceLocatorConfig.setup(sl);
    }
  }
}
