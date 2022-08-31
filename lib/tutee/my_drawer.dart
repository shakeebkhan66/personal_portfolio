import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:personal_portfolio/widgets/mywidets.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: backgroundColor,
      child: ListView(
        children: [
          Container(
            child: Image.asset("assets/images/ttt.png", height: 250,),
          ),
          const ListTile(
            leading: Icon(Icons.home_filled, color: Colors.white,),
            title: Text("HOME", style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w400),),
          ),
          const ListTile(
            leading: Icon(CupertinoIcons.text_bubble_fill, color: Colors.white,),
            title: Text("MESSAGE", style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w400),),
          ),
          const ListTile(
            leading: Icon(CupertinoIcons.settings, color: Colors.white,),
            title: Text("SETTINGS", style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w400),),
          ),
          const SizedBox(height: 220),
          const ListTile(
              leading: Icon(Icons.logout, color: Colors.white,),
              title: Text("LOGOUT", style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w400),),
            ),
        ],
      ),
    );
  }
}
