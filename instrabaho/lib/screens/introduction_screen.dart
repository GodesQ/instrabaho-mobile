import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class IntroSlider extends StatefulWidget {
  const IntroSlider({Key? key}) : super(key: key);

  @override
  State<IntroSlider> createState() => _IntroSliderState();
}

class _IntroSliderState extends State<IntroSlider> {
  final pageController = PageController();
  bool isLastPage = false;
  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(bottom: 80),
        child: PageView(
          onPageChanged: (index) {
            setState(() {
              isLastPage = index == 2;
            });
          },
          controller: pageController,
          children: [
            Container(
              color: Colors.white,
              child: buildPage(
                  'assets/identity.json',
                  'Gusto mo ba ng instant na trabaho?',
                  'Aliqua culpa mollit nisi irure sit incididunt quis exercitation reprehenderit et minim.'),
            ),
            Container(
              color: Colors.white,
              child: buildPage(
                  'assets/create.json',
                  'Gusto mo kumita ng instant?',
                  'Aliqua culpa mollit nisi irure sit incididunt quis exercitation reprehenderit et minim.'),
            ),
            Container(
                color: Colors.white,
                child: buildPage(
                    'assets/learn.json',
                    'Sa Instrabaho posible ang lahat',
                    'Aliqua culpa mollit nisi irure sit incididunt quis exercitation reprehenderit et minim.'))
          ],
        ),
      ),
      bottomSheet: isLastPage
          ? Container(
              height: 80,
              color: Colors.white,
              child: Center(
                child: SizedBox(
                  height: 80,
                  width: 1000,
                  child: TextButton(
                    onPressed: () async {
                      final prefs = await SharedPreferences.getInstance();
                      prefs.setBool('showHome', true);
                      if (!mounted) {
                        return;
                      }
                      Navigator.pushNamedAndRemoveUntil(
                          context, '/auth_screen', (route) => false);
                    },
                    child: const Text(
                      'Get Started',
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 19,
                          color: Colors.orange),
                    ),
                  ),
                ),
              ),
            )
          : Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              height: 80,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                      onPressed: () {
                        pageController.jumpToPage(2);
                      },
                      child: const Text(
                        'SKIP',
                        style: TextStyle(color: Colors.white),
                      )),
                  Center(
                    child: SmoothPageIndicator(
                      controller: pageController,
                      effect: const ExpandingDotsEffect(
                          dotWidth: 10,
                          dotHeight: 10,
                          dotColor: Colors.blueGrey,
                          activeDotColor: Colors.orangeAccent),
                      onDotClicked: (index) => pageController.jumpToPage(index),
                      count: 3,
                    ),
                  ),
                  TextButton(
                      onPressed: () {
                        pageController.nextPage(
                            duration: const Duration(seconds: 1),
                            curve: Curves.easeInOut);
                      },
                      child: const Text(
                        'Next',
                        style: TextStyle(color: Colors.white),
                      ))
                ],
              ),
            ),
    );
  }

  Widget buildPage(String path, String title, String description) => Center(
        child: Padding(
          padding: const EdgeInsets.all(50.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Lottie.asset(path, width: 250),
              // const SizedBox(
              //   height: 10,
              // ),
              Text(
                title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                    color: Colors.black87,
                    fontWeight: FontWeight.w700,
                    fontSize: 20),
              ),
              const SizedBox(
                height: 5,
              ),
              Center(
                child: Text(
                  description,
                  style: const TextStyle(
                      fontWeight: FontWeight.w300,
                      fontSize: 15,
                      color: Colors.black54),
                  textAlign: TextAlign.center,
                ),
              )
            ],
          ),
        ),
      );
}
