import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget buildTextField(String label, double screenWidth) {
  return TextField(
    cursorColor: Colors.black,
    decoration: InputDecoration(
      labelText: label,
      labelStyle: GoogleFonts.rubik(
        color: const Color(0xff0EBE7F),
        fontWeight: FontWeight.normal,
        fontSize: screenWidth * 0.04,
      ),


      border: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.white),
        borderRadius: BorderRadius.circular(12),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.white),
        borderRadius: BorderRadius.circular(12),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.white, width: 2),
        borderRadius: BorderRadius.circular(12),
      ),
      filled: true,
      fillColor: const Color(0xffFFFFFF),
    ),
  );
}
