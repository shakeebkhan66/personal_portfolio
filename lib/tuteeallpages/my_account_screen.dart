import 'package:flutter/material.dart';
import 'package:personal_portfolio/widgets/mywidets.dart';

class MyAccountScreen extends StatefulWidget {
  const MyAccountScreen({Key? key}) : super(key: key);

  @override
  State<MyAccountScreen> createState() => _MyAccountScreenState();
}

class _MyAccountScreenState extends State<MyAccountScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Column(
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
              child: const CircleAvatar(
                radius: 65,
                backgroundImage: NetworkImage(
                    "https://avatars.githubusercontent.com/u/73787635?s=400&u"
                        "=9e56edcc2cd6c94b6c9c364b12c08920bbb9229c&v=4"),
              )
            ),
            Container(
              margin: const EdgeInsets.only(top: 25, left: 35),
              child: Column(
                children: [
                  Row(
                    children: const [
                      SizedBox(width: 50, height: 40,),
                      Text("Name :", style: TextStyle(color: Colors.white, fontSize: 17,),),
                      SizedBox(width: 20,),
                      Text("Shakeeb Khan", style: TextStyle(color: Colors.white, fontSize: 17, fontWeight: FontWeight.w500),),
                    ],
                  ),
                  Row(
                    children: const [
                      SizedBox(width: 50, height: 40,),
                      Text("Email :", style: TextStyle(color: Colors.white, fontSize: 17,),),
                      SizedBox(width: 20,),
                      Text("abc@gmail.com", style: TextStyle(color: Colors.white, fontSize: 17, fontWeight: FontWeight.w500),),
                    ],
                  ),
                  Row(
                    children: const [
                      SizedBox(width: 50, height: 40,),
                      Text("Phone # :", style: TextStyle(color: Colors.white, fontSize: 17,),),
                      SizedBox(width: 20,),
                      Text("+923147896819", style: TextStyle(color: Colors.white, fontSize: 17, fontWeight: FontWeight.w500),),
                    ],
                  ),
                  Row(
                    children: const [
                      SizedBox(width: 50, height: 40,),
                      Text("Address :", style: TextStyle(color: Colors.white, fontSize: 17,),),
                      SizedBox(width: 20,),
                      Text("Ibrahim Town", style: TextStyle(color: Colors.white, fontSize: 17, fontWeight: FontWeight.w500),),
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
                  onPressed: (){},
                  color: Colors.redAccent,
                  child: const Text("Delete", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                ),
                MaterialButton(
                  onPressed: (){},
                  color: buttonColor,
                  child: const Text("Update", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                ),
              ],
            )

          ],
        ),
      ),
    );
  }
}
