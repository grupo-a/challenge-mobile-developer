import 'package:core_services/core_services.dart';
import 'package:flutter/material.dart';
import 'package:lists_joao_nogueira/src/utils/theme/theme_app.dart';
import 'list_app_routes.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'src/modules/login/presentation/screens/login_screen.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({
    super.key,
    required this.localizedValues,
  });

  final Map<String, Map<String, dynamic>> localizedValues;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        AppLocalizations.delegate(localizedValues),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('pt'),
      ],
      theme: theme,
      locale: const Locale('pt'),
      key: const Key("MaterialAppInitial"),
      debugShowCheckedModeBanner: false,
      title: 'Lists',
      navigatorKey: NavigationService.navigatorKey,
      initialRoute: ListAppRoutes.login,
      routes: {
        ListAppRoutes.login: (context) => const LoginScreen(),
        ListAppRoutes.studentList: (context) => Container(
              color: Colors.red,
            ),
      },
      // onGenerateRoute: (routeSettings) {
      //   return AppControllerImplementation().onGenerateRoute(routeSettings);
      // },
    );
  }
}
