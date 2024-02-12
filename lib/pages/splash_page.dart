import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:football_app/pages/home_page.dart';
import 'package:football_app/pages/onboarding_page.dart';
import 'package:page_transition/page_transition.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key, required this.initScreen});
  final int initScreen;

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      duration: 1000,
      splashIconSize: double.infinity,
      splash: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 32),
              child: Image.asset('assets/loading_icon.png'),
            ),
            const Text(
              'Loading app',
              style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 22,
                  fontWeight: FontWeight.w400),
            )
          ],
        ),
      ),
      nextScreen: initScreen == 0 ? const OnBoardingPage() : const HomePage(),
      splashTransition: SplashTransition.fadeTransition,
      pageTransitionType: PageTransitionType.fade,
    );
  }
}
