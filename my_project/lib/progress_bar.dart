import 'package:flutter/material.dart';
import 'package:my_project/text_styles.dart';

class ProgressBar extends StatelessWidget {
  final String title;
  final double progress; // value from 0.0 to 1.0

  const ProgressBar({
    super.key,
    required this.title,
    required this.progress,
  });

  Color getProgressColor(double value) {
    if (value >= 0.7) return Colors.green;
    if (value >= 0.4) return Colors.orange;
    return Colors.red;
  }

  @override
  Widget build(BuildContext context) {
    final color = getProgressColor(progress);
    final percent = (progress * 100).clamp(0, 100).toInt();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        title,
        style: AppTextStyles.main(context),
      ),
      const SizedBox(height: 6),
      Row(
        children: [
          // Progress bar
          Expanded(
            child: Stack(
              children: [
                // Background bar
                Container(
                  height: 5,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                // Foreground (progress)
                FractionallySizedBox(
                  widthFactor: progress.clamp(0.0, 1.0),
                  child: Container(
                    height: 5,
                    decoration: BoxDecoration(
                      color: color,
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          // Percentage
          Text(
            '$percent%',
            style: AppTextStyles.main(
              context,
              color: color 
            ),
          ),
        ],
      ),
    ],
    );
  }
}
