import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:page_transition/page_transition.dart';
import 'package:personal_portfolio/authentications/register_screen.dart';
import 'package:personal_portfolio/providers/authentication_provider_class.dart';
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
  bool isLoading = false;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  // TODO Email Validation RegExp
  RegExp regExpEmail = RegExp(
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))'
      r'@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]'
      r'+\.)+[a-zA-Z]{2,}))$');

  // TODO Validation Function
  void textFieldValidation() async{
    if (formKey.currentState!.validate()) {
      print("Validation oka");
      signInUser();
    } else {
      print("no ok");
    }
  }

  // TODO Sign In Function
  void signInUser() async{
    try{
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text,
          password: passwordController.text,
      );
      User? user = FirebaseAuth.instance.currentUser;
      if(user!.emailVerified){
        Navigator.push(context, MaterialPageRoute(builder: (ctx) => HomeScreen()));
      }else{
        Fluttertoast.showToast(msg: "Please Verify your email first");
      }
    } on FirebaseAuthException catch(e){
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    } catch(e){
      print(e.toString());
      Fluttertoast.showToast(msg: e.toString());
    }
  }


  @override
  Widget build(BuildContext context) {
    final googleSignInProvider =
        Provider.of<SignInAuthenticationProvider>(context);
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
          child: Form(
            key: formKey,
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
                controller: emailController,
                validator: (value) {
                  if (value!.isEmpty) {
                    Fluttertoast.showToast(msg: "please provide your email");
                  } else if (!regExpEmail.hasMatch(value)) {
                    Fluttertoast.showToast(msg: "provide valid email");
                  }
                  return;
                },
                style: const TextStyle(color: Colors.white),
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
                controller: passwordController,
                obscureText: true,
                validator: (value) {
                  if (value!.isEmpty) {
                    Fluttertoast.showToast(msg: "please provide your password");
                  } else if (value.length < 6) {
                    Fluttertoast.showToast(
                        msg: "password should be greater than 6");
                  }
                  return;
                },
                style: const TextStyle(color: Colors.white),
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
                      // Navigator.push(
                      //   context,
                      //   PageTransition(
                      //       type: PageTransitionType.leftToRight,
                      //       alignment: Alignment.center,
                      //       duration: const Duration(milliseconds: 500),
                      //       child: const HomeScreen(),
                      //       inheritTheme: true,
                      //       ctx: context),
                      // );
                      textFieldValidation();
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
              child: isLoading == false ? SignInButton(
                Buttons.Facebook,
                onPressed: () {
                  googleSignInProvider.signInWithFacebook(context);
                  setState(() {
                    isLoading = true;
                  });
                },
              ) : const Center(
                  child: CircularProgressIndicator(color: Colors.white))
            )
        ],
      ),
          )),
    );
  }
}
