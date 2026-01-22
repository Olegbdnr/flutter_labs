import 'package:flutter/material.dart';
import 'package:my_project/main.dart';
import 'package:my_project/pages/registration_page.dart';
import 'package:my_project/styles/box_styles.dart';
import 'package:my_project/styles/text_styles.dart';
import 'package:my_project/utils/app_responsive.dart';
import 'package:my_project/widgets/deafult_blue_btn.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final r = AppResponsive.of(context);
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
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
                TextFormField(
                  decoration: AppBoxStyles.inputDecoration(textLabel: 'Email'),
                ),
                TextFormField(
                  decoration: AppBoxStyles.inputDecoration(
                    textLabel: 'Password',
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  spacing: r.spacing(20),
                  children: [
                    BasicButton(
                      'Login',
                      onPressed: () {
                        Navigator.push(
                        context,
                        MaterialPageRoute<Widget>(
                          builder: (context) => const MainNavigation(),
                        ),
                      );
                      },  
                    ),
                    BasicButton(
                      'Register',
                      onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute<Widget>(
                          builder: (context) => const RegistrationPage(),
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
    );
  }
}
