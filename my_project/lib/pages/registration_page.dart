import 'package:flutter/material.dart';
import 'package:my_project/styles/box_styles.dart';
import 'package:my_project/styles/text_styles.dart';
import 'package:my_project/utils/app_responsive.dart';
import 'package:my_project/widgets/deafult_blue_btn.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  String? choosedCar = '';

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
                      fit: BoxFit.contain,
                    ),
                    'bmw' => Image.asset(
                      'assets/bmw.png',
                      width: r.image(280),
                      fit: BoxFit.contain,
                    ),
                    'audi' => Image.asset(
                      'assets/audi.png',
                      width: r.image(280),
                      fit: BoxFit.contain,
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
                    items: [
                      const DropdownMenuItem(value: '', child: Text('None')),
                      const DropdownMenuItem(
                        value: 'porsche',
                        child: Text('Porsche 911'),
                      ),
                      const DropdownMenuItem(value: 'bmw', child: Text('BMW M5')),
                      const DropdownMenuItem(
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
                    decoration: AppBoxStyles.inputDecoration(
                      textLabel: 'Milieage in km',
                    ),
                  ),
                  TextFormField(
                    decoration: AppBoxStyles.inputDecoration(textLabel: 'Email'),
                  ),
                  TextFormField(
                    decoration: AppBoxStyles.inputDecoration(
                      textLabel: 'Password',
                    ),
                  ),
                  TextFormField(
                    decoration: AppBoxStyles.inputDecoration(textLabel: 'Name'),
                  ),
                  const SizedBox(height: 10),
                  BasicButton(
                    'Register',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute<Widget>(
                          builder: (context) => const Placeholder(),
                        ),
                      );
                    },
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
