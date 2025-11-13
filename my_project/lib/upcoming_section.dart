import 'package:flutter/material.dart';
import 'package:my_project/progress_bar.dart';
import 'package:my_project/text_styles.dart';

class UpcomingSection extends StatelessWidget {
  const UpcomingSection({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.all(20),
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.blue.withValues(alpha: 0.3)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 8),
              child: Text(
                'Upcoming changes:',
                style: AppTextStyles.sectionHeading(context),
              ),
            ),
            for (final progress in [0.79, 0.21, 0.5])
              Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 15,
                ),
                margin: const EdgeInsets.only(top: 10),
                width: width * 0.90,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: ProgressBar(title: 'Oil change', progress: progress),
              ),
            Center(
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
                  backgroundColor: Colors.blue.withValues(
                    alpha: 0.8,
                  ), // 👈 light blue
                  foregroundColor: Colors.white, // 👈 text color
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                ),
                child: Text(
                  'See more >>',
                  style: AppTextStyles.lightButton(context),
                ),
              ),
            ),
          ],
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