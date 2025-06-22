import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:go_router/go_router.dart';

import '../config/app_routes.dart';
import '../widgets/header/top_section.dart';


class MedicalRecordsScreen extends StatelessWidget {
  const MedicalRecordsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
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
              'A detailed health history helps a doctor diagnose\nyou btter.',
              style: TextStyle(
                fontSize: 13,
                color: Color(0xFF677294),
              ),
            ),
            SizedBox(height: 100,),


          ],
        ),

      ),
    );
  }
}
