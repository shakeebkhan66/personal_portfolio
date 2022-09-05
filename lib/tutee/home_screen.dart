import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:personal_portfolio/tuteeallpages/tutee_chatroom_screen.dart';
import 'package:personal_portfolio/tuteeallpages/tutee_home_screen.dart';
import 'package:personal_portfolio/tuteeallpages/tutee_setting_screen.dart';
import 'package:personal_portfolio/widgets/mywidets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  List pages = [
    const TuteeHomeScreen(),
    const TuteeChatRoomScreen(),
    const TuteeSettingScreen(),
    const TuteeChatRoomScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: pages[_selectedIndex],

      // TODO Bottom Google NavBar
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30.0),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 13.0, vertical: 5.0),
          child: GNav(
            backgroundColor: Colors.white,
            color: Colors.deepPurple.shade400,
            activeColor: Colors.deepPurple.shade400,
            tabBackgroundColor: Colors.deepPurple.shade100,
            gap: 8.0,
            padding: const EdgeInsets.all(14),
            selectedIndex: _selectedIndex,
            onTabChange: (index) {
              setState(() {
                _selectedIndex = index;
              });
            },
            tabs: const [
              GButton(text: 'Home', icon: Icons.home),
              GButton(text: 'Message', icon: Icons.message_rounded),
              GButton(text: 'Settings', icon: Icons.settings),
              GButton(text: 'Search', icon: Icons.search_sharp),
            ],
          ),
        ),
      ),
    );
  }
}
