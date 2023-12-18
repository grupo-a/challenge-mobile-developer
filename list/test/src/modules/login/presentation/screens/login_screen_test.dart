import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lists_joao_nogueira/src/modules/login/presentation/screens/login_screen.dart';
import 'package:lists_joao_nogueira/src/modules/login/presentation/stores/login_store.dart';
import 'package:mockito/mockito.dart';

class MockLoginStore extends Mock implements LoginStore {}

void main() {
  group('LoginScreen', () {
    late LoginStore store;
    late MockLoginStore mockStore;

    setUp(() {
      store = LoginStore();
      mockStore = MockLoginStore();
    });

    testWidgets('should render the login screen', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: LoginScreen(),
        ),
      );

      expect(find.text('Login'), findsOneWidget);
      expect(find.text('Email'), findsOneWidget);
      expect(find.text('Password'), findsOneWidget);
      expect(find.text('Login'), findsOneWidget);
      expect(find.text('Register'), findsOneWidget);
    });

    testWidgets('should call the login method when the login button is pressed',
        (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: LoginScreen(),
        ),
      );

      when(mockStore.login()).thenReturn(Future.value(true));

      final loginButton = tester.widget<ElevatedButton>(
        find.text('Login'),
      );

      loginButton.onPressed?.call();

      verify(mockStore.login());
    });

    testWidgets('should call the register method when the register button is pressed',
        (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: LoginScreen(),
        ),
      );

      when(mockStore.register()).thenReturn(Future.value(true));

      final registerButton = tester.widget<ElevatedButton>(
        find.text('Register'),
      );

      registerButton.onPressed?.call();

      verify(mockStore.register());
    });

    testWidgets('should show an error message when the login fails', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: LoginScreen(),
        ),
      );

      when(mockStore.login()).thenReturn(Future.value(false));

      final loginButton = tester.widget<ElevatedButton>(
        find.text('Login'),
      );

      loginButton.onPressed?.call();

      expect(find.text('Login failed'), findsOneWidget);
    });

    testWidgets('should show an error message when the register fails', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: LoginScreen(),
        ),
      );

      when(mockStore.register()).thenReturn(Future.value(false));

      final registerButton = tester.widget<ElevatedButton>(
        find.text('Register'),
      );

      registerButton.onPressed?.call();

      expect(find.text('Register failed'), findsOneWidget);
    });
  });
}
