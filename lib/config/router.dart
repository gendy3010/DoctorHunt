import 'package:doc_hunt/screens/add%20record/Medical%20RecordsScreen.dart';
import 'package:doc_hunt/screens/add%20record/add_records_screen.dart';
import 'package:doc_hunt/screens/card_payment_screen.dart';
import 'package:doc_hunt/screens/cart/cart_page.dart';
import 'package:doc_hunt/screens/cart/checkout_page.dart';
import 'package:doc_hunt/screens/delivery_address_screen.dart';
import 'package:doc_hunt/screens/doctors/popular_doctor_screen.dart';
import 'package:doc_hunt/screens/favorite_screen.dart';
import 'package:doc_hunt/screens/home/MainZoomScreen.dart';
import 'package:doc_hunt/screens/live_chat_screen.dart';
import 'package:doc_hunt/screens/order_confirmation_screen.dart';
import 'package:doc_hunt/screens/pharmacy_page.dart';
import 'package:doc_hunt/screens/profile_screen.dart';
import 'package:doc_hunt/screens/select_time_screen.dart';
import 'package:get/get.dart';
import '../screens/doctors/find_doctors_screen.dart';
import '../screens/onboarding/onboarding_screen.dart';
import '../screens/onboarding/splash_screen.dart';
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
      name: AppRoutes.myDoctors,
      page: () => FindDoctorsScreen(),
    ),
    GetPage(
      name: AppRoutes.medicalRecords,
      page: () => MedicalRecordsScreen(),
    ),
    GetPage(
      name: AppRoutes.cardPaymentScreen,
      page: () => CardPaymentScreen(),
    ),
    GetPage(
      name: AppRoutes.selectTimeScreen,
      page: () => SelectTimeScreen(),
    ),
    GetPage(
      name: AppRoutes.profileScreen,
      page: () => ProfileScreen(),
    ),
    GetPage(
      name: AppRoutes.pharmacyPage,
      page: () => PharmacyPage(),
    ),
    GetPage(
      name: AppRoutes.orderConfirmationScreen,
      page: () => OrderConfirmationScreen(),
    ),
    GetPage(
      name: AppRoutes.doctorLiveChatScreen,
      page: () => DoctorLiveChatScreen(),
    ),
    GetPage(
      name: AppRoutes.favoriteScreen,
      page: () => FavoriteScreen(),
    ),
    GetPage(
      name: AppRoutes.deliveryAddressScreen,
      page: () => DeliveryAddressScreen(),
    ),
    GetPage(
      name: AppRoutes.popularDoctorScreen,
      page: () => PopularDoctorScreen(),
    ),
    GetPage(
      name: AppRoutes.findDoctorsScreen,
      page: () => FindDoctorsScreen(),
    ),
    GetPage(
      name: AppRoutes.checkoutPage,
      page: () => CheckoutPage(),
    ),
    GetPage(
      name: AppRoutes.cartPage,
      page: () => CartPage(),
    ),
    GetPage(
      name: AppRoutes.addRecordsScreen,
      page: () => AddRecordsScreen(),
    ),



  ];
}
