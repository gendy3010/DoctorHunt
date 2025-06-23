
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class Custombutton extends StatelessWidget {
  Custombutton({super.key,required this.title,this.onTap});
  String title;
  VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: ElevatedButton(
          onPressed: onTap,
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            minimumSize: const Size(100, 50),
            backgroundColor: const Color(0xFF0EBE7F),
          ),
          child: Text(
            title,

            style: GoogleFonts.rubik(
                fontSize: 18,
                fontWeight: FontWeight.w400,
                color: Colors.white
            ),
          ),
          ),);
  }
}
