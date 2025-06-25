import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../favorite/build_doctorDetailsCard.dart';

Widget buildAppointmentDoctorCard(
    String name,
    String price,
    String specialty,
    String experience,
    String availableTime,
    String imagePath,
    String percentage,
    String patientStories,
    bool isFavorite,
    double screenWidth,
    double screenHeight,
    ) {
  return Container(
    width: screenWidth * 0.9,
    height: screenHeight * 0.16,
    margin: EdgeInsets.symmetric(vertical: screenWidth * 0.02, horizontal: screenWidth * 0.05),
    padding: EdgeInsets.all(screenWidth * 0.04),
    decoration: BoxDecoration(
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.1),
          blurRadius: 10,
          spreadRadius: 2,
          offset: const Offset(0, 4),
        ),
      ],
      color: Colors.white,
      borderRadius: BorderRadius.circular(10),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                imagePath,
                height: screenWidth * 0.2,
                width: screenWidth * 0.2,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(width: screenWidth * 0.05),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          name,
                          style: GoogleFonts.rubik(
                            fontSize: screenWidth * 0.045,
                            fontWeight: FontWeight.bold,
                            color: const Color(0xff333333),
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Icon(
                        isFavorite ? Icons.favorite : Icons.favorite_border,
                        color: isFavorite ? const Color(0xffFF0000) : const Color(0xff677294),
                        size: screenWidth * 0.06,
                      ),
                    ],
                  ),
                  Text(
                    specialty,
                    style: GoogleFonts.ptSans(
                      color: const Color(0xff0ebe7f),
                      fontSize: screenWidth * 0.03,
                    ),
                  ),
                  Text(
                    experience,
                    style: GoogleFonts.rubik(
                      color: const Color(0xff677294),
                      fontSize: screenWidth * 0.03,
                    ),
                  ),
                  Text(
                    availableTime,
                    style: GoogleFonts.rubik(
                      fontSize: screenWidth * 0.03,
                      color: const Color(0xff677294),
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        price,
                        style: GoogleFonts.rubik(
                          fontSize: screenWidth * 0.035,
                          color: const Color(0xff0ebe7f),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Spacer(),
                      StarRating(
                        starSize: 20,
                        onRatingChanged: (rating) {
                          print("Rating selected: $rating");
                        },
                      )
                    ],
                  ),


                ],
              ),
            ),
          ],
        ),

      ],
    ),
  );
}