import 'package:doc_hunt/config/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get.dart';


class DrawerMenu extends StatefulWidget {
  const DrawerMenu({super.key});

  @override
  State<DrawerMenu> createState() => _DrawerMenuState();
}

class _DrawerMenuState extends State<DrawerMenu> {
  int _selectedIndex = -1; // -1 = ولا عنصر محدد

  @override
  Widget build(BuildContext context) {

    return Container(
      color: const Color(0xFF536184),
      padding: const EdgeInsets.only(top: 80, left: 20, right: 20, bottom: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header with profile and close button
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CircleAvatar(
                radius: 30,
                backgroundImage: AssetImage('assets/images/home_screen/profile.png'),
              ),
              const SizedBox(width: 15),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Abdullah Mamun',
                      style: TextStyle(
                        decoration: TextDecoration.none,
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      '01303-527300',
                      style: TextStyle(
                        decoration: TextDecoration.none,
                        color: Colors.white70,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
              Material(
                color: Colors.white.withOpacity(0.1),
                shape: const CircleBorder(),
                child: InkWell(
                  customBorder: const CircleBorder(),
                  onTap: () {
                    ZoomDrawer.of(context)?.close();
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Icon(Icons.close, color: Colors.white, size: 20),
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 50),

          _buildMenuItem(
              context, 0,
              Icons.person,
              'My Doctors',
              onTap: () {
           Get.toNamed(AppRoutes.myDoctors);
          }),
          _buildMenuItem(context, 1, Icons.receipt_long_outlined, 'Medical Records',onTap: (){
            Get.toNamed(AppRoutes.medicalRecords);
          }),
          _buildMenuItem(context, 2, Icons.payment, 'Payments',onTap: (){
            Get.toNamed(AppRoutes.cardPaymentScreen);
          }),
          _buildMenuItem(context, 3, Icons.move_to_inbox_rounded, 'Medicine Orders',onTap: (){
            Get.toNamed(AppRoutes.medicineOrdersScreen);
          }),
          _buildMenuItem(context, 4, Icons.security, 'Privacy & Policy'),
          _buildMenuItem(context, 5, Icons.help, 'Help Center'),
          _buildMenuItem(context, 6, Icons.settings, 'Settings'),

          const Spacer(),

          _buildMenuItem(
            context,
            7,
            Icons.logout_outlined,
            'Logout',
            iconColor: Colors.redAccent,
            onTap: () {
              // تنفيذ تسجيل الخروج
            },
          ),
        ],
      ),
    );
  }

  Widget _buildMenuItem(
      BuildContext context,
      int index,
      IconData icon,
      String title, {
        Color iconColor = Colors.white,
        VoidCallback? onTap,
      }) {
    final bool isSelected = index == _selectedIndex;

    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedIndex = index;
        });
        if (onTap != null) onTap();
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        decoration: BoxDecoration(
          color: isSelected ? Colors.white.withOpacity(0.15) : Colors.transparent,
          borderRadius: BorderRadius.circular(8),
        ),
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 8),
        child: Row(
          children: [
            Icon(icon, color: iconColor, size: 26),
            const SizedBox(width: 15),
            Text(
              title,
              style: const TextStyle(
                decoration: TextDecoration.none,
                color: Colors.white,
                fontSize: 20,
              ),
            ),
            const Spacer(),
            const Icon(Icons.arrow_forward_ios_outlined, color: Colors.white, size: 20),
          ],
        ),
      ),
    );
  }
}

class AppFonts {
}
