

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../config/app_routes.dart';
import '../../widgets/header/top_section.dart';
import 'build_doctorDetailsCard.dart';

class DoctorDetailsScreen extends StatefulWidget {
  const DoctorDetailsScreen({Key? key}) : super(key: key);

  @override
  State<DoctorDetailsScreen> createState() => _DoctorDetailsScreenState();
}

class _DoctorDetailsScreenState extends State<DoctorDetailsScreen> {
  List<Map<String, dynamic>> doctors = [
    {
      'name': 'Dr. Shouey',
      'specialty': 'Specialist Cardiology',
      'image': 'assets/images/favorite_screen/favorite_doctor1.png',
      'isFavorite': false,
    },
    {
      'name': 'Dr. Christenfeld N',
      'specialty': 'Specialist Cancer',
      'image': 'assets/images/favorite_screen/favorite_doctor2.png',
      'isFavorite': true,
    },
    {
      'name': 'Dr. Shouey',
      'specialty': 'Specialist Medicine',
      'image': 'assets/images/favorite_screen/favorite_doctor3.png',
      'isFavorite': true,
    },
    {
      'name': 'Dr. Shouey',
      'specialty': 'Specialist Dentist',
      'image': 'assets/images/favorite_screen/favorite_doctor4.png',
      'isFavorite': false,
    },
    {
      'name': 'Dr. Christenfeld N',
      'specialty': 'Specialist Cancer',
      'image': 'assets/images/favorite_screen/favorite_doctor2.png',
      'isFavorite': true,
    },
    {
      'name': 'Dr. Christenfeld N',
      'specialty': 'Specialist Cancer',
      'image': 'assets/images/favorite_screen/favorite_doctor2.png',
      'isFavorite': true,
    },
  ];

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                  "assets/images/find_doctor_screen/find_doctor_screen_bg.png"),
              fit: BoxFit.cover,
            ),
          ),
          width: double.infinity,
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TopSection(
                text: 'Doctor Details',
                backButton: const Icon(Icons.chevron_left),
                onPressed: () {
                  Get.toNamed(AppRoutes.mainZoomScreen);

                },
              ),
              buildDoctorDetailsCard(
                  "Dr. Pediatrician",
                  "\$ 28.00/hr",
                  "Specialist Cardiologist ",
                  "7 Year experience",
                  "10:00 AM tomorrow",
                  "assets/images/find_doctor_screen/find_doctor1.jpg",
                  "87%",
                  "69",
                  true,
                  screenWidth,
                screenHeight
              ),
              patientNumberCard('100', '500', '700', screenWidth, screenHeight),
              SizedBox(height: 10,),
              Align(
                alignment: Alignment.bottomLeft,
                child: Text('Services',
                style: GoogleFonts.rubik(
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                ),
                ),
              ),
              SizedBox(height: 15,),
              Align(
                alignment: Alignment.bottomLeft,
                child: Text('1. Patient care should be the number one priority.',
                style: GoogleFonts.rubik(
                  color: Color(0xFF677294E5),
                  fontSize: 13,
                ),
                ),
              ),
              Divider(color: Color(0xFF6772941A),),
              Align(
                alignment: Alignment.bottomLeft,
                child: Text('2. If you run your practiceyou know how frustrating.',
                style: GoogleFonts.rubik(
                  color: Color(0xFF677294E5),
                  fontSize: 13,
                ),
                ),
              ),
              Divider(color: Color(0xFF6772941A),),
              Align(
                alignment: Alignment.bottomLeft,
                child: Text('3. That’s why some of appointment reminder system.',
                style: GoogleFonts.rubik(
                  color: Color(0xFF677294E5),
                  fontSize: 13,
                ),
                ),
              ),
              SizedBox(height: 10,),
              Image.asset('assets/images/map.png'),


            ],
          ),
        ),

      ),
    );
  }





}