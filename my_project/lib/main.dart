import 'package:flutter/material.dart';
import 'package:my_project/text_styles.dart';
import 'package:my_project/upcoming_section.dart';
// import 'package:my_project/magic_counter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Magic Counter',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const MyWidget(),
    );
  }
}

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text('CarInfo', style: AppTextStyles.appBarTittle(context)),
        backgroundColor: Colors.white,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Align(
            alignment: Alignment.topCenter, // ✅ keeps content centered
            child: Column(
              children: [
                SizedBox(
                  width: width * 0.50,
                  child: const Image(
                    image: AssetImage('assets/porsche911white.png'),
                  ),
                ),
                Text(
                  'Porsche 911 turbo S',
                  style: AppTextStyles.heading(context),
                ),
                const SizedBox(height: 10),
                const UpcomingSection(),
                const SizedBox(height: 40), // bottom padding for scroll
              ],
            ),
          ),
        ),
      ),
    );
  }
}


