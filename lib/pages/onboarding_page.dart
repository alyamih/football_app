import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:football_app/pages/home_page.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({super.key});

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  ValueNotifier<int> page = ValueNotifier(0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          if (page.value == 0)
            Padding(
                padding: const EdgeInsets.only(top: 65, bottom: 24),
                child: Container(
                  height: 362,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.fitWidth,
                          image: AssetImage('assets/onBoarding_image1.png'))),
                )),
          if (page.value == 1)
            Padding(
                padding: const EdgeInsets.only(top: 65, bottom: 24),
                child: Container(
                  height: 362,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.fitWidth,
                          image: AssetImage('assets/onBoarding_image2.png'))),
                )),
          if (page.value == 2)
            Padding(
                padding: const EdgeInsets.only(top: 65, bottom: 24),
                child: Container(
                  height: 362,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.fitWidth,
                          image: AssetImage('assets/onBoarding_image3.png'))),
                )),
          Padding(
            padding: const EdgeInsets.only(bottom: 32),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ValueListenableBuilder(
                  valueListenable: page,
                  builder: (context, index, child) => Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: DotsIndicator(
                      dotsCount: 3,
                      position: page.value,
                      decorator: DotsDecorator(
                        size: const Size(20.0, 6.0),
                        activeSize: const Size(40.0, 6.0),
                        spacing: const EdgeInsets.all(3),
                        activeColor: Colors.black,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0)),
                        activeShape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0)),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(14, 0, 11, 0),
            child: Column(children: [
              if (page.value == 0)
                const Text(
                  'Welcome to the exciting world of soccer with our mobile application dedicated to fans like you!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 14,
                      fontWeight: FontWeight.w400),
                ),
              if (page.value == 1)
                const Text(
                  'Discover the latest matches in progress, follow the action live and immerse yourself in the excitement of the soccer world.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 14,
                      fontWeight: FontWeight.w400),
                ),
              if (page.value == 2)
                const Text(
                  'Browse the latest news, keep up to date with the latest trends and never miss a crucial moment. ',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 14,
                      fontWeight: FontWeight.w400),
                ),
              Padding(
                padding: const EdgeInsets.fromLTRB(14, 84, 20, 40),
                child: InkWell(
                  onTap: () {
                    if (page.value == 0) {
                      page.value = 1;
                      setState(() {});
                    } else if (page.value == 1) {
                      page.value = 2;
                      setState(() {});
                    } else if (page.value == 2) {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute<void>(
                            builder: (BuildContext context) =>
                                const HomePage()),
                      );
                    }
                  },
                  child: Container(
                      width: double.infinity,
                      height: 48,
                      padding: const EdgeInsets.only(top: 13),
                      decoration: BoxDecoration(
                          color: const Color(0xFFF87112),
                          borderRadius: BorderRadius.circular(140)),
                      child: const Text(
                        'Continue',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      )),
                ),
              ),
              const Text(
                'Terms of use  |  Privacy Policy',
                style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 10,
                    color: Colors.black,
                    fontWeight: FontWeight.w400),
                textAlign: TextAlign.center,
              ),
            ]),
          )
        ]),
      ),
    );
  }

  Widget getStars() {
    List<Widget> list = [];
    for (var i = 0; i < 5; i++) {
      list.add(const Icon(
        Icons.star,
        color: Colors.yellow,
        size: 16,
      ));
    }
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: list,
    );
  }
}
