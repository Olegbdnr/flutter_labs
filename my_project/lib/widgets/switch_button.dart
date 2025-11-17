import 'package:flutter/material.dart';
import 'package:my_project/utils/app_responsive.dart';

class SwitchButton extends StatefulWidget {
  final IconData icon;

  const SwitchButton({required this.icon, super.key});

  @override
  State<SwitchButton> createState() => _SwitchButtonState();
}

class _SwitchButtonState extends State<SwitchButton> {
  bool isOn = false;

  @override
  Widget build(BuildContext context) {
    final r = AppResponsive.of(context);
    final buttonSize = r.w(62);
    return ElevatedButton(
      onPressed: () => setState(() {
        isOn = !isOn;
      }),
      style: ElevatedButton.styleFrom(
        backgroundColor: isOn ? 
        Colors.blue.withValues(alpha: 0.8) :
        Colors.white,
        foregroundColor: isOn ?
        Colors.white :
        Colors.blue.withValues(alpha: 0.8),
        shape: RoundedRectangleBorder(
           borderRadius: BorderRadius.circular(12)
        ),
        fixedSize: Size(buttonSize, buttonSize),
        iconSize: buttonSize / 1.7,
        padding: EdgeInsets.zero,
      ),
      child: Icon(widget.icon)
      );
  }
}
