import 'package:flutter/material.dart';

import '../widgets/mywidets.dart';

class TuteeSettingScreen extends StatefulWidget {
  const TuteeSettingScreen({Key? key}) : super(key: key);

  @override
  State<TuteeSettingScreen> createState() => _TuteeSettingScreenState();
}

class _TuteeSettingScreenState extends State<TuteeSettingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: const Center(
        child: Text("Setting Screen", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),),
      ),
    );
  }
}
