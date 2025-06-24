import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../config/app_routes.dart';
import '../../widgets/header/top_section.dart';

class AppointmentScreen extends StatelessWidget {
  const AppointmentScreen({super.key});

  @override
  Widget build(BuildContext context) {
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

            ],
          ),
        ),
      ),
    );
  }
}
