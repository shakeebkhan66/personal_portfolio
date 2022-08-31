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
        child: ListView(
          children: [
            CircleAvatar(
              radius: 60,
                backgroundImage: NetworkImage(""),)
          ],
        ),
      ),
    );
  }
}
