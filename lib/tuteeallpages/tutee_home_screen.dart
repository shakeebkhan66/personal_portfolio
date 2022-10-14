 import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:personal_portfolio/providers/authentication_provider_class.dart';
import 'package:provider/provider.dart';
import '../tutee/Professors/accounting_professors.dart';
import '../tutee/Professors/biology_professors_screen.dart';
import '../tutee/Professors/chemistry_professors_screen.dart';
import '../tutee/Professors/computer_professors_screen.dart';
import '../tutee/Professors/english_professors.dart';
import '../tutee/Professors/flutter_professors_screen.dart';
import '../tutee/Professors/graphic_design_prof_screen.dart';
import '../tutee/Professors/maths_professors_screen.dart';
import '../tutee/Professors/physics_professors_screen.dart';
import '../tutee/Professors/python_professors_screen.dart';
import '../tutee/Professors/stats_professors.dart';
import '../tutee/my_drawer.dart';
import '../tutee/tutor_profile_screen.dart';
import '../widgets/mywidets.dart';
import '../SharedPref/shared_preference_class.dart';

class TuteeHomeScreen extends StatefulWidget {
  const TuteeHomeScreen({Key? key}) : super(key: key);

  @override
  State<TuteeHomeScreen> createState() => _TuteeHomeScreenState();
}

class _TuteeHomeScreenState extends State<TuteeHomeScreen> {
  int _selectedIndex = 0;
  bool Loading = false;

  @override
  Widget build(BuildContext context) {
    final myProvider = Provider.of<SignInAuthenticationProvider>(context);
    return WillPopScope(
      onWillPop: () async{
        return false;
      },
      child: Scaffold(
        backgroundColor: backgroundColor,
        appBar: AppBar(
          backgroundColor: backgroundColor,
          elevation: 0.1,
          title: const Center(
            child: Text(
              "T U T E E",
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: Loading == false ? InkWell(
                onTap: () {
                  myProvider.signOut(context);
                  SharedPreferenceClass.preferences!.setBool("loggedIn", false);
                  setState(() {
                    Loading = true;
                  });
                },
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
                    Icons.logout,
                    color: Colors.white,
                  ),
                ),
              ) : const Center(child: CircularProgressIndicator(color: Colors.white,),)
            )
          ],
        ),
        body: SafeArea(
          child: ListView(
            physics: const BouncingScrollPhysics(),
            children: [
              const SizedBox(
                height: 28,
              ),
              const SubjectsTab(),
              const SizedBox(
                height: 35,
              ),
              Container(
                padding: const EdgeInsets.only(left: 7.0),
                child: const Text(
                  "T O P  R A T E D  T U T O R S",
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
              const TopRatedTutors(),
            ],
          ),
        ),

        // TODO MyDrawer
        drawer: const MyDrawer(),
      ),
    );
  }
}

// TODO SUBJECTS SELECTED ROW TABS
class SubjectsTab extends StatefulWidget {
  const SubjectsTab({Key? key}) : super(key: key);

  @override
  State<SubjectsTab> createState() => _SubjectsTabState();
}

