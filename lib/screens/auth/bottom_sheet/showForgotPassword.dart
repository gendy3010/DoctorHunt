import 'package:doc_hunt/screens/auth/bottom_sheet/showOTPVerification.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void showForgotPasswordSheet(BuildContext context) {
  final TextEditingController _emailController = TextEditingController();
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.white,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
    ),
    builder: (context) {
      String? _emailError;
      return StatefulBuilder(builder: (context, setModalState) {
        void _validateFields() {
          setModalState(() {
            _emailError = _emailController.text.isEmpty
                ? 'Email is Required'
                : !_emailController.text.contains('@gmail.com')
                ? 'Enter a valid Email'
                : null;
          });

          if (_emailError == null) {
            Navigator.pop(context);
            showOTPVerificationSheet(context);
          }
        }

        return Padding(
          padding: EdgeInsets.only(
              top: MediaQuery.of(context).size.height * 0.1,
              left: MediaQuery.of(context).size.width * 0.06,
              right: MediaQuery.of(context).size.width * 0.06,
              bottom: MediaQuery.of(context).size.height * 0.1),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.3,
                height: 5,
                decoration: BoxDecoration(
                  color: const Color(0xffC4C4C4),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
              Text(
                'Forgot Password',
                style: GoogleFonts.rubik(
                    fontSize: MediaQuery.of(context).size.width * 0.06,
                    fontWeight: FontWeight.w500,
                    color: const Color(0xff000000)),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.01),
              Text(
                'Enter your email for verification. We will send a 4-digit code to your email.',
                textAlign: TextAlign.center,
                style: GoogleFonts.rubik(
                    fontSize: MediaQuery.of(context).size.width * 0.04,
                    fontWeight: FontWeight.w400,
                    color: const Color(0xff677294)),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.04),
              TextFormField(
                controller: _emailController,
                cursorColor: const Color(0xff0EBE7F),
                decoration: InputDecoration(
                  errorText: _emailError,
                  hintText: 'Email',
                  hintStyle: GoogleFonts.rubik(
                      fontSize: MediaQuery.of(context).size.width * 0.04,
                      fontWeight: FontWeight.w300,
                      color: const Color(0xff677294)),
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                    const BorderSide(color: Colors.white, width: 2),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  filled: true,
                  fillColor: const Color(0xffFFFFFF),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.04),
              SizedBox(
                height: 54,
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    _validateFields();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xff0EBE7F),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                  ),
                  child: Text(
                    'Continue',
                    style: GoogleFonts.rubik(
                        fontSize: MediaQuery.of(context).size.width * 0.045,
                        fontWeight: FontWeight.w500,
                        color: const Color(0xffFFFFFF)),
                  ),
                ),
              ),
            ],
          ),
        );
      });
    },
  );
}
