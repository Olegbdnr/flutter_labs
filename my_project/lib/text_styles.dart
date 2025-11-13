import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextStyles {
  static TextStyle appBarTittle(BuildContext context) =>
      GoogleFonts.oswald(fontSize: 24, fontWeight: FontWeight.w500);

  static TextStyle heading(BuildContext context) => GoogleFonts.rubik(
    fontSize: MediaQuery.of(context).size.width * 0.07,
    color: Colors.black87,
    fontWeight: FontWeight.w700,
  );

  static TextStyle main(BuildContext context, {Color? color}) =>
      GoogleFonts.rubik(
        fontSize: MediaQuery.of(context).size.width * 0.04,
        color: color ?? const Color.fromARGB(221, 21, 21, 21),
        fontWeight: FontWeight.w400,
      );

  static TextStyle sectionHeading(BuildContext context) => GoogleFonts.rubik(
    fontSize: MediaQuery.of(context).size.width * 0.05,
    color: const Color.fromARGB(221, 21, 21, 21),
    fontWeight: FontWeight.w500,
  );

  static TextStyle lightButton(BuildContext context) => GoogleFonts.rubik(
    fontSize: MediaQuery.of(context).size.width * 0.04,
    color: Colors.white,
    fontWeight: FontWeight.w500,
  );
}
