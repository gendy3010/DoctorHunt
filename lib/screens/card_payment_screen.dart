import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widgets/header/top_section.dart';

class CardPaymentScreen extends StatefulWidget {
  const CardPaymentScreen({super.key});

  @override
  State<CardPaymentScreen> createState() => _CardPaymentScreenState();
}

class _CardPaymentScreenState extends State<CardPaymentScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String cardNumber = '';
  String expiryDate = '';
  String cardHolderName = '';
  String cvvCode = '';
  bool isCvvFocused = false;

  final FocusNode cvvFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    cvvFocusNode.addListener(() {
      setState(() {
        isCvvFocused = cvvFocusNode.hasFocus;
      });
    });
  }

  @override
  void dispose() {
    cvvFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context);
    final screenHeight = media.size.height;
    final screenWidth = media.size.width;

    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          // Background
          Container(
            height: screenHeight,
            width: screenWidth,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/bg/payment_screen_bg.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),

          SafeArea(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(
                horizontal: screenWidth * 0.04,
                vertical: screenHeight * 0.02,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Header
                  TopSection(
                    text: "Card Details",
                    backButton:
                    Icon(Icons.arrow_back_ios, size: screenWidth * 0.045),
                    onPressed: () => Get.back(),
                  ),
                  SizedBox(height: screenHeight * 0.02),

                  // Credit Card Preview
                  CreditCardWidget(
                    cardNumber: cardNumber,
                    expiryDate: expiryDate,
                    cardHolderName: cardHolderName,
                    cvvCode: cvvCode,
                    showBackView: isCvvFocused,
                    cardBgColor: Colors.black,
                    obscureCardNumber: true,
                    obscureCardCvv: true,
                    isHolderNameVisible: true,
                    onCreditCardWidgetChange: (_) {},
                    isSwipeGestureEnabled: true,
                  ),
                  SizedBox(height: screenHeight * 0.02),

                  // Manual Form
                  Form(
                    key: formKey,
                    child: Column(
                      children: [
                        _buildInputField(
                          hint: "Card Number",
                          onChanged: (val) => setState(() {
                            cardNumber = val;
                          }),
                          validator: (val) => val!.length < 16
                              ? "Enter valid card number"
                              : null,
                          keyboardType: TextInputType.number,
                          screenWidth: screenWidth,
                        ),
                        SizedBox(height: screenHeight * 0.015),
                        Row(
                          children: [
                            Expanded(
                              child: _buildInputField(
                                hint: "Expiry Date",
                                onChanged: (val) => setState(() {
                                  expiryDate = val;
                                }),
                                validator: (val) => val!.isEmpty
                                    ? "Enter expiry"
                                    : null,
                                keyboardType: TextInputType.datetime,
                                screenWidth: screenWidth,
                              ),
                            ),
                            SizedBox(width: screenWidth * 0.03),
                            Expanded(
                              child: _buildInputField(
                                hint: "CVV",
                                focusNode: cvvFocusNode,
                                onChanged: (val) => setState(() {
                                  cvvCode = val;
                                }),
                                validator: (val) => val!.length < 3
                                    ? "Invalid CVV"
                                    : null,
                                keyboardType: TextInputType.number,
                                screenWidth: screenWidth,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: screenHeight * 0.015),
                        _buildInputField(
                          hint: "Card Holder Name",
                          onChanged: (val) => setState(() {
                            cardHolderName = val;
                          }),
                          validator: (val) => val!.isEmpty
                              ? "Enter card holder name"
                              : null,
                          screenWidth: screenWidth,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.03),

                  // Validate Button
                  SizedBox(
                    width: double.infinity,
                    height: screenHeight * 0.06,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xff0ebe7f),
                        shape: RoundedRectangleBorder(
                          borderRadius:
                          BorderRadius.circular(screenWidth * 0.05),
                        ),
                      ),
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          Navigator.pop(context, {
                            'cardNumber': cardNumber,
                            'expiryDate': expiryDate,
                            'cardHolderName': cardHolderName,
                          });
                          Get.snackbar(
                            "Success",
                            "Card saved successfully",
                            snackPosition: SnackPosition.BOTTOM,
                            duration: const Duration(milliseconds: 800),
                            colorText: const Color(0xff000000),
                            backgroundColor: const Color(0xffFFFFFF),
                            margin: const EdgeInsets.symmetric(
                                vertical: 20, horizontal: 10),
                          );
                        }
                      },
                      child: Text(
                        "Validate",
                        style: GoogleFonts.rubik(
                          fontSize: screenWidth * 0.045,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInputField({
    required String hint,
    required Function(String) onChanged,
    required String? Function(String?) validator,
    required double screenWidth,
    TextInputType keyboardType = TextInputType.text,
    FocusNode? focusNode,
  }) {
    return TextFormField(
      focusNode: focusNode,
      onChanged: onChanged,
      validator: validator,
      keyboardType: keyboardType,
      style: GoogleFonts.rubik(fontSize: screenWidth * 0.04),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: GoogleFonts.rubik(
          fontSize: screenWidth * 0.038,
          fontWeight: FontWeight.w300,
          color: const Color(0xff677294),
        ),
        contentPadding: EdgeInsets.symmetric(
          horizontal: screenWidth * 0.04,
          vertical: screenWidth * 0.035,
        ),
        border: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.white),
          borderRadius: BorderRadius.circular(screenWidth * 0.03),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.white),
          borderRadius: BorderRadius.circular(screenWidth * 0.03),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.white, width: 2),
          borderRadius: BorderRadius.circular(screenWidth * 0.03),
        ),
        filled: true,
        fillColor: const Color(0xffFFFFFF),
      ),
    );
  }
}
