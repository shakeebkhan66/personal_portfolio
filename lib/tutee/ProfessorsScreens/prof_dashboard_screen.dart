import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:page_transition/page_transition.dart';

import '../../widgets/mywidets.dart';
import '../home_screen.dart';
import '../my_drawer.dart';
import '../tutor_profile_screen.dart';

class ProfDashboardScreen extends StatefulWidget {
  const ProfDashboardScreen({Key? key}) : super(key: key);

  @override
  State<ProfDashboardScreen> createState() => _ProfDashboardScreenState();
}

class _ProfDashboardScreenState extends State<ProfDashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: backgroundColor,
        elevation: 0.1,
        title: const Center(
          child: Text(
            "T U T O R",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: Container(
              width: 45,
              // margin: EdgeInsets.only(right: 14.0),
              decoration: BoxDecoration(
                  color: Colors.deepPurple.shade400,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: const [
                    BoxShadow(
                        color: Colors.white30,
                        offset: Offset(0.1, 0.2),
                        blurRadius: 13,
                        spreadRadius: 1.0)
                  ]),
              child: const Icon(
                Icons.search_sharp,
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
      body: SafeArea(
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            const SizedBox(
              height: 20,
            ),
            Container(
              padding: const EdgeInsets.only(left: 7.0),
              child: const Text(
                "S T U D E N T S  L I S T",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w900,
                    fontSize: 20),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            // TODO TOP RATED TUTORS
            const StudentsList(),
          ],
        ),
      ),

      // TODO MyDrawer
      drawer: const MyDrawer(),

      // TODO Bottom Google NavBar
      bottomNavigationBar: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
          child: GNav(
            backgroundColor: Colors.white,
            color: Colors.deepPurple.shade400,
            activeColor: Colors.deepPurple.shade400,
            tabBackgroundColor: Colors.deepPurple.shade100,
            gap: 8.0,
            padding: const EdgeInsets.all(15),
            tabs: const [
              GButton(
                  text: 'Home',
                  icon: Icons.home
              ),
              GButton(
                  text: 'Message',
                  icon: Icons.message_rounded
              ),
              GButton(
                  text: 'Settings',
                  icon: Icons.settings
              ),
              GButton(
                  text: 'Search',
                  icon: Icons.search_sharp
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// TODO TOP RATED TUTORS
class StudentsList extends StatefulWidget {
  const StudentsList({Key? key}) : super(key: key);

  @override
  State<StudentsList> createState() => _StudentsListState();
}

class _StudentsListState extends State<StudentsList> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 15.0,),
        GestureDetector(
          onTap: (){
            Navigator.push(
              context,
              PageTransition(
                  type: PageTransitionType.leftToRight,
                  alignment: Alignment.center,
                  duration: const Duration(milliseconds: 500),
                  child: const TutorProfileScreen(),
                  inheritTheme: true,
                  ctx: context),
            );
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
                      spreadRadius: 0.2
                  )
                ]
            ),
            child: const ListTile(
              title: Text(
                "Shakeeb Ahmed Khan",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                    fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                "Computer",
                style: TextStyle(
                    color: Colors.white70,
                    fontSize: 15),
              ),
              trailing: Text(
                "Rs400 / HR",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                    fontWeight: FontWeight.bold
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 8.0,),
        Container(
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
                    spreadRadius: 0.2
                )
              ]
          ),
          child: const ListTile(
            title: Text(
              "Ameer Sadiq",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 17,
                  fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
              "Mathematics",
              style: TextStyle(
                  color: Colors.white70,
                  fontSize: 15),
            ),
            trailing: Text(
              "Rs500 / HR",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 17,
                  fontWeight: FontWeight.bold
              ),
            ),
          ),
        ),
        const SizedBox(height: 8.0,),
        Container(
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
                    spreadRadius: 0.2
                )
              ]
          ),
          child: const ListTile(
            title: Text(
              "Flutter Developer",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 17,
                  fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
              "Computer",
              style: TextStyle(
                  color: Colors.white70,
                  fontSize: 15),
            ),
            trailing: Text(
              "Rs1000 / HR",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 17,
                  fontWeight: FontWeight.bold
              ),
            ),
          ),
        ),
        const SizedBox(height: 8.0,),
        Container(
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
                    spreadRadius: 0.2
                )
              ]
          ),
          child: const ListTile(
            title: Text(
              "Zain Jalil Khan",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 17,
                  fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
              "Biology",
              style: TextStyle(
                  color: Colors.white70,
                  fontSize: 15),
            ),
            trailing: Text(
              "Rs800 / HR",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 17,
                  fontWeight: FontWeight.bold
              ),
            ),
          ),
        ),
        const SizedBox(height: 8.0,),
        Container(
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
                    spreadRadius: 0.2
                )
              ]
          ),
          child: const ListTile(
            title: Text(
              "Omer Malik",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 17,
                  fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
              "Python",
              style: TextStyle(
                  color: Colors.white70,
                  fontSize: 15),
            ),
            trailing: Text(
              "Rs1500 / HR",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 17,
                  fontWeight: FontWeight.bold
              ),
            ),
          ),
        ),
        const SizedBox(height: 8.0,),
        Container(
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
                    spreadRadius: 0.2
                )
              ]
          ),
          child: const ListTile(
            title: Text(
              "Ijaz",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 17,
                  fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
              "Chemistry",
              style: TextStyle(
                  color: Colors.white70,
                  fontSize: 15),
            ),
            trailing: Text(
              "Rs600 / HR",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 17,
                  fontWeight: FontWeight.bold
              ),
            ),
          ),
        ),
        const SizedBox(height: 8.0,),
        Container(
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
                    spreadRadius: 0.2
                )
              ]
          ),
          child: const ListTile(
            title: Text(
              "Hina Naz",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 17,
                  fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
              "Statistics",
              style: TextStyle(
                  color: Colors.white70,
                  fontSize: 15),
            ),
            trailing: Text(
              "Rs1500 / HR",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 17,
                  fontWeight: FontWeight.bold
              ),
            ),
          ),
        ),
        const SizedBox(height: 8.0,),
        Container(
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
                    spreadRadius: 0.2
                )
              ]
          ),
          child: const ListTile(
            title: Text(
              "Ahmer Malik",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 17,
                  fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
              "Graphic Designing",
              style: TextStyle(
                  color: Colors.white70,
                  fontSize: 15),
            ),
            trailing: Text(
              "Rs1500 / HR",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 17,
                  fontWeight: FontWeight.bold
              ),
            ),
          ),
        )
      ],
    );
  }
}
