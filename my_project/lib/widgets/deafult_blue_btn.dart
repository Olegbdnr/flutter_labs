import 'package:flutter/material.dart';
import 'package:my_project/styles/text_styles.dart';
import 'package:my_project/utils/app_responsive.dart';

class BasicButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;

  const BasicButton(this.text, {required this.onPressed, super.key});

  @override
  Widget build(BuildContext context) {
    final r = AppResponsive.of(context);

    return Center(
              child: ElevatedButton(
                onPressed: onPressed,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue.withValues(alpha: 0.8),
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(r.w(24)),
                  ),
                  padding: EdgeInsets.symmetric(
                    horizontal: r.w(20),
                    vertical: r.h(10),
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
