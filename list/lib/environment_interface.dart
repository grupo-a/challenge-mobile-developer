abstract class EnvironmentInterface {
  static void initialize() {
    api = const String.fromEnvironment('api');
  }

  static late final String api;
}
