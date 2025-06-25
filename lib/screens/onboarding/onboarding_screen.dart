import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../widgets/buttons/onboarding_button.dart';
import '../auth/login_screen.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final PageController pageController = PageController();
  int currentIndex = 0;

  final List<Map<String, String>> onBoardingData = [
    {
      'image': 'assets/images/onboarding_screen/doctor_1.png',
      'title': 'Find Trusted Doctors',
      'description':
      'Contrary to popular belief, Lorem ipsum is not random text. It has roots in a piece of text over 2000 years old.'
    },
    {
      'image': 'assets/images/onboarding_screen/doctor_2.png',
      'title': 'Choose Best Doctors',
      'description':
      'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of it over 2000 years old.'
    },
    {
      'image': 'assets/images/onboarding_screen/doctor_3.png',
      'title': 'Easy Appointments',
      'description':
      'Contrary to popular belief, Lorem ipsum is not random text. It has roots in a piece of text over 2000 years old.'
    },
  ];

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  void goToNextPage() {
    if (currentIndex < onBoardingData.length - 1) {
      pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void skipToHome() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => LoginScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              "assets/images/onboarding_screen/onboarding_screen_bg.jpg",
            ),
            fit: BoxFit.fill,
          ),
        ),
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            const SizedBox(height: 80),
            Expanded(
              child: PageView.builder(
                controller: pageController,
                itemCount: onBoardingData.length,
                onPageChanged: (index) {
                  setState(() {
                    currentIndex = index;
                  });
                },
                itemBuilder: (context, index) {
                  return AnimatedBuilder(
                    animation: pageController,
                    builder: (context, child) {
                      double value = 1.0;
                      if (pageController.position.haveDimensions) {
                        value = pageController.page! - index;
                        value = (1 - (value.abs() * 0.3)).clamp(0.0, 1.0);
                      }

                      return Opacity(
                        opacity: value,
                        child: Transform.translate(
                          offset: Offset(50 * (1 - value), 0),
                          child: _buildOnboardingPage(index),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
            _buildBottomButtons(),
          ],
        ),
      ),
    );
  }

  Widget _buildOnboardingPage(int index) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          onBoardingData[index]['image']!,
          height: 280,
          width: 336,
        ),
        const SizedBox(height: 30),
        Text(
          onBoardingData[index]['title']!,
          style: GoogleFonts.rubik(
            fontWeight: FontWeight.bold,
            color: const Color(0xff333333),
            fontSize: 28,
          ),
        ),
        const SizedBox(height: 15),
        SizedBox(
          width: 274,
          height: 70,
          child: Text(
            onBoardingData[index]['description']!,
            textAlign: TextAlign.center,
            style: GoogleFonts.rubik(
              color: const Color(0xff677294),
              fontSize: 14,
            ),
          ),
        ),
        const SizedBox(height: 20),
        _buildPageIndicator(),
      ],
    );
  }

  Widget _buildPageIndicator() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(onBoardingData.length, (index) {
        return AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          margin: const EdgeInsets.symmetric(horizontal: 4),
          height: 8,
          width: currentIndex == index ? 20 : 8,
          decoration: BoxDecoration(
            color: currentIndex == index
                ? const Color(0xff0EBE7F)
                : const Color(0xff677294),
            borderRadius: BorderRadius.circular(8),
          ),
        );
      }),
    );
  }

  Widget _buildBottomButtons() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: currentIndex < onBoardingData.length - 1
          ? SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                onPressed: skipToHome,
                child: Text(
                  "Skip",
                  style: GoogleFonts.rubik(
                    fontSize: 14,
                    color: const Color(0xff677294),
                  ),
                ),
              ),
              IconButton(
                onPressed: goToNextPage,
                icon: const Icon(Icons.arrow_forward_ios,
                    color: Color(0xff0ebe7f)),
              ),
            ],
          ),
        ),
      )
          : const OnBoardingButton(text: "Get Started"),
    );
  }
}
