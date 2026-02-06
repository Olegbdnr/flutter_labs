import 'package:my_project/data/repository/user_repository.dart';
import 'package:my_project/domain/entities/user.dart';
import 'package:my_project/domain/services/validation_service.dart';

class AuthService {
  final UserRepository repository;
  final ValidationService validator;

  AuthService(this.repository, this.validator);

  Future<void> register(User user) async {
    if (!validator.isValidEmail(user.email)) {
      throw Exception('Invalid email');
    }
    if (!validator.isValidName(user.name)) {
      throw Exception('Invalid name');
    }
    if (!validator.isValidPassword(user.password)) {
      throw Exception('Weak password');
    }

    await repository.saveUser(user);
  }

  Future<bool> login(String email, String password) async {
    final user = await repository.getUser();
    if (user == null) return false;

    return user.email == email &&
           user.password == password;
  }
}
