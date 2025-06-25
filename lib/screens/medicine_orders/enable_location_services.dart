

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../config/app_routes.dart';
import '../../widgets/buttons/Custom Button.dart';
import '../../widgets/header/top_section.dart';

class EnableLocationServices extends StatelessWidget {
  EnableLocationServices({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

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
                text: 'Enable Location Services',
                backButton: const Icon(Icons.chevron_left),
                onPressed: () {
                  Get.toNamed(AppRoutes.mainZoomScreen);

                },
              ),

              SizedBox(height: 140,),
              Center(
                child: CircleAvatar(
                  radius: 100,
                  child: Image.asset('assets/images/location.png'),
                ),
              ),
              SizedBox(height: 15,),
              Text(
                'Location',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Rubik',
                  fontSize: 25,
                  color: Colors.black,
                ),
              ),
              Text(
                textAlign: TextAlign.center,
                'Your location services are switched off. Please\n enable location, to help us serve better.',
                style: TextStyle(
                  fontSize: 13,
                  color: Color(0xFF677294),
                ),
              ),
              SizedBox(height: 100,),
              CustomButton(title: 'Enable Location',
                onTap: (){
                  Get.toNamed(AppRoutes.pharmacyPage);
                },
              ),


            ],
          ),
        ),

      ),
    );
  }


}
