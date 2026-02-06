class ValidationService {
  bool isValidEmail(String email) => email.contains('@');

  bool isValidName(String name) =>
      !RegExp(r'\d').hasMatch(name);

  bool isValidPassword(String password) =>
      password.length >= 6;
}
