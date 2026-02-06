import 'package:flutter/material.dart';
import 'package:my_project/domain/entities/user.dart';
import 'package:my_project/features/auth/auth_controller.dart';
import 'package:my_project/styles/box_styles.dart';
import 'package:my_project/styles/text_styles.dart';
import 'package:my_project/utils/app_responsive.dart';
import 'package:my_project/widgets/deafult_blue_btn.dart';

class RegistrationPage extends StatefulWidget {
  final AuthController authController;

  const RegistrationPage({
    required this.authController,
    super.key,
  });

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  String? choosedCar = '';

  final TextEditingController _mileageController =
      TextEditingController();
  final TextEditingController _emailController =
      TextEditingController();
  final TextEditingController _passwordController =
      TextEditingController();
  final TextEditingController _nameController =
      TextEditingController();

  String? errorMessage;

  Future<void> _onRegisterPressed() async {
    try {
      final user = User(
        email: _emailController.text,
        password: _passwordController.text,
        name: _nameController.text,
      );

      await widget.authController.register(user);

      Navigator.pop(context);
    } catch (e) {
      setState(() {
        errorMessage = e.toString();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final r = AppResponsive.of(context);

    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: r.w(20)),
            child: Center(
              child: Column(
                spacing: 10,
                children: [
                  SizedBox(height: r.spacing(140)),

                  switch (choosedCar) {
                    'porsche' => Image.asset(
                        'assets/porsche911white.png',
                        width: r.image(280),
                      ),
                    'bmw' => Image.asset(
                        'assets/bmw.png',
                        width: r.image(280),
                      ),
                    'audi' => Image.asset(
                        'assets/audi.png',
                        width: r.image(280),
                      ),
                    _ => Text(
                        'CarInfo',
                        style: AppTextStyles.appBarTittle(
                          context,
                          baseFontSize: 48,
                        ),
                      ),
                  },

                  const SizedBox(height: 10),

                  DropdownButtonFormField(
                    decoration: AppBoxStyles.inputDecoration(
                      textLabel: 'Chose your car',
                    ),
                    items: const [
                      DropdownMenuItem(value: '', child: Text('None')),
                      DropdownMenuItem(
                        value: 'porsche',
                        child: Text('Porsche 911'),
                      ),
                      DropdownMenuItem(
                        value: 'bmw',
                        child: Text('BMW M5'),
                      ),
                      DropdownMenuItem(
                        value: 'audi',
                        child: Text('Audi R8'),
                      ),
                    ],
                    onChanged: (value) {
                      setState(() {
                        choosedCar = value;
                      });
                    },
                  ),

                  TextFormField(
                    controller: _mileageController,
                    decoration: AppBoxStyles.inputDecoration(
                      textLabel: 'Mileage in km',
                    ),
                    keyboardType: TextInputType.number,
                  ),

                  TextFormField(
                    controller: _emailController,
                    decoration:
                        AppBoxStyles.inputDecoration(textLabel: 'Email'),
                  ),

                  TextFormField(
                    controller: _passwordController,
                    obscureText: true,
                    decoration:
                        AppBoxStyles.inputDecoration(textLabel: 'Password'),
                  ),

                  TextFormField(
                    controller: _nameController,
                    decoration:
                        AppBoxStyles.inputDecoration(textLabel: 'Name'),
                  ),

                  if (errorMessage != null) ...[
                    const SizedBox(height: 8),
                    Text(
                      errorMessage!,
                      style: const TextStyle(color: Colors.red),
                    ),
                  ],

                  const SizedBox(height: 10),

                  BasicButton(
                    'Register',
                    onPressed: _onRegisterPressed,
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
