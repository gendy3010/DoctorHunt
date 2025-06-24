
import 'package:doc_hunt/config/app_routes.dart';
import 'package:doc_hunt/screens/auth/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../widgets/buttons/social_button.dart';
import 'bottom_sheet/showForgotPassword.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String? _emailError;
  String? _passwordError;

  bool _obscureText = true;

  void _validateFields() {
    final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+$');
    setState(() {
      _emailError = _emailController.text.isEmpty
          ? 'Email is Required'
          : !emailRegex.hasMatch(_emailController.text)
              ? 'Enter a valid Email'
              : null;

      _passwordError = _passwordController.text.isEmpty
          ? 'Password  is Required'
          : _passwordController.text.length < 6
              ? 'Password must be atleast 6 characters long'
              : null;
    });
    if (_emailError == null && _passwordError == null) {
      Get.toNamed(AppRoutes.mainZoomScreen);
    }
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final mediaQuery = MediaQuery.of(context);
  final isSmallScreen = mediaQuery.size.width < 375;
    return Scaffold(
      backgroundColor: const Color(0xffFFFFFF),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/auth_image/auth_bg.png"),
            fit: BoxFit.cover,
          ),
        ),
        width: size.width,
        height: size.height,
        padding: EdgeInsets.symmetric(
            vertical: size.height * 0.02, horizontal: size.width * 0.04),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: size.width * 0.06, vertical: size.height * 0.05),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: size.height * 0.07),
                Text(
                  'Welcome Back',
                  style: GoogleFonts.rubik(
                      fontSize: size.width * 0.06,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xff000000)),
                ),
                SizedBox(height: size.height * 0.02),
                Text(
                  'You can search course, apply course and find scholarship for abroad studies',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.rubik(
                      fontSize: size.width * 0.04,
                      fontWeight: FontWeight.w400,
                      color: const Color(0xff677294)),
                ),
                SizedBox(height: size.height * 0.06),
                Padding(
                  padding: EdgeInsets.only(top: isSmallScreen ? 30 : 50),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
        child: Padding(
          padding: EdgeInsets.only(right: isSmallScreen ? 5 : 10),
          child: socialButton(
            'Google',
            'assets/images/auth_image/google_logo.png',
            isSmallScreen: isSmallScreen,
          ),
        ),
      ),
      SizedBox(width: isSmallScreen ? 10 : 20),
      Expanded(
        child: Padding(
          padding: EdgeInsets.only(left: isSmallScreen ? 5 : 10),
          child: socialButton(
            'Facebook',
            'assets/images/auth_image/facebook_logo.png',
            isSmallScreen: isSmallScreen,
          ),
        ),
      ),
                    ],
                  ),
                ),
                SizedBox(height: size.height * 0.04),
                customTextField(
                    hintText: 'Email',
                    controller: _emailController,
                    errorText: _emailError),
                SizedBox(height: size.height * 0.02),
                customTextField(
                  hintText: 'Password',
                  controller: _passwordController,
                  errorText: _passwordError,
                  isPassword: true,
                ),
                SizedBox(height: size.height * 0.05),
                SizedBox(
                  width: double.infinity,
                  height: size.height * 0.07,
                  child: ElevatedButton(
                      onPressed: _validateFields,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xff0EBE7F),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: Text(
                        'Login',
                        style: GoogleFonts.rubik(
                            fontSize: size.width * 0.05,
                            fontWeight: FontWeight.w500,
                            color: const Color(0xffFFFFFF)),
                      )),
                ),
                SizedBox(height: size.height * 0.03),
                GestureDetector(
                  onTap: () {
                    showForgotPasswordSheet(context);
                  },
                  child: Text(
                    'Forgot Password?',
                    style: GoogleFonts.rubik(
                        fontSize: size.width * 0.04,
                        fontWeight: FontWeight.w400,
                        color: const Color(0xff0EBE7F)),
                  ),
                ),
                SizedBox(height: size.height * 0.07),
                GestureDetector(
                  onTap: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SignUpScreen()));
                  },
                  child: Text(
                    'Don’t have an account? Join us',
                    style: GoogleFonts.rubik(
                        fontSize: size.width * 0.04,
                        fontWeight: FontWeight.w400,
                        color: const Color(0xff0EBE7F)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }


  Widget customTextField({
  required String hintText,
  required TextEditingController controller,
  String? errorText,
  bool isPassword = false,
  bool isSmallScreen = false,
}) {
  return StatefulBuilder(
    builder: (context, setState) {
      return TextFormField(
        controller: controller,
        obscureText: isPassword ? _obscureText : false,
        cursorColor: const Color(0xff0EBE7f),
        decoration: InputDecoration(
          errorText: errorText,
          hintText: hintText,
          hintStyle: GoogleFonts.rubik(
            fontSize: isSmallScreen ? 14 : 16,
            fontWeight: FontWeight.w300,
            color: const Color(0xff677294),
          ),
          contentPadding: EdgeInsets.symmetric(
            horizontal: isSmallScreen ? 16 : 20,
            vertical: isSmallScreen ? 16 : 18,
          ),
          suffixIcon: isPassword
              ? IconButton(
                  icon: Icon(
                    _obscureText ? Icons.visibility_off : Icons.visibility,
                    color: const Color(0xff677294),
                    size: isSmallScreen ? 20 : 24,
                  ),
                  onPressed: () {
                    setState(() {
                      _obscureText = !_obscureText;
                    });
                  },
                )
              : null,
          border: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(12),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(12),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.white, width: 2),
            borderRadius: BorderRadius.circular(12),
          ),
          filled: true,
          fillColor: const Color(0xffFFFFFF),
        ),
      );
    },
  );
}


}
