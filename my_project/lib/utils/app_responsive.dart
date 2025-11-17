import 'package:flutter/widgets.dart';

class AppResponsive {
  final BuildContext context;
  final double width;
  final double height;
  final double shortest;

  AppResponsive._(this.context)
      : width = MediaQuery.of(context).size.width,
        height = MediaQuery.of(context).size.height,
        shortest = MediaQuery.of(context).size.shortestSide;

  static AppResponsive of(BuildContext context) => AppResponsive._(context);

  bool get isMobile => shortest < 600;
  bool get isTablet => shortest >= 600 && shortest < 900;
  bool get isDesktop => shortest >= 900;

  double text(double size) {
    if (isTablet) return size * 1.25;
    if (isDesktop) return size * 1.4;
    return size;
  }

  double spacing(double value) {
    if (isTablet) return value * 1.2;
    if (isDesktop) return value * 1.3;
    return value;
  }

  double w(double value) => value * (width / 390);

  double h(double value) => value * (height / 844);

  double image(double value) {
    if (isTablet) return value * 1.6;
    if (isDesktop) return value * 1.9;
    return value;
  }
}
