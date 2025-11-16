import 'package:flutter/material.dart';
import 'package:my_project/styles/text_styles.dart';
import 'package:my_project/widgets/switch_button.dart';
import 'package:my_project/widgets/upcoming_section.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CarInfo', style: AppTextStyles.appBarTittle(context)),
        backgroundColor: Colors.white,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Image.asset(
                      'assets/porsche911white.png',
                      width: 280,
                      fit: BoxFit.contain,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'Porsche 911 Turbo S',
                    style: AppTextStyles.heading(context),
                  ),
                  const SizedBox(height: 20),
                  Wrap(
                    spacing: 26,
                    runSpacing: 20,
                    children: [
                      _buildControl(
                        icon: Icons.power_settings_new,
                        label: 'Start engine',
                      ),
                      _buildControl(icon: Icons.highlight, label: 'Headlights'),
                      _buildControl(
                        icon: Icons.door_back_door,
                        label: 'Open doors',
                      ),
                      _buildControl(
                        icon: Icons.cleaning_services,
                        label: 'Clean glass',
                      ),
                      _buildControl(
                        icon: Icons.volume_up_rounded,
                        label: 'Beep',
                      ),
                      _buildControl(icon: Icons.luggage, label: 'Open trunk'),
                    ],
                  ),
                  const SizedBox(height: 30),
                  const UpcomingSection(),
                  const SizedBox(height: 40),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildControl({required IconData icon, required String label}) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SwitchButton(icon: icon),
        const SizedBox(height: 6),
        Text(label),
      ],
    );
  }
}
