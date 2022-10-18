import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:personal_portfolio/authentications/login_screen.dart';
import 'package:personal_portfolio/widgets/mywidets.dart';
import 'package:progress_indicators/progress_indicators.dart';

class MyAccountScreen extends StatefulWidget {
  const MyAccountScreen({Key? key}) : super(key: key);

  @override
  State<MyAccountScreen> createState() => _MyAccountScreenState();
}

class _MyAccountScreenState extends State<MyAccountScreen> {


  String dummyImage = "https://png.pngtree.com/element_our/png/20181206/users-vector-icon-png_260862.jpg";
  final myUid = FirebaseAuth.instance;

  // TODO Controllers
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController mobileNoController = TextEditingController();
  TextEditingController passwordController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    print("Current UID is $myUid");
    return Scaffold(
      backgroundColor: backgroundColor,
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('tutor&tutte').where("uid", isEqualTo: myUid.currentUser!.uid).snapshots(),
        builder: (BuildContext context, AsyncSnapshot snapshot){
          if(!snapshot.hasData){
            return  Center(
                child: JumpingText('Loading...', style: const TextStyle(color: Colors.white, fontSize: 24),));
          }else if(snapshot.hasData && snapshot.data?.size == 0){
            return const Center(child: Text("No Data Found"),);
          }
          return ListView.builder(
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (context, index){
              String? imageUrl = snapshot.data?.docs[index]['image'];
              firstNameController.text = snapshot.data?.docs[index]['firstName'];
              lastNameController.text = snapshot.data?.docs[index]['lastName'];
              mobileNoController.text = snapshot.data?.docs[index]['mobileNo'];
              passwordController.text = snapshot.data?.docs[index]['password'];

              return Column(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 10),
                    child: const Text(
                      "M Y  P R O F I L E",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 22),
                    ),
                  ),
                  Container(
                      alignment: Alignment.center,
                      margin: const EdgeInsets.only(top: 20),
                      child:  CircleAvatar(
                        radius: 65,
                        backgroundColor: buttonColor,
                        backgroundImage: imageUrl!.isEmpty ? NetworkImage(dummyImage) : NetworkImage(imageUrl!),
                      )
                  ),
                  Container(
                      margin: const EdgeInsets.only(top: 25),
                      child: Column(
                        children: [
                          Row(
                            children:  [
                              const SizedBox(width: 50, height: 40,),
                              const Text("First Name :", style: TextStyle(color: Colors.white, fontSize: 17,),),
                              const SizedBox(width: 20,),
                              Text(snapshot.data?.docs[index]['firstName'], style: const TextStyle(color: Colors.white, fontSize: 17, fontWeight: FontWeight.w500),),
                            ],
                          ),
                          Row(
                            children:  [
                              const SizedBox(width: 50, height: 40,),
                              const Text("Last Name :", style: TextStyle(color: Colors.white, fontSize: 17,),),
                              const SizedBox(width: 20,),
                              Text(snapshot.data?.docs[index]['lastName'], style: const TextStyle(color: Colors.white, fontSize: 17, fontWeight: FontWeight.w500),),
                            ],
                          ),
                          Row(
                            children: [
                              const SizedBox(width: 50, height: 40,),
                              const Text("Email :", style: TextStyle(color: Colors.white, fontSize: 17,),),
                              const SizedBox(width: 20,),
                              Text(snapshot.data?.docs[index]['email'], style: const TextStyle(color: Colors.white, fontSize: 17, fontWeight: FontWeight.w500),),
                            ],
                          ),
                          Row(
                            children: [
                              const SizedBox(width: 50, height: 40,),
                              const Text("Phone # :", style: TextStyle(color: Colors.white, fontSize: 17,),),
                              const SizedBox(width: 20,),
                              Text(snapshot.data?.docs[index]['mobileNo'], style: const TextStyle(color: Colors.white, fontSize: 17, fontWeight: FontWeight.w500),),
                            ],
                          ),
                          Row(
                            children: [
                              const SizedBox(width: 50, height: 40,),
                              const Text("Password :", style: TextStyle(color: Colors.white, fontSize: 17,),),
                              const SizedBox(width: 20,),
                              Text(snapshot.data?.docs[index]['password'], style: const TextStyle(color: Colors.white, fontSize: 17, fontWeight: FontWeight.w500),),
                            ],
                          ),
                        ],
                      )
                  ),
                  const SizedBox(height: 25,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      MaterialButton(
                        onPressed: (){
                          showDialog(
                              context: context,
                              builder: (BuildContext context){
                                return Dialog(
                                  insetPadding: const EdgeInsets.only(bottom: 300, top: 240, left: 20, right: 20),
                                  child: Column(
                                    children:  [
                                      const Padding(
                                        padding:  EdgeInsets.symmetric(horizontal: 12, vertical: 30),
                                          child:  Text("Are you sure to delete this account?", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),)),
                                      const SizedBox(height: 25.0,),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                                        children: [
                                          MaterialButton(
                                            onPressed: (){
                                              Navigator.pop(context);
                                            },
                                            color: buttonColor,
                                            hoverColor: buttonColor.shade100,
                                            splashColor: Colors.white38,
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(12.0),
                                            ),
                                            child: const Text("No", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                                          ),
                                          MaterialButton(
                                            onPressed: (){
                                              FirebaseFirestore.instance.collection('tutor&tutte').doc(myUid.currentUser!.uid).delete();
                                              Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
                                            },
                                            color: Colors.redAccent,
                                            hoverColor: buttonColor.shade100,
                                            splashColor: Colors.white38,
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(12.0),
                                            ),
                                            child: const Text("Yes", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                );
                              }
                          );
                        },
                        color: Colors.redAccent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        child: const Text("Delete", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                      ),
                      MaterialButton(
                        onPressed: (){
                          showDialog(
                              context: context,
                              builder: (BuildContext context){
                                return Dialog(
                                  insetPadding: const EdgeInsets.only(bottom: 200, top: 200, left: 20, right: 20),
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 15.0),
                                        child: TextFormField(
                                          controller: firstNameController,
                                          decoration: const InputDecoration(
                                            labelText: "First Name",
                                            labelStyle: TextStyle(color: buttonColor, fontWeight: FontWeight.bold),
                                            border: UnderlineInputBorder(),
                                            focusedBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(color: buttonColor),
                                            ),
                                            enabledBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(color: Colors.black45),
                                            )
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 15.0),
                                        child: TextFormField(
                                          controller: lastNameController,
                                          decoration: const InputDecoration(
                                              labelText: "Last Name",
                                              labelStyle: TextStyle(color: buttonColor, fontWeight: FontWeight.bold),
                                              border: UnderlineInputBorder(),
                                              focusedBorder: UnderlineInputBorder(
                                                borderSide: BorderSide(color: buttonColor),
                                              ),
                                              enabledBorder: UnderlineInputBorder(
                                                borderSide: BorderSide(color: Colors.black45),
                                              )
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 15.0),
                                        child: TextFormField(
                                          controller: mobileNoController,
                                          decoration: const InputDecoration(
                                              labelText: "Mobile No",
                                              labelStyle: TextStyle(color: buttonColor, fontWeight: FontWeight.bold),
                                              border: UnderlineInputBorder(),
                                              focusedBorder: UnderlineInputBorder(
                                                borderSide: BorderSide(color: buttonColor),
                                              ),
                                              enabledBorder: UnderlineInputBorder(
                                                borderSide: BorderSide(color: Colors.black45),
                                              )
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 15.0),
                                        child: TextFormField(
                                          controller: passwordController,
                                          decoration: const InputDecoration(
                                              labelText: "Password",
                                              labelStyle: TextStyle(color: buttonColor, fontWeight: FontWeight.bold),
                                              border: UnderlineInputBorder(),
                                              focusedBorder: UnderlineInputBorder(
                                                borderSide: BorderSide(color: buttonColor),
                                              ),
                                              enabledBorder: UnderlineInputBorder(
                                                borderSide: BorderSide(color: Colors.black45),
                                              )
                                          ),
                                        ),
                                      ),
                                      const SizedBox(height: 10),
                                      MaterialButton(
                                        onPressed: (){},
                                        color: buttonColor,
                                        hoverColor: buttonColor.shade100,
                                        splashColor: Colors.white38,
                                        minWidth: 300,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(12.0),
                                        ),
                                        child: const Text("Change", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                                      )
                                    ],
                                  ),
                                );
                              }
                          );
                        },
                        color: buttonColor,
                        hoverColor: buttonColor.shade100,
                        splashColor: Colors.white38,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        child: const Text("Update", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                      ),
                    ],
                  )

                ],
              );
            },
          );
        },
      ),
    );

  }
}
