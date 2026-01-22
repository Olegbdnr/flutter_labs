import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_project/utils/font_helper.dart';

class AppTextStyles {
  static TextStyle appBarTittle(BuildContext context,
   {double? baseFontSize}) => GoogleFonts.oswald(
    fontSize: responsiveFont(context,
     base: baseFontSize?? MediaQuery.of(context).size.width * 0.06,
     min: 18,
     max: 64),
    color: Colors.black87,
    fontWeight: FontWeight.w500,
    decoration: TextDecoration.none,
  );

  static TextStyle heading(BuildContext context) => GoogleFonts.rubik(
    fontSize: responsiveFont(
      context,
      base: MediaQuery.of(context).size.width * 0.07,
      min: 20,
      max: 42,
    ),
    color: Colors.black87,
    fontWeight: FontWeight.w700,
  );

  static TextStyle main(BuildContext context, {Color? color}) =>
      GoogleFonts.rubik(
        fontSize: responsiveFont(
          context,
          base: MediaQuery.of(context).size.width * 0.04,
          min: 14,
          max: 26,
        ),
        color: color ?? const Color.fromARGB(221, 21, 21, 21),
        fontWeight: FontWeight.w500,
      );

  static TextStyle smallLabel(BuildContext context, {Color? color}) =>
      GoogleFonts.rubik(
        fontSize: responsiveFont(
          context,
          base: MediaQuery.of(context).size.width * 0.03,
          min: 14,
          max: 22,
        ),
        color: color ?? const Color.fromARGB(221, 21, 21, 21),
        fontWeight: FontWeight.w400,
      );

  static TextStyle sectionHeading(BuildContext context) => GoogleFonts.rubik(
    fontSize: responsiveFont(
      context,
      base: MediaQuery.of(context).size.width * 0.05,
      min: 16,
      max: 34,
    ),
    color: const Color.fromARGB(221, 21, 21, 21),
    fontWeight: FontWeight.w500,
  );

  static TextStyle lightButton(BuildContext context) => GoogleFonts.rubik(
    fontSize: responsiveFont(
      context,
      base: MediaQuery.of(context).size.width * 0.04,
      min: 14,
      max: 22,
    ),
    color: Colors.white,
    fontWeight: FontWeight.w500,
  );
}
