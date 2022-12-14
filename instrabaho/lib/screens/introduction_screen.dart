import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:instrabaho/bloc/auth_toggle/auth_toggle_bloc.dart';
import 'package:instrabaho/component/myText.dart';
import 'package:instrabaho/screens/auth_wrapper.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:lottie/lottie.dart';

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
                  'assets/slide-1.json',
                  'Gusto mo ba ng instant na trabaho?',
                  'Aliqua culpa mollit nisi irure sit incididunt quis exercitation reprehenderit et minim.'),
            ),
            Container(
              color: Colors.white,
              child: buildPage(
                  'assets/slide-2.json',
                  'Gusto mo kumita ng instant?',
                  'Aliqua culpa mollit nisi irure sit incididunt quis exercitation reprehenderit et minim.'),
            ),
            Container(
                color: Colors.white,
                child: buildPage(
                    'assets/slide-3.json',
                    'Sa Instrabaho posible ang lahat',
                    'Aliqua culpa mollit nisi irure sit incididunt quis exercitation reprehenderit et minim.'))
          ],
        ),
      ),
      bottomSheet: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        height: 150,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                    onPressed: () {
                      pageController.jumpToPage(2);
                    },
                    child: const Text(
                      'SKIP',
                      style: TextStyle(color: Colors.blue),
                    )),
                Center(
                  child: SmoothPageIndicator(
                    controller: pageController,
                    effect: const ExpandingDotsEffect(
                        dotWidth: 10,
                        dotHeight: 10,
                        dotColor: Colors.orange,
                        activeDotColor: Colors.blueAccent),
                    onDotClicked: (index) => pageController.jumpToPage(index),
                    count: 3,
                  ),
                ),
                TextButton(
                    onPressed: () {
                      if (isLastPage) {
                        pageController.jumpToPage(0);
                      } else {
                        pageController.nextPage(
                            duration: const Duration(milliseconds: 200),
                            curve: Curves.easeInOut);
                      }
                    },
                    child: Text(
                      isLastPage ? 'Back' : 'Next',
                      style: const TextStyle(color: Colors.blueAccent),
                    ))
              ],
            ),
            InkWell(
              onTap: () async {
                BlocProvider.of<AuthToggleBloc>(context)
                    .add(SwitchToLoginEvent());
                pushToAuthWrapper(false);
              },
              splashColor: Colors.orange,
              child: Ink(
                child: Container(
                  padding: const EdgeInsets.all(13),
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(20)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: const [
                      MyText(
                        text: 'Login',
                        size: 14,
                        type: 'heading',
                        color: Colors.white,
                      )
                    ],
                  ),
                ),
              ),
            ),
            TextButton(
                onPressed: () async {
                  BlocProvider.of<AuthToggleBloc>(context)
                      .add(SwitchToRegisterEvent());
                  await pushToAuthWrapper(true);
                },
                child:
                    const MyText(text: 'New to instrabaho? Sign up', size: 14))
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
              Lottie.asset(path, width: 250),
              const SizedBox(
                height: 10,
              ),
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

  Future pushToAuthWrapper(bool fromRegister) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool('showHome', true);
    if (!mounted) {
      return;
    }

    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
            builder: (context) => AuthenticationScreen(
                  fromRegister: fromRegister,
                )),
        (route) => false);
  }
}
