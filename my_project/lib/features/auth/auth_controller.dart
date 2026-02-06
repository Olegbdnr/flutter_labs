import 'package:my_project/domain/entities/user.dart';
import 'package:my_project/domain/services/auth_service.dart';

class AuthController {
  final AuthService authService;

  bool isLoggedIn = false;
  String? error;

  AuthController(this.authService);

  Future<void> login(String email, String password) async {
    error = null;

    final success = await authService.login(email, password);

    if (!success) {
      error = 'Login failed';
      isLoggedIn = false;
    } else {
      isLoggedIn = true;
    }
  }

  Future<void> register(User user) async {
    error = null;

    try {
      await authService.register(user);
    } catch (e) {
      error = e.toString();
      rethrow;
    }
  }
}
