import 'package:flutter/material.dart';
import 'package:my_project/styles/text_styles.dart';

class InfoRow extends StatelessWidget {
  final String label;
  final String value;
  final IconData? icon;
  final double spacing;

  const InfoRow({
    required this.label,
    required this.value,
    super.key,
    this.icon,
    this.spacing = 5,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            if (icon != null) ...[
              Icon(icon, size: 32),
              SizedBox(width: spacing),
            ],
            Text(label, style: AppTextStyles.main(context)),
          ],
        ),
        Text(value, style: AppTextStyles.smallLabel(context)),
      ],
    );
  }
}