class _SubjectsTabState extends State<SubjectsTab> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 5.0),
        child: Row(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  PageTransition(
                      type: PageTransitionType.leftToRight,
                      alignment: Alignment.center,
                      duration: const Duration(milliseconds: 500),
                      child: const ComputerTutors(),
                      inheritTheme: true,
                      ctx: context),
                );
              },
              child: Container(
                width: 90,
                height: 45,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Colors.deepPurple.shade400,
                    borderRadius: BorderRadius.circular(8.0),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.white38,
                        offset: Offset(0.1, 0),
                        blurRadius: 5,
                      )
                    ]),
                child: const Text(
                  "Computer",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w500),
                ),
              ),
            ),
            const SizedBox(
              width: 8.0,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  PageTransition(
                      type: PageTransitionType.leftToRight,
                      alignment: Alignment.center,
                      duration: const Duration(milliseconds: 500),
                      child: const MathsTutors(),
                      inheritTheme: true,
                      ctx: context),
                );
              },
              child: Container(
                width: 90,
                height: 45,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Colors.deepPurple.shade400,
                    borderRadius: BorderRadius.circular(8.0),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.white38,
                        offset: Offset(0.1, 0),
                        blurRadius: 5,
                      )
                    ]),
                child: const Text(
                  "Mathematics",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w500),
                ),
              ),
            ),
            const SizedBox(
              width: 8.0,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  PageTransition(
                      type: PageTransitionType.leftToRight,
                      alignment: Alignment.center,
                      duration: const Duration(milliseconds: 500),
                      child: const PhysicsTutors(),
                      inheritTheme: true,
                      ctx: context),
                );
              },
              child: Container(
                width: 90,
                height: 45,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Colors.deepPurple.shade400,
                    borderRadius: BorderRadius.circular(8.0),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.white38,
                        offset: Offset(0.1, 0),
                        blurRadius: 5,
                      )
                    ]),
                child: const Text(
                  "Physics",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w500),
                ),
              ),
            ),
            const SizedBox(
              width: 8.0,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  PageTransition(
                      type: PageTransitionType.leftToRight,
                      alignment: Alignment.center,
                      duration: const Duration(milliseconds: 500),
                      child: const ChemistryTutors(),
                      inheritTheme: true,
                      ctx: context),
                );
              },
              child: Container(
                width: 90,
                height: 45,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Colors.deepPurple.shade400,
                    borderRadius: BorderRadius.circular(8.0),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.white38,
                        offset: Offset(0.1, 0),
                        blurRadius: 5,
                      )
                    ]),
                child: const Text(
                  "Chemistry",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w500),
                ),
              ),
            ),
            const SizedBox(
              width: 8.0,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  PageTransition(
                      type: PageTransitionType.leftToRight,
                      alignment: Alignment.center,
                      duration: const Duration(milliseconds: 500),
                      child: const BiologyTutors(),
                      inheritTheme: true,
                      ctx: context),
                );
              },
              child: Container(
                width: 90,
                height: 45,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Colors.deepPurple.shade400,
                    borderRadius: BorderRadius.circular(8.0),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.white38,
                        offset: Offset(0.1, 0),
                        blurRadius: 5,
                      )
                    ]),
                child: const Text(
                  "Biology",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w500),
                ),
              ),
            ),
            const SizedBox(
              width: 8.0,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  PageTransition(
                      type: PageTransitionType.leftToRight,
                      alignment: Alignment.center,
                      duration: const Duration(milliseconds: 500),
                      child: const EnglishTutors(),
                      inheritTheme: true,
                      ctx: context),
                );
              },
              child: Container(
                width: 90,
                height: 45,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Colors.deepPurple.shade400,
                    borderRadius: BorderRadius.circular(8.0),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.white38,
                        offset: Offset(0.1, 0),
                        blurRadius: 5,
                      )
                    ]),
                child: const Text(
                  "English",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w500),
                ),
              ),
            ),
            const SizedBox(
              width: 8.0,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  PageTransition(
                      type: PageTransitionType.leftToRight,
                      alignment: Alignment.center,
                      duration: const Duration(milliseconds: 500),
                      child: const StatisticsTutors(),
                      inheritTheme: true,
                      ctx: context),
                );
              },
              child: Container(
                width: 90,
                height: 45,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Colors.deepPurple.shade400,
                    borderRadius: BorderRadius.circular(8.0),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.white38,
                        offset: Offset(0.1, 0),
                        blurRadius: 5,
                      )
                    ]),
                child: const Text(
                  "Statistics",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w500),
                ),
              ),
            ),
            const SizedBox(
              width: 8.0,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  PageTransition(
                      type: PageTransitionType.leftToRight,
                      alignment: Alignment.center,
                      duration: const Duration(milliseconds: 500),
                      child: const AccountingTutors(),
                      inheritTheme: true,
                      ctx: context),
                );
              },
              child: Container(
                width: 90,
                height: 45,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Colors.deepPurple.shade400,
                    borderRadius: BorderRadius.circular(8.0),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.white38,
                        offset: Offset(0.1, 0),
                        blurRadius: 5,
                      )
                    ]),
                child: const Text(
                  "Accounting",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w500),
                ),
              ),
            ),
            const SizedBox(
              width: 8.0,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  PageTransition(
                      type: PageTransitionType.leftToRight,
                      alignment: Alignment.center,
                      duration: const Duration(milliseconds: 500),
                      child: const GraphicDesigningTutors(),
                      inheritTheme: true,
                      ctx: context),
                );
              },
              child: Container(
                width: 90,
                height: 45,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Colors.deepPurple.shade400,
                    borderRadius: BorderRadius.circular(8.0),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.white38,
                        offset: Offset(0.1, 0),
                        blurRadius: 5,
                      )
                    ]),
                child: const Text(
                  "Graphic Designing",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w500),
                ),
              ),
            ),
            const SizedBox(
              width: 8.0,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  PageTransition(
                      type: PageTransitionType.leftToRight,
                      alignment: Alignment.center,
                      duration: const Duration(milliseconds: 500),
                      child: const FlutterTutors(),
                      inheritTheme: true,
                      ctx: context),
                );
              },
              child: Container(
                width: 90,
                height: 45,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Colors.deepPurple.shade400,
                    borderRadius: BorderRadius.circular(8.0),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.white38,
                        offset: Offset(0.1, 0),
                        blurRadius: 5,
                      )
                    ]),
                child: const Text(
                  "Flutter Development",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w500),
                ),
              ),
            ),
            const SizedBox(
              width: 8.0,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  PageTransition(
                      type: PageTransitionType.leftToRight,
                      alignment: Alignment.center,
                      duration: const Duration(milliseconds: 500),
                      child: const PythonTutors(),
                      inheritTheme: true,
                      ctx: context),
                );
              },
              child: Container(
                width: 90,
                height: 45,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Colors.deepPurple.shade400,
                    borderRadius: BorderRadius.circular(8.0),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.white38,
                        offset: Offset(0.1, 0),
                        blurRadius: 5,
                      )
                    ]),
                child: const Text(
                  "Python",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w500),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// TODO TOP RATED TUTORS
