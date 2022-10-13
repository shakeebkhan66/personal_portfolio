
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../widgets/mywidets.dart';

class TutorProfileScreen extends StatefulWidget {
  const TutorProfileScreen({Key? key}) : super(key: key);

  @override
  State<TutorProfileScreen> createState() => _TutorProfileScreenState();
}

class _TutorProfileScreenState extends State<TutorProfileScreen> {
  
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(
              height: 25,
            ),
            Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 120),
                  child: CircleAvatar(
                    radius: 70,
                    child: ClipOval(
                        child: Image.network(
                      "https://avatars.githubusercontent.com/u/73787635?v=4",
                    )),
                  ),
                ),
                Positioned(
                  bottom: -0.1,
                  left: 200,
                  child: Container(
                    height: 40,
                    width: 40,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: Colors.deepPurple.shade400,
                        borderRadius: BorderRadius.circular(30)),
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.edit,
                        color: Colors.white,
                      ),
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "Shakeeb Ahmed Khan",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w900,
                  fontSize: 20),
            ),
            const SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  child: Column(
                    children: const [
                      Text(
                        "4.5",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      ),
                      SizedBox(
                        height: 8.0,
                      ),
                      Icon(
                        Icons.heart_broken,
                        color: Colors.white,
                      )
                    ],
                  ),
                ),
                Container(
                  child: Column(
                    children: const [
                      Text(
                        "400",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      ),
                      SizedBox(
                        height: 8.0,
                      ),
                      Icon(
                        Icons.attach_money,
                        color: Colors.white,
                      )
                    ],
                  ),
                ),
                Container(
                  child: Column(
                    children: const [
                      Text(
                        "21",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      ),
                      SizedBox(
                        height: 8.0,
                      ),
                      Icon(
                        Icons.person,
                        color: Colors.white,
                      )
                    ],
                  ),
                )
              ],
            ),
            const SizedBox(height: 30),
            const Divider(
              color: Colors.white54,
              thickness: 0.3,
            ),
            const SizedBox(height: 20),
            const ListTile(
              title: Text(
                "BIO",
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.w700),
              ),
              subtitle: Text(
                "Computer Professor, working as a lecturer in renowned university",
                maxLines: 6,
                style: TextStyle(color: Colors.white70, ),
              ),
            ),
            const SizedBox(
              height: 100,
            ),
            Row(
              children: [
                Expanded(
                  flex: 3,
                  child: Container(
                    margin: const EdgeInsets.only(left: 10.0),
                    decoration: BoxDecoration(
                        color: Colors.deepPurple.shade400,
                        borderRadius: BorderRadius.circular(4.0),
                        boxShadow: const [
                          BoxShadow(
                              color: Colors.white38,
                              offset: Offset(0.1, 0.2),
                              blurRadius: 5,
                              spreadRadius: 0.1)
                        ]),
                    child: const ListTile(
                      title: Text(
                        "T e x t",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      leading: Icon(
                        Icons.message_sharp,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 5.0,
                ),
                Expanded(
                  flex: 3,
                  child: Container(
                    margin: const EdgeInsets.only(right: 10.0),
                    decoration: BoxDecoration(
                        color: Colors.deepPurple.shade400,
                        borderRadius: BorderRadius.circular(4.0),
                        boxShadow: const [
                          BoxShadow(
                              color: Colors.white38,
                              offset: Offset(0.1, 0.2),
                              blurRadius: 5,
                              spreadRadius: 0.1)
                        ]),
                    child: const ListTile(
                      title: Text(
                        "H i r e",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      leading: Icon(
                        Icons.design_services,
                        color: Colors.white,
                      ),
                    ),
                  ),
                )
              ],
            )

          ],
        ),
      ),
    );
  }
}
