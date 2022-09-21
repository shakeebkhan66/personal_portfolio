import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:personal_portfolio/providers/authentication_provider_class.dart';
import 'package:personal_portfolio/tutee/home_screen.dart';
import 'package:personal_portfolio/SharedPref/shared_preference_class.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'intro_slider_screen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SharedPreferenceClass.preferences = await SharedPreferences.getInstance();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<SignInAuthenticationProvider>(create: (_) => SignInAuthenticationProvider())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Tutor & Tutee',
        home: SharedPreferenceClass.preferences?.getBool("loggedIn") == true
        ? HomeScreen()
        : IntroSliderScreen(),
      ),
    );
  }
}
