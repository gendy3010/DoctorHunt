

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../config/app_routes.dart';
import '../../widgets/buttons/Custom Button.dart';
import '../../widgets/buttons/book_now_button.dart';
import '../../widgets/header/top_section.dart';
import '../../widgets/search/custom_search_bar.dart';

class MedicineOrdersScreen extends StatelessWidget {
  MedicineOrdersScreen({super.key});

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
                text: 'Medicine Orders',
                backButton: const Icon(Icons.chevron_left),
                onPressed: () {
                  Get.toNamed(AppRoutes.mainZoomScreen);

                },
              ),

              SizedBox(height: 140,),
              Center(
                child: CircleAvatar(
                  radius: 100,
                  child: Image.asset('assets/images/medicineOrders.png'),
                ),
              ),
              SizedBox(height: 15,),
              Text(
                'No orders placed yet',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Rubik',
                  fontSize: 25,
                  color: Colors.black,
                ),
              ),
              Text(
                textAlign: TextAlign.center,
                'Place your first order now.',
                style: TextStyle(
                  fontSize: 13,
                  color: Color(0xFF677294),
                ),
              ),
              SizedBox(height: 100,),
              CustomButton(title: 'Order medicines',
                onTap: (){
                  Get.toNamed(AppRoutes.enableLocationServices);
                },
              ),


            ],
          ),
        ),

      ),
    );
  }


}
