import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void showResetPasswordSheet(BuildContext context) {
  final TextEditingController _newPasswordController =
  TextEditingController();
  final TextEditingController _reEnterPasswordController =
  TextEditingController();
  final screenWidth = MediaQuery.of(context).size.width;
  final screenHeight = MediaQuery.of(context).size.height;

  showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
      ),
      builder: (context) {
        String? _newPasswordError;
        String? _reEnterPasswordError;
        return StatefulBuilder(
          builder: (context, setModalState) {
            void _validateFields() {
              setModalState(() {
                _newPasswordError = _newPasswordController.text.isEmpty
                    ? 'Password is Required '
                    : _newPasswordController.text.length < 6
                    ? 'Password must be at least 6 characters long'
                    : null;

                _reEnterPasswordError =
                _reEnterPasswordController.text.isEmpty
                    ? 'Please Confirm your Password'
                    : _reEnterPasswordController.text !=
                    _newPasswordController.text
                    ? 'Passwords do not match'
                    : null;
              });

              if (_newPasswordError == null &&
                  _reEnterPasswordError == null) {
                Navigator.pop(context);
              }
            }

            return Padding(
              padding: EdgeInsets.only(
                top: screenHeight * 0.07,
                left: screenWidth * 0.06,
                right: screenWidth * 0.06,
                bottom: screenHeight * 0.07,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: screenWidth * 0.3,
                    height: screenHeight * 0.005,
                    decoration: BoxDecoration(
                      color: const Color(0xffC4C4C4),
                      borderRadius: BorderRadius.circular(6),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.03),
                  Text(
                    'Reset Password',
                    style: GoogleFonts.rubik(
                        fontSize: screenWidth * 0.06,
                        fontWeight: FontWeight.w500,
                        color: const Color(0xff000000)),
                  ),
                  SizedBox(height: screenHeight * 0.015),
                  Text(
                    'Set a new password for your account.',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.rubik(
                        fontSize: screenWidth * 0.04,
                        fontWeight: FontWeight.w400,
                        color: const Color(0xff677294)),
                  ),
                  SizedBox(height: screenHeight * 0.025),
                  TextFormField(
                    controller: _newPasswordController,
                    cursorColor: const Color(0xff0EBE7F),
                    obscureText: true,
                    decoration: InputDecoration(
                      errorText: _newPasswordError,
                      hintText: 'New Password',
                      hintStyle: GoogleFonts.rubik(
                          fontSize: screenWidth * 0.045,
                          fontWeight: FontWeight.w300,
                          color: const Color(0xff677294)),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      suffixIcon: const Icon(
                        Icons.visibility_off,
                        color: Color(0xff677294),
                      ),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  TextFormField(
                    controller: _reEnterPasswordController,
                    cursorColor: const Color(0xff0EBE7F),
                    obscureText: true,
                    decoration: InputDecoration(
                      errorText: _reEnterPasswordError,
                      hintText: 'Re-enter Password',
                      hintStyle: GoogleFonts.rubik(
                          fontSize: screenWidth * 0.045,
                          fontWeight: FontWeight.w300,
                          color: const Color(0xff677294)),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      suffixIcon: const Icon(
                        Icons.visibility_off,
                        color: Color(0xff677294),
                      ),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.04),
                  SizedBox(
                    height: screenHeight * 0.07,
                    width: screenWidth,
                    child: ElevatedButton(
                      onPressed: _validateFields,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xff0EBE7F),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12)),
                      ),
                      child: Text('Update Password',
                          style: GoogleFonts.rubik(
                              color: Colors.white,
                              fontSize: screenWidth * 0.05,
                              fontWeight: FontWeight.w500)),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      });
}