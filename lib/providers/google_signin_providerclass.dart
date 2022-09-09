import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
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

  // TODO Facebook Sign In Function
  void signInWithFacebook(context) async {
    try {
      final LoginResult result = await FacebookAuth.instance.login(permissions: (['email', 'public_profile']));
      final token = result.accessToken!.token;
      print('Facebook token userID : ${result.accessToken!.grantedPermissions}');
      final graphResponse = await http.get(Uri.parse( 'https://graph.facebook.com/'
          'v2.12/me?fields=name,first_name,last_name,email&access_token=${token}'));

      final profile = jsonDecode(graphResponse.body);
      print("Profile is equal to $profile");
      try {
        final AuthCredential facebookCredential = FacebookAuthProvider.credential(result.accessToken!.token);
        final userCredential = await FirebaseAuth.instance.signInWithCredential(facebookCredential);
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const HomeScreen()),
        );
      }catch(e)
      {
        final snackBar = SnackBar(
          margin: const EdgeInsets.all(20),
          behavior: SnackBarBehavior.floating,
          content:  Text(e.toString()),
          backgroundColor: (Colors.redAccent),
          action: SnackBarAction(
            label: 'dismiss',
            onPressed: () {
            },
          ),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }

    } catch (e) {
      print("error occurred");
      print(e.toString());
    }
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
