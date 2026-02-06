import 'dart:convert';
import 'package:my_project/data/repository/user_repository.dart';
import 'package:my_project/data/storage/local_storage.dart';
import 'package:my_project/domain/entities/user.dart';

class UserRepositoryImpl implements UserRepository {
  final LocalStorage storage;

  UserRepositoryImpl(this.storage);

  static const _userKey = 'user';

  @override
  Future<void> saveUser(User user) async {
    await storage.save(_userKey, jsonEncode(user.toJson()));
  }

  @override
  Future<User?> getUser() async {
    final data = await storage.read(_userKey);
    if (data == null) return null;
    return User.fromJson(
    jsonDecode(data) as Map<String, dynamic>,
    );
  }

  @override
  Future<void> deleteUser() async {
    await storage.delete(_userKey);
  }
}
