
import 'package:core_services/core_services.dart';
import 'package:flutter/material.dart';
import 'app_widget.dart';
import 'environment_interface.dart';
import 'list_app_init.dart';
import 'src/modules/login/presentation/screens/splash_screen.dart';

Future<void> buildApp() async {
  EnvironmentInterface.initialize();
  runApp(
    const SplashScreen(),
  );
  WidgetsFlutterBinding.ensureInitialized();

  ListApp.setupLocator(GetItWrapper(GetIt.instance));
  var localizedValues = await I18n('assets/i18n/').initializeI18n();

  runApp(AppWidget(
    localizedValues: localizedValues,
  ));
}
