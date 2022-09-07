import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:page_transition/page_transition.dart';
import 'package:personal_portfolio/authentications/register_screen.dart';
import 'package:personal_portfolio/providers/google_signin_providerclass.dart';
import 'package:personal_portfolio/tutee/home_screen.dart';
import 'package:personal_portfolio/widgets/mywidets.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool Loading = false;

  @override
  Widget build(BuildContext context) {
    final googleSignInProvider =
        Provider.of<SignInAuthenticationProvider>(context);
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
          child: ListView(
        children: [
          Container(
            padding: const EdgeInsets.only(top: 15),
            child: Image.asset(
              "assets/images/ttt.png",
              height: 290,
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: TextFormField(
              decoration: const InputDecoration(
                  hintText: "enter your email",
                  hintStyle: TextStyle(color: Colors.white54),
                  labelText: "Email",
                  labelStyle: TextStyle(
                      color: Colors.white70,
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white70),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white70),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white70),
                  )),
            ),
          ),
          const SizedBox(
            height: 10.0,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: TextFormField(
              decoration: const InputDecoration(
                  hintText: "enter your password",
                  hintStyle: TextStyle(color: Colors.white54),
                  labelText: "Password",
                  labelStyle: TextStyle(
                      color: Colors.white70,
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white70),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white70),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white70),
                  )),
            ),
          ),
          const SizedBox(
            height: 20.0,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0),
                  color: buttonColor,
                ),
                child: MaterialButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      PageTransition(
                          type: PageTransitionType.leftToRight,
                          alignment: Alignment.center,
                          duration: const Duration(milliseconds: 500),
                          child: const HomeScreen(),
                          inheritTheme: true,
                          ctx: context),
                    );
                  },
                  child: const Text(
                    "L O G I N",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w900),
                  ),
                )),
          ),
          const SizedBox(
            height: 30,
          ),
          Container(
              alignment: Alignment.bottomCenter,
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (ctx) => const RegisterScreen()));
                },
                child: RichText(
                  text: const TextSpan(children: [
                    TextSpan(
                      text: "No Account? ",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                    TextSpan(
                      text: "R E G I S T E R",
                      style: TextStyle(
                          color: buttonColor,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline),
                    )
                  ]),
                ),
              )),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 25, horizontal: 20),
            child: const Text(
              "Or Login With!",
              style: TextStyle(color: Colors.white70),
            ),
          ),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 80),
              child: Loading == false
                  ? SignInButton(
                      Buttons.Google,
                      onPressed: () {
                        googleSignInProvider.signInWithGoogle(context);
                        setState(() {
                          Loading = true;
                        });
                      },
                    )
                  : const Center(
                      child: CircularProgressIndicator(color: Colors.white))),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 80),
            child: SignInButton(
              Buttons.Facebook,
              onPressed: () {},
            ),
          )
        ],
      )),
    );
  }
}
