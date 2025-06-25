import 'package:doc_hunt/config/app_routes.dart';
import 'package:doc_hunt/widgets/buttons/Custom%20Button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../widgets/buttons/book_now_button.dart';

Widget buildDoctorDetailsCard(
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
    height: screenHeight * 0.22,
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
                  Text(
                    price,
                    style: GoogleFonts.rubik(
                      fontSize: screenWidth * 0.035,
                      color: const Color(0xff0ebe7f),
                      fontWeight: FontWeight.w500,
                    ),
                  ),


                  SizedBox(height: screenWidth * 0.01),
                ],
              ),
            ),
          ],
        ),
        Row(
          children: [
            StarRating(),
            Spacer(),

            CustomButton(title: 'Book Now',onTap: (){
              Get.toNamed(AppRoutes.appointmentScreen);
            },),
          ],
        )

      ],
    ),
  );
}




class StarRating extends StatefulWidget {
  final int maxStars;
  final double starSize;
  final void Function(int)? onRatingChanged;

  const StarRating({
    super.key,
    this.maxStars = 5,
    this.starSize = 24,
    this.onRatingChanged,
  });

  @override
  State<StarRating> createState() => _StarRatingState();
}

class _StarRatingState extends State<StarRating> {
  int _currentRating = 0;

  void _onStarTapped(int index) {
    setState(() {
      _currentRating = index + 1;
    });

    widget.onRatingChanged?.call(_currentRating);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(widget.maxStars, (index) {
        return GestureDetector(
          onTap: () => _onStarTapped(index),
          child: Icon(
            index < _currentRating ? Icons.star : Icons.star_border,
            color: Colors.amber,
            size: widget.starSize,
          ),
        );
      }),
    );
  }
}



Widget patientNumberCard(
    String running,
    String ongoing,
    String patients,
    double screenWidth,
    double screenHeight,
    ) {
  return Container(
    padding: EdgeInsets.only(top: 10,bottom: 10,left: 10,right: 10),
    width: screenWidth * 0.78,
    height: screenHeight * 0.10,
    margin: EdgeInsets.symmetric( horizontal: screenWidth * 0.06),
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
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 80,
          height: 100,
          decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.2),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                ongoing,
                style: GoogleFonts.rubik(
                  fontSize: 18,
                  fontWeight: FontWeight.w500
                ),
              ),
              Text(
                'Running',
                style: GoogleFonts.rubik(
                  fontSize: 14,
                  fontWeight: FontWeight.w300,
                  color: Color(0xFF677294)
                ),
              ),

            ],
          ),
        ),
        SizedBox(width: 20,),
        Container(
          width: 80,
          height: 100,
          decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.2),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                running,
                style: GoogleFonts.rubik(
                  fontSize: 18,
                  fontWeight: FontWeight.w500
                ),
              ),
              Text(
                'Ongoing',
                style: GoogleFonts.rubik(
                  fontSize: 14,
                  fontWeight: FontWeight.w300,
                  color: Color(0xFF677294)
                ),
              ),

            ],
          ),
        ),
        SizedBox(width: 20,),
        Container(
          width: 80,
          height: 100,
          decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.2),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                patients,
                style: GoogleFonts.rubik(
                  fontSize: 18,
                  fontWeight: FontWeight.w500
                ),
              ),
              Text(
                'Patients',
                style: GoogleFonts.rubik(
                  fontSize: 14,
                  fontWeight: FontWeight.w300,
                  color: Color(0xFF677294)
                ),
              ),

            ],
          ),
        ),


      ],
    ),
  );
}
