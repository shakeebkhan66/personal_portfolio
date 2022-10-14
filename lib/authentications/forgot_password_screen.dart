import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:personal_portfolio/authentications/login_screen.dart';
import '../widgets/mywidets.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  String email = '';
  bool isLoading = false;

  // TODO Email Validation RegExp
  RegExp regExpEmail = RegExp(
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))'
      r'@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]'
      r'+\.)+[a-zA-Z]{2,}))$');

  // ToDo TextEditingController
  TextEditingController emailController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  // ToDo Validator
  void validate() {
    if (formKey.currentState!.validate()) {
      setState(() {
        email = emailController.text;
        isLoading = true;
      });
      changePassword();
    }
  }

  // ToDo Change Password Function
  changePassword() async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      Fluttertoast.showToast(msg: "Check your email for change password");
      setState(() {
        isLoading = false;
      });
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => LoginScreen()));
    } catch (e) {
      Fluttertoast.showToast(msg: e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: isLoading == true
          ? const Center(
              child: SpinKitDoubleBounce(
              color: Colors.white,
              size: 50,
            ))
          : SafeArea(
              child: SingleChildScrollView(
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Container(
                            height: 80,
                            width: 80,
                            decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                    bottomRight: Radius.circular(25.0),
                                    bottomLeft: Radius.circular(25.0))),
                            child: Icon(
                              Icons.lock_reset_rounded,
                              color: backgroundColor,
                              size: 43,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        alignment: Alignment.topLeft,
                        padding: const EdgeInsets.symmetric(
                            vertical: 60, horizontal: 8.0),
                        child: const Text(
                          "C h a n g e   P a s s w o r d",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                              fontSize: 23),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: TextFormField(
                          controller: emailController,
                          cursorColor: Colors.white,
                          style: const TextStyle(color: Colors.white),
                          validator: (value) {
                            if (value!.isEmpty) {
                              Fluttertoast.showToast(
                                  msg: "please provide your email");
                            } else if (!regExpEmail.hasMatch(value)) {
                              Fluttertoast.showToast(
                                  msg: "provide valid email");
                            }
                            return;
                          },
                          decoration: const InputDecoration(
                              prefixIcon: Icon(
                                Icons.email,
                                color: Colors.white70,
                              ),
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
                      const SizedBox(height: 30),
                      MaterialButton(
                        onPressed: () {
                          validate();
                        },
                        color: Colors.white70,
                        minWidth: 300,
                        splashColor: backgroundColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: const Text(
                          "Change Password",
                          style: TextStyle(
                              color: buttonColor,
                              fontWeight: FontWeight.w800,
                              fontSize: 17),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}
