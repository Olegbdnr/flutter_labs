import 'package:flutter/material.dart';
import 'package:my_project/text_styles.dart';

class BasicButton extends StatelessWidget {
  final String text;

  const BasicButton(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const UpcomingChangesPage(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue.withValues(alpha: 0.8),
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 10,
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
