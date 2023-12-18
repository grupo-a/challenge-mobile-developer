import 'package:core_services/core_services.dart';
import 'package:lists_joao_nogueira/src/modules/student/create_edit_students_service_locator.dart';
import 'list_students_service_locator.dart';

class ModuleStudentServiceLocator implements ServiceLocatorModuleConfig {
  final List<ServiceLocatorConfig> _features = [
    ListStudentsServiceLocatorConfig(),
    CreateEditStudentsServiceLocatorConfig(),
  ];

  @override
  void setup(ServiceLocatorWrapper sl) {
    for (var serviceLocatorConfig in _features) {
      serviceLocatorConfig.configure(sl);
    }
  }
}
