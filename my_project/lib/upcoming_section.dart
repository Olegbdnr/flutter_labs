import 'package:flutter/material.dart';
import 'package:my_project/deafult_blue_btn.dart';
import 'package:my_project/progress_bar.dart';
import 'package:my_project/text_styles.dart';

class UpcomingSection extends StatelessWidget {
  const UpcomingSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.blue.withValues(alpha: 0.3)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // SECTION TITLE
            Padding(
              padding: const EdgeInsets.only(left: 8),
              child: Text(
                'Upcoming changes:',
                style: AppTextStyles.sectionHeading(context),
              ),
            ),

            const SizedBox(height: 10),

            // PROGRESS CARDS — responsive width
            ...[0.79, 0.21, 0.5].map((progress) {
              return Container(
                margin: const EdgeInsets.only(bottom: 12),
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    const BoxShadow(
                      color: Colors.black12,
                      blurRadius: 4,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: ProgressBar(
                  title: 'Oil change',
                  progress: progress,
                ),
              );
            }),

            const SizedBox(height: 4),

            const BasicButton('See more >>')
          ],
        ),
      ),
    );
  }
}
