import 'package:core_services/core_services.dart';

import 'global_instance.dart';
import 'list_app_service_locator.dart';

class ListApp {
  static void setupLocator(ServiceLocatorWrapper serviceLocator) {
    sl = serviceLocator;
    ListAppSetupLocator().setup(sl);
  }
}
