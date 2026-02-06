import 'package:flutter/material.dart';
import 'package:my_project/data/repository/user_repository_impl.dart';
import 'package:my_project/data/storage/shared_prefs_storage.dart';
import 'package:my_project/domain/services/auth_service.dart';
import 'package:my_project/domain/services/validation_service.dart';
import 'package:my_project/features/auth/auth_controller.dart';
import 'package:my_project/pages/home_page.dart';
import 'package:my_project/pages/login_page.dart';
import 'package:my_project/pages/user_page.dart';

void main() {
  final storage = SharedPrefsStorage();
  final userRepository = UserRepositoryImpl(storage);
  final validationService = ValidationService();
  final authService = AuthService(userRepository, validationService);
  final authController = AuthController(authService);
  runApp(MyApp(authController: authController));
}

class MyApp extends StatelessWidget {
  final AuthController authController;

  const MyApp({required this.authController, super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Magic Counter',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: LoginPage(authController: authController),
    );
  }
}

class MainNavigation extends StatefulWidget {
  final AuthController authController;

  const MainNavigation({required this.authController, super.key});

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  int _selectedIndex = 0;

  // List of pages to show
  List<Widget> get _pages => [UserPage(authController: widget.authController,), 
  const HomePage()];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'User'),
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        ],
      ),
    );
  }
}
