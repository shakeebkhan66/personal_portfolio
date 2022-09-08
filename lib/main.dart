import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:personal_portfolio/providers/google_signin_providerclass.dart';
import 'package:provider/provider.dart';
import 'intro_slider_screen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Tutor & Tutee',
        home: IntroSliderScreen(),
      ),
    );
  }
}
