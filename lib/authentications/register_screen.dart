import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:page_transition/page_transition.dart';
import 'package:personal_portfolio/authentications/login_screen.dart';
import 'package:personal_portfolio/widgets/mywidets.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool choice = false;
  String? selectedSubject;
  final formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  bool Loading = false;
  bool isLoading = false;
  FirebaseAuth auth = FirebaseAuth.instance;

  // TODO Phone Number Validation RegExp
  RegExp regExpMobile = RegExp(r'(^(?:[+0]9)?[0-9]{10,12}$)');

  // TODO Email Validation RegExp
  RegExp regExpEmail = RegExp(
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))'
      r'@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]'
      r'+\.)+[a-zA-Z]{2,}))$');

  // TODO Text Editing Controllers
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController chargePerHourController = TextEditingController();

  List subjects = [
    "Computer",
    "Mathematics",
    "Physics",
    "Chemistry",
    "Biology",
    "English",
    "Statistics",
    "Accounting",
    "Graphic Designing",
    "Flutter",
    "Python"
  ];

  // TODO Validate TextField Function
  void textFieldValidation() async{
    if (formKey.currentState!.validate()) {
      print("Validatation Oka");
      submit();
      } else {
      print("no ok");
    }
    }
    UserCredential? result;
  void submit() async {
    try {
      setState(() {
        isLoading = true;
      });
      result = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);
      print(result);
      User? user = FirebaseAuth.instance.currentUser;
      if (user!.emailVerified) {
        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=> const LoginScreen()));
      }
    } on PlatformException catch (error) {
      var message = "Please Check Your Internet Connection ";
      if (error.message != null) {
        message = error.message!;
      }
      _scaffoldKey.currentState?.showSnackBar(SnackBar(
        content: Text(message.toString()),
        duration: const Duration(milliseconds: 600),
        backgroundColor: Theme.of(context).primaryColor,
      ));
      setState(() {
        isLoading = false;
      });
    } catch (error) {
      setState(() {
        isLoading = false;
      });
      _scaffoldKey.currentState?.showSnackBar(SnackBar(
        content: Text(error.toString()),
        duration: const Duration(milliseconds: 600),
        backgroundColor: Theme.of(context).primaryColor,
      ));

      print(error);
    }
    User? user = FirebaseAuth.instance.currentUser;

    if (user!= null && !user.emailVerified) {
      await user.sendEmailVerification();
    }

    FirebaseFirestore.instance.collection("AdminUserLogin").doc(result?.user!.uid).set({
      "firstname": firstNameController.text,
      "lastname": lastNameController.text,
      "mobileNo": mobileController.text,
      "email": emailController.text,
      "password": passwordController.text,
      "UserId": result?.user!.uid,
      // "UserGender": isMale == true ? "Male" : "Female",
    });
    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (ctx) => const LoginScreen()));
    setState(() {
      isLoading = false;
    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: backgroundColor,
        automaticallyImplyLeading: false,
        elevation: 0.1,
        title: const Center(
          child: Text(
            "T U T O R  +  T U T E E",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: SafeArea(
          child: Form(
        key: formKey,
        child: ListView(
          children: [
            const SizedBox(
              height: 8.0,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: TextFormField(
                controller: firstNameController,
                validator: (value) {
                  if (value!.isEmpty) {
                    Fluttertoast.showToast(msg: "please provide first name");
                  } else if (value.length < 3) {
                    Fluttertoast.showToast(
                        msg: "name should be greater than 3");
                  }
                  return;
                },
                style: const TextStyle(color: Colors.white),
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                    hintText: "enter first name",
                    hintStyle: TextStyle(color: Colors.white54),
                    labelText: "First Name",
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
                controller: lastNameController,
                validator: (value) {
                  if (value!.isEmpty) {
                    Fluttertoast.showToast(msg: "please provide last name");
                  } else if (value.length < 3) {
                    Fluttertoast.showToast(
                        msg: "name should be greater than 3");
                  }
                  return;
                },
                style: const TextStyle(color: Colors.white),
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                    hintText: "enter last name",
                    hintStyle: TextStyle(color: Colors.white54),
                    labelText: "Last Name",
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
                validator: (value) {
                  if (value!.isEmpty) {
                    Fluttertoast.showToast(
                        msg: "please provide your mobile number");
                  } else if (!regExpMobile.hasMatch(value)) {
                    Fluttertoast.showToast(msg: "provide valid mobile number");
                  }
                  return;
                },
                controller: mobileController,
                style: const TextStyle(color: Colors.white),
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                    hintText: "enter phone number",
                    hintStyle: TextStyle(color: Colors.white54),
                    labelText: "Phone Number",
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
              height: 15.0,
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Text(
                    "S T U D E N T",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w900),
                  ),
                  FlutterSwitch(
                      width: 75.0,
                      height: 35.0,
                      valueFontSize: 15.0,
                      toggleSize: 15.0,
                      borderRadius: 30.0,
                      padding: 8.0,
                      showOnOff: true,
                      activeColor: Colors.deepPurple,
                      value: choice,
                      onToggle: (val) {
                        setState(() {
                          choice = val;
                        });
                      }),
                  const Text(
                    "T U T O R",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w900),
                  ),
                ],
              ),
            ),
            choice == false
                ? Container()
                : Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10.0, horizontal: 20),
                    child: DropdownButton(
                      dropdownColor: backgroundColor,
                      iconEnabledColor: Colors.white,
                      iconDisabledColor: Colors.white,
                      hint: const Text(
                        'Select Subject',
                        style: TextStyle(color: Colors.white),
                      ),
                      // Not necessary for Option 1
                      value: selectedSubject,
                      onChanged: (newValue) {
                        setState(() {
                          selectedSubject = newValue.toString();
                        });
                      },
                      items: subjects.map((subject) {
                        return DropdownMenuItem(
                          child: Text(
                            subject,
                            style: TextStyle(color: Colors.white),
                          ),
                          value: subject,
                        );
                      }).toList(),
                    ),
                  ),
            choice == false
                ? Container()
                : Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: TextFormField(
                      controller: chargePerHourController,
                      keyboardType: TextInputType.number,
                      style: const TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        fillColor: backgroundColor,
                        filled: true,
                        hintText: "how much do you charge per hour",
                        hintStyle: const TextStyle(color: Colors.white54),
                        labelText: "Charge Per Hour",
                        labelStyle: const TextStyle(
                            color: Colors.white70,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
            const SizedBox(
              height: 15.0,
            ),
            Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Row(
                  children: [
                    Container(
                      height: 30,
                      width: 170,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: Colors.deepPurple.shade500,
                          borderRadius: BorderRadius.circular(20)),
                      child: const Padding(
                          padding: EdgeInsets.only(left: 9.0),
                          child: Text(
                            "A D D  L O C A T I O N",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.white70,
                                fontWeight: FontWeight.bold),
                          )),
                    )
                  ],
                )),
            Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 10.0, vertical: 15.0),
                child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.0),
                      color: buttonColor,
                    ),
                    child: Loading == false
                        ? MaterialButton(
                            onPressed: () {
                              // Navigator.push(
                              //   context,
                              //   PageTransition(
                              //       type: PageTransitionType.leftToRight,
                              //       alignment: Alignment.center,
                              //       duration: const Duration(milliseconds: 500),
                              //       child: const LoginScreen(),
                              //       inheritTheme: true,
                              //       ctx: context),
                              // );
                              textFieldValidation();
                              setState(() {
                                Loading = true;
                              });
                              setState(() {
                                Loading = false;
                              });
                            },
                            child: const Text(
                              "R E G I S T E R",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w900),
                            ),
                          )
                        : const Center(
                            child: CircularProgressIndicator(
                            color: Colors.white,
                          )))),
            // const SizedBox(
            //   height: 8.0,
            // ),
            Container(
                alignment: Alignment.bottomCenter,
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      PageTransition(
                          type: PageTransitionType.leftToRight,
                          alignment: Alignment.center,
                          duration: const Duration(milliseconds: 500),
                          child: const LoginScreen(),
                          inheritTheme: true,
                          ctx: context),
                    );
                  },
                  child: RichText(
                    text: const TextSpan(children: [
                      TextSpan(
                        text: "Already have an account? ",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                      TextSpan(
                        text: "L O G I N",
                        style: TextStyle(
                            color: buttonColor,
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline),
                      )
                    ]),
                  ),
                )),
            const SizedBox(
              height: 10.0,
            )
          ],
        ),
      )),
    );
  }
}
