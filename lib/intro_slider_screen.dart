import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:intro_slider/intro_slider.dart';
import 'package:page_transition/page_transition.dart';
import 'package:personal_portfolio/authentications/login_screen.dart';
import 'package:personal_portfolio/tutee/home_screen.dart';
import 'package:personal_portfolio/welcome_screen.dart';

class IntroSliderScreen extends StatefulWidget {
  const IntroSliderScreen({Key? key}) : super(key: key);

  @override
  State<IntroSliderScreen> createState() => _IntroSliderScreenState();
}

class _IntroSliderScreenState extends State<IntroSliderScreen> {
  List<Slide> slides = [];

  @override
  void initState() {
    super.initState();
    slides.add(Slide(
      backgroundImage: "assets/images/intro.jpg",
      backgroundImageFit: BoxFit.contain,
      backgroundColor: Colors.white,
    ));
    slides.add(Slide(
      backgroundImage: "assets/images/intro4.jpeg",
      backgroundImageFit: BoxFit.contain,
      backgroundColor: Colors.white,
    ));
    slides.add(Slide(
      backgroundImage: "assets/images/intro5.jpg",
      backgroundImageFit: BoxFit.contain,
      backgroundColor: Colors.white,
    ));
  }

  void onDonePress() {
    // Do what you want
    log("End of slides");
    Navigator.push(
        context,
        PageTransition(
          type: PageTransitionType.leftToRight,
          duration: const Duration(milliseconds: 600),
          child: const LoginScreen(),
          inheritTheme: true,
          ctx: context,
        ));
  }

  @override
  Widget build(BuildContext context) {
    return IntroSlider(
      slides: slides,
      scrollPhysics: const BouncingScrollPhysics(),
      colorDot: Colors.black,
      colorActiveDot: Colors.deepPurple,
      nextButtonStyle: ButtonStyle(
        foregroundColor: MaterialStateProperty.all(
          Colors.deepPurple,
        ),
      ),
      prevButtonStyle: ButtonStyle(
          foregroundColor: MaterialStateProperty.all(Colors.deepPurple)),
      skipButtonStyle: ButtonStyle(
        foregroundColor: MaterialStateProperty.all(Colors.deepPurple),
      ),
      doneButtonStyle: ButtonStyle(
        foregroundColor: MaterialStateProperty.all(Colors.deepPurple),
      ),
      backgroundColorAllSlides: Colors.white70,
      onDonePress: onDonePress,
    );
  }
}
