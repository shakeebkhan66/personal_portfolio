import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:page_transition/page_transition.dart';
import 'package:personal_portfolio/authentications/login_screen.dart';
import 'package:personal_portfolio/tutee/home_screen.dart';

class SignInAuthenticationProvider with ChangeNotifier {


  // TODO Google Sign In Function
  Future<UserCredential> signInWithGoogle(context) async {
    // Trigger the authentication flow

    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth = await googleUser
        ?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
    Navigator.push(context, PageTransition(type: PageTransitionType.bottomToTop,
        duration: const Duration(milliseconds: 500),
        ctx: context,
        inheritTheme: true,
      child: const HomeScreen(),
    ));
    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  // TODO Sign Out Function
  signOut(context) async{
    if(FirebaseAuth.instance.currentUser != null){
      await FirebaseAuth.instance.signOut();
      Navigator.push(context, PageTransition(type: PageTransitionType.bottomToTop,
        duration: const Duration(milliseconds: 500),
        ctx: context,
        inheritTheme: true,
        child: const LoginScreen(),
      ));
    }else{
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("No User Find")));
    }
  }

}