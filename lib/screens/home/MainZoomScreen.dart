import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';



import 'home_screen.dart';
import 'DrawerMenu.dart';



class MainZoomScreen extends StatelessWidget {
  const MainZoomScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return ZoomDrawer(
      menuScreen: const DrawerMenu(),
      mainScreen: const HomeScreen(),
      borderRadius: 33,
      showShadow: true,
      angle: 0.0,
      menuBackgroundColor: Color(0xFF536184),

      slideWidth: MediaQuery.of(context).size.width * 0.9,
      openCurve: Curves.easeInCirc,
      closeCurve: Curves.linear,
    );
  }
}
