import 'package:doc_hunt/screens/home/MainZoomScreen.dart';
import 'package:doc_hunt/screens/onboarding/onboarding_screen.dart';
import 'package:doc_hunt/screens/onboarding/onboarding_screen.dart';
import 'package:doc_hunt/screens/onboarding/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

import 'config/app_routes.dart';
import 'config/router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: AppRoutes.splash,
      getPages: AppPages.routes,
      title: "Doctor Hunt",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );  }
}
