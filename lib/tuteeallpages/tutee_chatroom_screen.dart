import 'package:flutter/material.dart';
import 'package:personal_portfolio/widgets/mywidets.dart';

class TuteeChatRoomScreen extends StatefulWidget {
  const TuteeChatRoomScreen({Key? key}) : super(key: key);

  @override
  State<TuteeChatRoomScreen> createState() => _TuteeChatRoomScreenState();
}

class _TuteeChatRoomScreenState extends State<TuteeChatRoomScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: const Center(
        child: Text("Chat Screen", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),),
      ),
    );
  }
}
