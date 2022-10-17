import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:personal_portfolio/tutee/tutor_profile_screen.dart';
import 'package:progress_indicators/progress_indicators.dart';

import '../../widgets/mywidets.dart';

class StatisticsTutors extends StatefulWidget {
  const StatisticsTutors({Key? key}) : super(key: key);

  @override
  State<StatisticsTutors> createState() => _StatisticsTutorsState();
}

class _StatisticsTutorsState extends State<StatisticsTutors> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: buttonColor,
        title: const Text(
          "Stats Professors",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
        ),
      ),
      // body: SafeArea(
      //   child: ListView(
      //     physics: const BouncingScrollPhysics(),
      //     children: [
      //       const SizedBox(
      //         height: 15.0,
      //       ),
      //       GestureDetector(
      //         onTap: () {
      //           Navigator.push(context,
      //               MaterialPageRoute(builder: (ctx) => TutorProfileScreen()));
      //         },
      //         child: Container(
      //           margin: const EdgeInsets.symmetric(horizontal: 7.0),
      //           width: MediaQuery.of(context).size.width,
      //           height: 80,
      //           decoration: BoxDecoration(
      //               color: Colors.deepPurple.shade400,
      //               borderRadius: BorderRadius.circular(9.0),
      //               boxShadow: const [
      //                 BoxShadow(
      //                     color: Colors.white60,
      //                     offset: Offset(0.1, 0.2),
      //                     blurRadius: 4,
      //                     spreadRadius: 0.2)
      //               ]),
      //           child: const ListTile(
      //             title: Text(
      //               "Shakeeb Ahmed Khan",
      //               style: TextStyle(
      //                   color: Colors.white,
      //                   fontSize: 17,
      //                   fontWeight: FontWeight.bold),
      //             ),
      //             subtitle: Text(
      //               "Computer",
      //               style: TextStyle(color: Colors.white70, fontSize: 15),
      //             ),
      //             trailing: Text(
      //               "Rs400 / HR",
      //               style: TextStyle(
      //                   color: Colors.white,
      //                   fontSize: 17,
      //                   fontWeight: FontWeight.bold),
      //             ),
      //           ),
      //         ),
      //       ),
      //       const SizedBox(
      //         height: 8.0,
      //       ),
      //       Container(
      //         margin: const EdgeInsets.symmetric(horizontal: 7.0),
      //         width: MediaQuery.of(context).size.width,
      //         height: 80,
      //         decoration: BoxDecoration(
      //             color: Colors.deepPurple.shade400,
      //             borderRadius: BorderRadius.circular(9.0),
      //             boxShadow: const [
      //               BoxShadow(
      //                   color: Colors.white60,
      //                   offset: Offset(0.1, 0.2),
      //                   blurRadius: 4,
      //                   spreadRadius: 0.2)
      //             ]),
      //         child: const ListTile(
      //           title: Text(
      //             "Ameer Sadiq",
      //             style: TextStyle(
      //                 color: Colors.white,
      //                 fontSize: 17,
      //                 fontWeight: FontWeight.bold),
      //           ),
      //           subtitle: Text(
      //             "Mathematics",
      //             style: TextStyle(color: Colors.white70, fontSize: 15),
      //           ),
      //           trailing: Text(
      //             "Rs500 / HR",
      //             style: TextStyle(
      //                 color: Colors.white,
      //                 fontSize: 17,
      //                 fontWeight: FontWeight.bold),
      //           ),
      //         ),
      //       ),
      //       const SizedBox(
      //         height: 8.0,
      //       ),
      //       Container(
      //         margin: const EdgeInsets.symmetric(horizontal: 7.0),
      //         width: MediaQuery.of(context).size.width,
      //         height: 80,
      //         decoration: BoxDecoration(
      //             color: Colors.deepPurple.shade400,
      //             borderRadius: BorderRadius.circular(9.0),
      //             boxShadow: const [
      //               BoxShadow(
      //                   color: Colors.white60,
      //                   offset: Offset(0.1, 0.2),
      //                   blurRadius: 4,
      //                   spreadRadius: 0.2)
      //             ]),
      //         child: const ListTile(
      //           title: Text(
      //             "Flutter Developer",
      //             style: TextStyle(
      //                 color: Colors.white,
      //                 fontSize: 17,
      //                 fontWeight: FontWeight.bold),
      //           ),
      //           subtitle: Text(
      //             "Computer",
      //             style: TextStyle(color: Colors.white70, fontSize: 15),
      //           ),
      //           trailing: Text(
      //             "Rs1000 / HR",
      //             style: TextStyle(
      //                 color: Colors.white,
      //                 fontSize: 17,
      //                 fontWeight: FontWeight.bold),
      //           ),
      //         ),
      //       ),
      //       const SizedBox(
      //         height: 8.0,
      //       ),
      //       Container(
      //         margin: const EdgeInsets.symmetric(horizontal: 7.0),
      //         width: MediaQuery.of(context).size.width,
      //         height: 80,
      //         decoration: BoxDecoration(
      //             color: Colors.deepPurple.shade400,
      //             borderRadius: BorderRadius.circular(9.0),
      //             boxShadow: const [
      //               BoxShadow(
      //                   color: Colors.white60,
      //                   offset: Offset(0.1, 0.2),
      //                   blurRadius: 4,
      //                   spreadRadius: 0.2)
      //             ]),
      //         child: const ListTile(
      //           title: Text(
      //             "Zain Jalil Khan",
      //             style: TextStyle(
      //                 color: Colors.white,
      //                 fontSize: 17,
      //                 fontWeight: FontWeight.bold),
      //           ),
      //           subtitle: Text(
      //             "Biology",
      //             style: TextStyle(color: Colors.white70, fontSize: 15),
      //           ),
      //           trailing: Text(
      //             "Rs800 / HR",
      //             style: TextStyle(
      //                 color: Colors.white,
      //                 fontSize: 17,
      //                 fontWeight: FontWeight.bold),
      //           ),
      //         ),
      //       ),
      //       const SizedBox(
      //         height: 8.0,
      //       ),
      //       Container(
      //         margin: const EdgeInsets.symmetric(horizontal: 7.0),
      //         width: MediaQuery.of(context).size.width,
      //         height: 80,
      //         decoration: BoxDecoration(
      //             color: Colors.deepPurple.shade400,
      //             borderRadius: BorderRadius.circular(9.0),
      //             boxShadow: const [
      //               BoxShadow(
      //                   color: Colors.white60,
      //                   offset: Offset(0.1, 0.2),
      //                   blurRadius: 4,
      //                   spreadRadius: 0.2)
      //             ]),
      //         child: const ListTile(
      //           title: Text(
      //             "Omer Malik",
      //             style: TextStyle(
      //                 color: Colors.white,
      //                 fontSize: 17,
      //                 fontWeight: FontWeight.bold),
      //           ),
      //           subtitle: Text(
      //             "Python",
      //             style: TextStyle(color: Colors.white70, fontSize: 15),
      //           ),
      //           trailing: Text(
      //             "Rs1500 / HR",
      //             style: TextStyle(
      //                 color: Colors.white,
      //                 fontSize: 17,
      //                 fontWeight: FontWeight.bold),
      //           ),
      //         ),
      //       ),
      //       const SizedBox(
      //         height: 8.0,
      //       ),
      //       Container(
      //         margin: const EdgeInsets.symmetric(horizontal: 7.0),
      //         width: MediaQuery.of(context).size.width,
      //         height: 80,
      //         decoration: BoxDecoration(
      //             color: Colors.deepPurple.shade400,
      //             borderRadius: BorderRadius.circular(9.0),
      //             boxShadow: const [
      //               BoxShadow(
      //                   color: Colors.white60,
      //                   offset: Offset(0.1, 0.2),
      //                   blurRadius: 4,
      //                   spreadRadius: 0.2)
      //             ]),
      //         child: const ListTile(
      //           title: Text(
      //             "Ijaz",
      //             style: TextStyle(
      //                 color: Colors.white,
      //                 fontSize: 17,
      //                 fontWeight: FontWeight.bold),
      //           ),
      //           subtitle: Text(
      //             "Chemistry",
      //             style: TextStyle(color: Colors.white70, fontSize: 15),
      //           ),
      //           trailing: Text(
      //             "Rs600 / HR",
      //             style: TextStyle(
      //                 color: Colors.white,
      //                 fontSize: 17,
      //                 fontWeight: FontWeight.bold),
      //           ),
      //         ),
      //       ),
      //       const SizedBox(
      //         height: 8.0,
      //       ),
      //       Container(
      //         margin: const EdgeInsets.symmetric(horizontal: 7.0),
      //         width: MediaQuery.of(context).size.width,
      //         height: 80,
      //         decoration: BoxDecoration(
      //             color: Colors.deepPurple.shade400,
      //             borderRadius: BorderRadius.circular(9.0),
      //             boxShadow: const [
      //               BoxShadow(
      //                   color: Colors.white60,
      //                   offset: Offset(0.1, 0.2),
      //                   blurRadius: 4,
      //                   spreadRadius: 0.2)
      //             ]),
      //         child: const ListTile(
      //           title: Text(
      //             "Hina Naz",
      //             style: TextStyle(
      //                 color: Colors.white,
      //                 fontSize: 17,
      //                 fontWeight: FontWeight.bold),
      //           ),
      //           subtitle: Text(
      //             "Statistics",
      //             style: TextStyle(color: Colors.white70, fontSize: 15),
      //           ),
      //           trailing: Text(
      //             "Rs1500 / HR",
      //             style: TextStyle(
      //                 color: Colors.white,
      //                 fontSize: 17,
      //                 fontWeight: FontWeight.bold),
      //           ),
      //         ),
      //       ),
      //       const SizedBox(
      //         height: 8.0,
      //       ),
      //       Container(
      //         margin: const EdgeInsets.symmetric(horizontal: 7.0),
      //         width: MediaQuery.of(context).size.width,
      //         height: 80,
      //         decoration: BoxDecoration(
      //             color: Colors.deepPurple.shade400,
      //             borderRadius: BorderRadius.circular(9.0),
      //             boxShadow: const [
      //               BoxShadow(
      //                   color: Colors.white60,
      //                   offset: Offset(0.1, 0.2),
      //                   blurRadius: 4,
      //                   spreadRadius: 0.2)
      //             ]),
      //         child: const ListTile(
      //           title: Text(
      //             "Ahmer Malik",
      //             style: TextStyle(
      //                 color: Colors.white,
      //                 fontSize: 17,
      //                 fontWeight: FontWeight.bold),
      //           ),
      //           subtitle: Text(
      //             "Graphic Designing",
      //             style: TextStyle(color: Colors.white70, fontSize: 15),
      //           ),
      //           trailing: Text(
      //             "Rs1500 / HR",
      //             style: TextStyle(
      //                 color: Colors.white,
      //                 fontSize: 17,
      //                 fontWeight: FontWeight.bold),
      //           ),
      //         ),
      //       ),
      //       const SizedBox(
      //         height: 8.0,
      //       ),
      //       Container(
      //         margin: const EdgeInsets.symmetric(horizontal: 7.0),
      //         width: MediaQuery.of(context).size.width,
      //         height: 80,
      //         decoration: BoxDecoration(
      //             color: Colors.deepPurple.shade400,
      //             borderRadius: BorderRadius.circular(9.0),
      //             boxShadow: const [
      //               BoxShadow(
      //                   color: Colors.white60,
      //                   offset: Offset(0.1, 0.2),
      //                   blurRadius: 4,
      //                   spreadRadius: 0.2)
      //             ]),
      //         child: const ListTile(
      //           title: Text(
      //             "Ijaz",
      //             style: TextStyle(
      //                 color: Colors.white,
      //                 fontSize: 17,
      //                 fontWeight: FontWeight.bold),
      //           ),
      //           subtitle: Text(
      //             "Chemistry",
      //             style: TextStyle(color: Colors.white70, fontSize: 15),
      //           ),
      //           trailing: Text(
      //             "Rs600 / HR",
      //             style: TextStyle(
      //                 color: Colors.white,
      //                 fontSize: 17,
      //                 fontWeight: FontWeight.bold),
      //           ),
      //         ),
      //       ),
      //       const SizedBox(
      //         height: 8.0,
      //       ),
      //       Container(
      //         margin: const EdgeInsets.symmetric(horizontal: 7.0),
      //         width: MediaQuery.of(context).size.width,
      //         height: 80,
      //         decoration: BoxDecoration(
      //             color: Colors.deepPurple.shade400,
      //             borderRadius: BorderRadius.circular(9.0),
      //             boxShadow: const [
      //               BoxShadow(
      //                   color: Colors.white60,
      //                   offset: Offset(0.1, 0.2),
      //                   blurRadius: 4,
      //                   spreadRadius: 0.2)
      //             ]),
      //         child: const ListTile(
      //           title: Text(
      //             "Hina Naz",
      //             style: TextStyle(
      //                 color: Colors.white,
      //                 fontSize: 17,
      //                 fontWeight: FontWeight.bold),
      //           ),
      //           subtitle: Text(
      //             "Statistics",
      //             style: TextStyle(color: Colors.white70, fontSize: 15),
      //           ),
      //           trailing: Text(
      //             "Rs1500 / HR",
      //             style: TextStyle(
      //                 color: Colors.white,
      //                 fontSize: 17,
      //                 fontWeight: FontWeight.bold),
      //           ),
      //         ),
      //       ),
      //     ],
      //   ),
      // ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 10),
          child: StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection('tutor&tutte')
                .where('selectedSubject', isEqualTo: "Statistics")
                .snapshots(),
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (!snapshot.hasData) {
                return Center(
                    child: JumpingDotsProgressIndicator(
                        numberOfDots: 4, fontSize: 30, color: Colors.white));
              } else if (snapshot.hasData && snapshot.data?.size == 0) {
                return Center(
                    child: JumpingText(
                  'No Data Found...',
                  style: const TextStyle(
                      fontSize: 25,
                      color: Colors.white70,
                      fontWeight: FontWeight.bold),
                ));
              }
              return ListView.separated(
                physics: const BouncingScrollPhysics(),
                itemCount: snapshot.data!.docs.length,
                separatorBuilder: (_, index) {
                  return const Divider();
                },
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (ctx) =>
                                      const TutorProfileScreen()));
                        },
                        child: Container(
                          margin: const EdgeInsets.symmetric(horizontal: 7.0),
                          width: MediaQuery.of(context).size.width,
                          height: 80,
                          decoration: BoxDecoration(
                              color: Colors.deepPurple.shade400,
                              borderRadius: BorderRadius.circular(9.0),
                              boxShadow: const [
                                BoxShadow(
                                    color: Colors.white60,
                                    offset: Offset(0.1, 0.2),
                                    blurRadius: 4,
                                    spreadRadius: 0.2)
                              ]),
                          child: ListTile(
                            title: Text(
                              snapshot.data?.docs[index]['firstName'],
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold),
                            ),
                            subtitle: Text(
                              snapshot.data?.docs[index]['selectedSubject'],
                              style: const TextStyle(
                                  color: Colors.white70, fontSize: 15),
                            ),
                            trailing: Text(
                              snapshot.data?.docs[index]['chargeHour'],
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
