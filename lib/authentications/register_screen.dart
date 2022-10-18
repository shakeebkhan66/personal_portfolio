import 'dart:convert';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:page_transition/page_transition.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:personal_portfolio/SharedPref/shared_preference_class.dart';
import 'package:personal_portfolio/authentications/google_map_screen.dart';
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
  bool imageLoading = false;
  FirebaseAuth auth = FirebaseAuth.instance;
  final user = FirebaseAuth.instance.currentUser;
  final currentUser = FirebaseAuth.instance;

  // TODO Text Editing Controllers
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController chargePerHourController = TextEditingController();
  String? latitude;
  String? longitude;
  String? imageFile;
  final picker = ImagePicker();

  // TODO Phone Number Validation RegExp
  RegExp regExpMobile = RegExp(r'(^(?:[+0]9)?[0-9]{10,12}$)');

  // TODO Email Validation RegExp
  RegExp regExpEmail = RegExp(
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))'
      r'@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]'
      r'+\.)+[a-zA-Z]{2,}))$');

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
  void textFieldValidation() async {
    if (formKey.currentState!.validate()) {
      print("Validation oka");
      registerUser();
    } else {
      print("no ok");
    }
  }

  // uploadImage() async {
  //   final _firebaseStorage = FirebaseStorage.instance;
  //   final _imagePicker = ImagePicker();
  //   PickedFile? image;
  //   //Check Permissions
  //   await Permission.photos.request();
  //
  //   var permissionStatus = await Permission.photos.status;
  //
  //   if (permissionStatus.isGranted) {
  //     //Select Image
  //     image = await _imagePicker.getImage(source: ImageSource.gallery);
  //     var file = File(image!.path);
  //
  //     if (image != null) {
  //       //Upload to Firebase
  //       var snapshot = await _firebaseStorage
  //           .ref()
  //           .child('images')
  //           .putFile(file);
  //       var downloadUrl = await snapshot.ref.getDownloadURL();
  //       setState(() {
  //         imageFile = downloadUrl;
  //         Fluttertoast.showToast(msg: "Image Get Successfully");
  //       });
  //     } else {
  //       print('No Image Path Received');
  //     }
  //   } else {
  //     print('Permission not granted. Try Again with permission access');
  //   }
  // }


  // TODO Pick Image and Upload It

  /// Active image file
  File? _imageFile;
  String? imageSnap;

  /// Select an image via gallery
  Future pickImage(ImageSource source) async {
    await Permission.photos.request();
    var permissionStatus = await Permission.photos.status;
    if(permissionStatus.isGranted){
      XFile? selected = (await ImagePicker().pickImage(source: source)) as XFile;
      /// Upload Image to Firebase
      final file = File(selected.path);
      final destination = "${emailController.text}/${DateTime.now()}.png";
      Reference reference =
      FirebaseStorage.instance.ref("Profile_Images").child(destination);
      UploadTask _uploadTask = reference.putFile(file);
      _uploadTask.whenComplete(() async {
        try {
          String uploadedImageUrl = await reference.getDownloadURL();
          imageSnap = uploadedImageUrl;
          // showToaster("Image uploaded successfully");
          print("This is URL: $imageSnap");
        } catch (e) {
          print(e.toString());
          print("Image Get Successfully");
        }
      });
    }else {
      print('Permission not granted. Try Again with permission access');
    }
  }

  void registerUser() async {
    try {
      FirebaseAuth.instance
          .createUserWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      )
          .then((signedInUser) {
        FirebaseFirestore.instance
            .collection("tutor&tutte")
            .doc(signedInUser.user!.uid)
            .set({
          "uid": currentUser.currentUser!.uid,
          "firstName": firstNameController.text,
          "lastName": lastNameController.text,
          "mobileNo": mobileController.text,
          "email": emailController.text,
          "password": passwordController.text,
          "latitude": double.parse(latitude.toString()),
          "longitude": double.parse(longitude.toString()),
          "chargeHour": chargePerHourController.text,
          "selectedSubject": selectedSubject != null ? selectedSubject : "",
          "image": imageSnap,
        });
        if (user != null && !user!.emailVerified) {
          user!.sendEmailVerification();
          Fluttertoast.showToast(msg: "Check your email for verification");
        }
      });
    } on FirebaseException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
        Fluttertoast.showToast(
            msg: "The account already exists for that email.");
      }
    } catch (e) {
      print(e.toString());
    }
    Navigator.push(
        context, MaterialPageRoute(builder: (ctx) => const LoginScreen()));
  }

  @override
  void initState() {
    // TODO Store Latitude & Longitude in Variable from SharedPreference
    latitude =
        SharedPreferenceClass.preferences?.getDouble("latitude").toString();
    longitude =
        SharedPreferenceClass.preferences?.getDouble("longitude").toString();
    print("My Latitude  $latitude");
    print("My longitude $longitude");
    super.initState();
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
                cursorColor: Colors.white,
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
                cursorColor: Colors.white,
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
                cursorColor: Colors.white,
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
                cursorColor: Colors.white,
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
                cursorColor: Colors.white,
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
                      showOnOff: false,
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
                      cursorColor: Colors.white,
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
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const GoogleMapScreen()));
              },
              child: Container(
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
                              "A D D   L O C A T I O N",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.white70,
                                  fontWeight: FontWeight.bold),
                            )),
                      )
                    ],
                  )),
            ),
            const SizedBox(
              height: 6.0,
            ),
            InkWell(
              onTap: (){
                showDialog(
                    context: context,
                    builder: (BuildContext context){
                      return  Dialog(
                        insetPadding: const EdgeInsets.only(top: 100, bottom: 500, left: 20, right: 20),
                        child: Column(
                          children: [
                            ListTile(
                              title: const Text("Pick Image from Gallery"),
                              trailing: const Icon(Icons.browse_gallery),
                              onTap: (){
                                pickImage(ImageSource.gallery);
                                Navigator.pop(context);
                              },
                            ),
                            ListTile(
                              title: const Text("Pick Image from Camera"),
                              trailing: const Icon(Icons.camera),
                              onTap: (){
                                pickImage(ImageSource.camera);
                                Navigator.pop(context);
                              },
                            )
                          ],
                        ),
                      );
                    }
                );
              },
              child: Container(
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
                            padding: EdgeInsets.only(left: 5.0),
                            child: Text(
                              "A D D   I M A G E",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.white70,
                                  fontWeight: FontWeight.bold),
                            )),
                      )
                    ],
                  )),
            ),
            Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 10.0, vertical: 15.0),
                child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.0),
                      color: buttonColor,
                    ),
                    child: isLoading == false
                        ? MaterialButton(
                            onPressed: () {
                              textFieldValidation();
                              setState(() {
                                isLoading = true;
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
