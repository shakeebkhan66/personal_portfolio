import 'package:flutter/material.dart';
import 'package:personal_portfolio/authentications/login_screen.dart';
import 'package:personal_portfolio/tutee/ProfessorsScreens/prof_dashboard_screen.dart';
import 'package:personal_portfolio/tutee/home_screen.dart';
import 'package:personal_portfolio/tutee/tutor_profile_screen.dart';
import 'package:personal_portfolio/tuteeallpages/tutee_home_screen.dart';

import 'intro_slider_screen.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tutor & Tutee',
      home: IntroSliderScreen(),
    );
  }
}


