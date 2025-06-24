import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget socialButton(String text, String iconPath, {bool isSmallScreen = false}) {
  return ElevatedButton.icon(
    onPressed: () {},
    icon: Image.asset(iconPath, height: isSmallScreen ? 16 : 20),
    label: Text(
      text,
      style: GoogleFonts.rubik(
          fontSize: isSmallScreen ? 12 : 14,
          fontWeight: FontWeight.w300,
          color: const Color(0xff677294)),
    ),
    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.white,
      elevation: 0,
      padding: EdgeInsets.all(isSmallScreen ? 12 : 16),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12), side: BorderSide.none),
    ),
  );
}
