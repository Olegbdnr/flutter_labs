// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:my_project/data/repository/user_repository_impl.dart';
import 'package:my_project/data/storage/shared_prefs_storage.dart';
import 'package:my_project/domain/services/auth_service.dart';
import 'package:my_project/domain/services/validation_service.dart';
import 'package:my_project/features/auth/auth_controller.dart';
import 'package:my_project/main.dart';

void main() {
  final storage = SharedPrefsStorage();
  final userRepository = UserRepositoryImpl(storage);
  final validationService = ValidationService();
  final authService = AuthService(userRepository, validationService);
  final authController = AuthController(authService);

  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MyApp(authController: authController,));

    // Verify that our counter starts at 0.
    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);

    // Tap the '+' icon and trigger a frame.
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // Verify that our counter has incremented.
    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);
  });
}
