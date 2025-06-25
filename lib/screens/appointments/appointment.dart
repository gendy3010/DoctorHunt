import 'package:doc_hunt/screens/appointments/appointment_card.dart';
import 'package:doc_hunt/widgets/buildTextField.dart';
import 'package:doc_hunt/widgets/buttons/Custom%20Button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../config/app_routes.dart';
import '../../widgets/header/top_section.dart';

class AppointmentScreen extends StatelessWidget {
  const AppointmentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/find_doctor_screen/find_doctor_screen_bg.png"),
            fit: BoxFit.cover,
          ),
        ),
        width: double.infinity,
        padding: const EdgeInsets.all(15),
        child: Padding(
          padding: EdgeInsets.only(top: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TopSection(
                text: 'Appointment',
                backButton: const Icon(Icons.chevron_left),
                onPressed: () {
                  Get.toNamed(AppRoutes.mainZoomScreen);

                },
              ),
              buildAppointmentDoctorCard(
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
              SizedBox(height: 20,),
              Text('Appointment For',
                style: GoogleFonts.rubik(
                  fontSize: 18,
                  fontWeight: FontWeight.w500
                ),

              ),
              SizedBox(height: 30,),
              buildTextField('Patient Name',  screenWidth),
              SizedBox(height: 16,),
              buildTextField('Contact Number',  screenWidth),
              SizedBox(height: 20,),
              Text('Who is this patient?',
                style: GoogleFonts.rubik(
                    fontSize: 18,
                    fontWeight: FontWeight.w500
                ),

              ),
              SizedBox(height: 20,),
              Row(
                children: [
                  Container(
                    child: Column(
                      children: [
                        Icon(Icons.add,color: Colors.green,size: 55,),
                        SizedBox(height: 15,),
                        Text(
                          textAlign: TextAlign.center,
                          'Add ',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.green,
                            fontFamily: 'Rubik',),)
                      ],
                    ),
                    height: 130,
                    width: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey[200],
                    ),
                  ),
                  SizedBox(width: 15,),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset('assets/images/addRecordsImage.jpg'),
                      Text(
                        'My Self',
                        style: GoogleFonts.rubik(
                            fontSize: 14,
                            fontWeight: FontWeight.w400
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                  SizedBox(width: 15,),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(
                        'assets/images/mychild.png',
                      ),
                      Text(
                        'My Child',
                        style: GoogleFonts.rubik(
                          fontSize: 14,
                          fontWeight: FontWeight.w400
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),


                ],
              ),
              SizedBox(height: 40,),
              Center(
                child: SizedBox(
                    width: 300,
                    height: 50,
                    child: CustomButton(title: 'Next',onTap: (){},)),
              ),




            ],
          ),
        ),
      ),
    );
  }
}

