import 'package:doc_hunt/screens/Medical%20RecordsScreen.dart';
import 'package:doc_hunt/screens/home/MainZoomScreen.dart';
import 'package:get/get.dart';
import '../screens/doctors/find_doctors_screen.dart';
import '../screens/home/home_screen.dart';
import '../screens/onboarding/onboarding_screen.dart';
import '../screens/onboarding/splash_screen.dart';
import '../screens/profile_screen.dart';
import 'app_routes.dart';

class AppPages {
  static final routes = [
    GetPage(
      name: AppRoutes.splash,
      page: () => SplashScreen(),
    ),
    GetPage(
      name: AppRoutes.onboarding,
      page: () => OnBoardingScreen(),
    ),
    GetPage(
      name: AppRoutes.home,
      page: () => MainZoomScreen(),
    ),
    GetPage(
      name: AppRoutes.mydoctors,
      page: () => FindDoctorsScreen(),
    ),
    GetPage(
      name: AppRoutes.medicalRecords,
      page: () => MedicalRecordsScreen(),
    ),


  ];
}
