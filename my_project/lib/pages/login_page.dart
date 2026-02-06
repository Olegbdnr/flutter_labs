import 'package:flutter/material.dart';
import 'package:my_project/features/auth/auth_controller.dart';
import 'package:my_project/main.dart';
import 'package:my_project/pages/registration_page.dart';
import 'package:my_project/styles/box_styles.dart';
import 'package:my_project/styles/text_styles.dart';
import 'package:my_project/utils/app_responsive.dart';
import 'package:my_project/widgets/deafult_blue_btn.dart';

class LoginPage extends StatefulWidget {
  final AuthController authController;

  const LoginPage({required this.authController, super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  String? errorMessage;

  Future<void> _onLoginPressed() async {
    await widget.authController.login(
      _emailController.text,
      _passwordController.text,
    );

    if (widget.authController.isLoggedIn) {
      Navigator.push(
        context,
        MaterialPageRoute<Widget>(
          builder: (context) => MainNavigation(
            authController: widget.authController
          )
        ),
      );
    } else {
      setState(() {
        errorMessage = widget.authController.error;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final r = AppResponsive.of(context);

    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: r.w(20)),
            child: Center(
              child: Column(
                spacing: 10,
                children: [
                  SizedBox(height: r.spacing(140)),
                  Text(
                    'Login',
                    style: AppTextStyles.appBarTittle(context, baseFontSize: 48),
                  ),
                  const SizedBox(height: 10),
          
                  /// EMAIL
                  TextFormField(
                    controller: _emailController,
                    decoration:
                        AppBoxStyles.inputDecoration(textLabel: 'Email'),
                  ),
          
                  /// PASSWORD
                  TextFormField(
                    controller: _passwordController,
                    obscureText: true,
                    decoration:
                        AppBoxStyles.inputDecoration(textLabel: 'Password'),
                  ),
          
                  if (errorMessage != null) ...[
                    const SizedBox(height: 8),
                    Text(
                      errorMessage!,
                      style: const TextStyle(color: Colors.red),
                    ),
                  ],
          
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    spacing: r.spacing(20),
                    children: [
                      BasicButton(
                        'Login',
                        onPressed: _onLoginPressed,
                      ),
                      BasicButton(
                        'Register',
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute<Widget>(
                              builder: (context) =>
                                  RegistrationPage(
                                    authController: widget.authController,
                                  ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
