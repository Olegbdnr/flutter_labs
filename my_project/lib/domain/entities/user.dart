class User {
  final String email;
  final String password;
  final String name;

  User({
    required this.email,
    required this.password,
    required this.name,
  });

  Map<String, dynamic> toJson() => {
    'email': email,
    'password': password,
    'name': name,
  };

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      email: json['email'] as String,
      password: json['password'] as String,
      name: json['name'] as String,
    );
  }
}