class TopRatedTutors extends StatefulWidget {
  const TopRatedTutors({Key? key}) : super(key: key);

  @override
  State<TopRatedTutors> createState() => _TopRatedTutorsState();
}

class _TopRatedTutorsState extends State<TopRatedTutors> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 15.0,
        ),
        GestureDetector(
          onTap: () {
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
                      spreadRadius: 0.2)
                ]),
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
                style: TextStyle(color: Colors.white70, fontSize: 15),
              ),
              trailing: Text(
                "Rs400 / HR",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 8.0,
        ),
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
                    spreadRadius: 0.2)
              ]),
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
              style: TextStyle(color: Colors.white70, fontSize: 15),
            ),
            trailing: Text(
              "Rs500 / HR",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 17,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
        const SizedBox(
          height: 8.0,
        ),
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
                    spreadRadius: 0.2)
              ]),
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
              style: TextStyle(color: Colors.white70, fontSize: 15),
            ),
            trailing: Text(
              "Rs1000 / HR",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 17,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
        const SizedBox(
          height: 8.0,
        ),
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
                    spreadRadius: 0.2)
              ]),
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
              style: TextStyle(color: Colors.white70, fontSize: 15),
            ),
            trailing: Text(
              "Rs800 / HR",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 17,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
        const SizedBox(
          height: 8.0,
        ),
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
                    spreadRadius: 0.2)
              ]),
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
              style: TextStyle(color: Colors.white70, fontSize: 15),
            ),
            trailing: Text(
              "Rs1500 / HR",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 17,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
        const SizedBox(
          height: 8.0,
        ),
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
                    spreadRadius: 0.2)
              ]),
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
              style: TextStyle(color: Colors.white70, fontSize: 15),
            ),
            trailing: Text(
              "Rs600 / HR",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 17,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
        const SizedBox(
          height: 8.0,
        ),
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
                    spreadRadius: 0.2)
              ]),
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
              style: TextStyle(color: Colors.white70, fontSize: 15),
            ),
            trailing: Text(
              "Rs1500 / HR",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 17,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
        const SizedBox(
          height: 8.0,
        ),
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
                    spreadRadius: 0.2)
              ]),
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
              style: TextStyle(color: Colors.white70, fontSize: 15),
            ),
            trailing: Text(
              "Rs1500 / HR",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 17,
                  fontWeight: FontWeight.bold),
            ),
          ),
        )
      ],
    );
  }
}
