import 'package:flutter/material.dart';
import 'package:my_project/styles/text_styles.dart';
import 'package:my_project/utils/app_responsive.dart';

class BasicButton extends StatelessWidget {
  final String text;

  const BasicButton(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    final r = AppResponsive.of(context);

    return Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute<Widget>(
                      builder: (context) => const UpcomingChangesPage(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue.withValues(alpha: 0.8),
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(r.w(24)),
                  ),
                  padding: EdgeInsets.symmetric(
                    horizontal: r.h(20),
                    vertical: r.w(10),
                  ),
                ),
                child: Text(
                  text,
                  style: AppTextStyles.lightButton(context),
                ),
              ),
            );
  }
}


class UpcomingChangesPage extends StatelessWidget {
  const UpcomingChangesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
