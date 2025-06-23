import 'package:doc_hunt/widgets/buttons/Custom%20Button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../config/app_routes.dart';
import '../../widgets/header/top_section.dart';


class MedicalRecordsScreen extends StatelessWidget {
  const MedicalRecordsScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                text: 'Find Doctors',
                backButton: const Icon(Icons.chevron_left),
                onPressed: () {
                  Get.toNamed(AppRoutes.home);

                },
              ),

              SizedBox(height: 140,),
              Center(
                child: CircleAvatar(
                  radius: 100,
                  child: Image.asset('assets/images/medicalRecords.png'),
                ),
              ),
              SizedBox(height: 15,),
              Text(
                'Add a medical record.',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Rubik',
                  fontSize: 25,
                  color: Colors.black,
                ),
              ),
              Text(
                textAlign: TextAlign.center,
                'A detailed health history helps a doctor diagnose\nyou better.',
                style: TextStyle(
                  fontSize: 13,
                  color: Color(0xFF677294),
                ),
              ),
              SizedBox(height: 100,),
              Custombutton(title: 'Add a record',
              onTap: (){
                Get.toNamed(AppRoutes.addRecordsScreen);
              },
              ),


            ],
          ),
        ),

      ),
    );
  }
}
