import 'package:flutter/material.dart';
import 'package:my_project/features/auth/auth_controller.dart';
import 'package:my_project/pages/login_page.dart';
import 'package:my_project/styles/box_styles.dart';
import 'package:my_project/styles/text_styles.dart';
import 'package:my_project/utils/app_responsive.dart';
import 'package:my_project/widgets/deafult_blue_btn.dart';
import 'package:my_project/widgets/info_raw.dart';

class UserPage extends StatelessWidget {
  final AuthController authController;

  const UserPage({required this.authController, super.key});

  @override
  Widget build(BuildContext context) {
    final r = AppResponsive.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('CarInfo', style: AppTextStyles.appBarTittle(context)),
        backgroundColor: Colors.white,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: r.spacing(20),
              vertical: r.spacing(20),
            ),
            child: Center(
              child: Column(
                children: [
                  Row(
                    spacing: r.spacing(40),
                    children: [
                      Image.asset(
                        'assets/avatar1.png',
                        width: r.image(110),
                        fit: BoxFit.contain,
                      ),
                      Text('User Name', style: AppTextStyles.heading(context)),
                    ],
                  ),
                  SizedBox(height: r.h(40)),
                  DecoratedBox(
                    decoration: AppBoxStyles.basicContainer(context),
                    child: Padding(
                      padding: EdgeInsets.all((r.spacing(20))),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Your Car:',
                                style: AppTextStyles.sectionHeading(context),
                              ),
                              const Icon(Icons.edit),
                            ],
                          ),
                          Center(
                            child: Image.asset(
                              'assets/porsche911white.png',
                              width: r.image(200),
                              fit: BoxFit.contain,
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            spacing: r.spacing(5),
                            children: const [
                              InfoRow(
                                label: 'Name:',
                                value: 'Porsche 911 turboS',
                              ),
                              InfoRow(label: 'Weight:', value: '2434 kg'),
                              InfoRow(label: 'Max speed:', value: '270 km/h'),
                              InfoRow(
                                label: 'Length/width:',
                                value: '3990/1734 cm',
                              ),
                              InfoRow(
                                label: 'Acceleration (0-100 km):',
                                value: '2.9 s',
                              ),
                              InfoRow(label: 'Mileage:', value: '88 932 km'),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: r.h(20)),
                  DecoratedBox(
                    decoration: AppBoxStyles.basicContainer(context),
                    child: Padding(
                      padding: EdgeInsetsGeometry.all(r.spacing(20)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        spacing: r.spacing(5),
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Last Maintenance:',
                                style: AppTextStyles.sectionHeading(context),
                              ),
                              IconButton(
                                onPressed: () => {},
                                icon: const Icon(Icons.edit),
                              ),
                            ],
                          ),
                          SizedBox(height: r.spacing(15)),
                          const InfoRow(
                            icon: Icons.oil_barrel_rounded,
                            label: 'Oil change at:',
                            value: '87 299 km',
                          ),
                          const InfoRow(
                            icon: Icons.local_car_wash,
                            label: 'Wash at:',
                            value: '87 450 km',
                          ),
                          const InfoRow(
                            icon: Icons.account_tree_rounded,
                            label: 'Chassis check:',
                            value: '85 165 km',
                          ),
                          const InfoRow(
                            icon: Icons.account_tree_rounded,
                            label: 'Chassis check:',
                            value: '85 165 km',
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: r.h(20)),
                  BasicButton(
                    'Log out',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute<Widget>(
                          builder: (context) => LoginPage(
                            authController: authController,
                          ),
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
