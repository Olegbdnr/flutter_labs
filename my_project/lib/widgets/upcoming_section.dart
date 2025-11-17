import 'package:flutter/material.dart';
import 'package:my_project/styles/text_styles.dart';
import 'package:my_project/utils/app_responsive.dart';
import 'package:my_project/widgets/deafult_blue_btn.dart';
import 'package:my_project/widgets/progress_bar.dart';

class UpcomingSection extends StatelessWidget {
  const UpcomingSection({super.key});

  @override
  Widget build(BuildContext context) {
    final r = AppResponsive.of(context);

    return Container(
      padding: EdgeInsets.all(r.spacing(14)),
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
            padding: EdgeInsets.only(left: r.spacing(8)),
            child: Text(
              'Upcoming changes:',
              style: AppTextStyles.sectionHeading(context),
            ),
          ),
    
          SizedBox(height: r.spacing(10)),
    
          ...[0.79, 0.21, 0.5].map((progress) {
            return Container(
              margin: EdgeInsets.only(bottom: r.spacing(12)),
              padding: EdgeInsets.symmetric(
                horizontal: r.w(16),
                vertical: r.h(10),
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
              child: ProgressBar(title: 'Oil change', progress: progress),
            );
          }),
    
          SizedBox(height: r.h(6)),
    
          const BasicButton('See more >>'),
        ],
      ),
    );
  }
}
