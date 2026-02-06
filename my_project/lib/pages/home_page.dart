import 'package:flutter/material.dart';
import 'package:my_project/styles/text_styles.dart';
import 'package:my_project/utils/app_responsive.dart';
import 'package:my_project/widgets/switch_button.dart';
import 'package:my_project/widgets/upcoming_section.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

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
          child: Center(
            child: Padding(
              padding: EdgeInsets.symmetric(
                vertical: 10,
                horizontal: r.spacing(20),
              ),
              child: Column(
                children: [
                  Image.asset(
                    'assets/porsche911white.png',
                    width: r.image(280),
                    fit: BoxFit.contain,
                  ),
                  Text(
                    'Porsche 911 Turbo S',
                    style: AppTextStyles.heading(context),
                  ),
                  SizedBox(height: r.h(20)),
                  Wrap(
                    spacing: r.w(26),
                    runSpacing: 20,
                    children: [
                      _buildControl(
                        context,
                        icon: Icons.power_settings_new,
                        label: 'Start engine',
                      ),
                      _buildControl(
                        context,
                        icon: Icons.highlight,
                        label: 'Headlights',
                      ),
                      _buildControl(
                        context,
                        icon: Icons.door_back_door,
                        label: 'Open doors',
                      ),
                      _buildControl(
                        context,
                        icon: Icons.cleaning_services,
                        label: 'Clean glass',
                      ),
                      _buildControl(
                        context,
                        icon: Icons.volume_up_rounded,
                        label: 'Beep',
                      ),
                      _buildControl(
                        context,
                        icon: Icons.luggage,
                        label: 'Open trunk',
                      ),
                    ],
                  ),
                  SizedBox(height: r.spacing(30)),
                  const UpcomingSection(),
                  SizedBox(height: r.spacing(40)),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildControl(
    BuildContext context, {
    required IconData icon,
    required String label,
  }) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SwitchButton(icon: icon, buttonLabel: label),
        const SizedBox(height: 6),
      ],
    );
  }
}
