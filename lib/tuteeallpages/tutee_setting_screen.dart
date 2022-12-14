import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:personal_portfolio/authentications/login_screen.dart';
import 'package:personal_portfolio/tuteeallpages/my_account_screen.dart';
import 'package:personal_portfolio/tuteeallpages/password_reset_screen.dart';
import 'package:provider/provider.dart';

import '../SharedPref/shared_preference_class.dart';
import '../providers/authentication_provider_class.dart';
import '../widgets/mywidets.dart';

class TuteeSettingScreen extends StatefulWidget {
  const TuteeSettingScreen({Key? key}) : super(key: key);

  @override
  State<TuteeSettingScreen> createState() => _TuteeSettingScreenState();
}

class _TuteeSettingScreenState extends State<TuteeSettingScreen> {
  @override
  Widget build(BuildContext context) {
    final myProvider = Provider.of<SignInAuthenticationProvider>(context);
    return WillPopScope(
      onWillPop: () async{
        return false;
      },
      child: Scaffold(
          backgroundColor: backgroundColor,
          body: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.center,
                    child: Image.asset(
                      "assets/images/ttt.png",
                      height: 300,
                    ),
                  ),
                  InkWell(
                    onTap: (){
                      Navigator.push(
                          context,
                          PageTransition(
                            type: PageTransitionType.bottomToTop,
                            duration: const Duration(milliseconds: 500),
                            child: const MyAccountScreen(),
                            inheritTheme: true,
                            ctx: context,
                          ));
                    },
                    child: Container(
                      height: 55,
                      width: 300,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: const ListTile(
                        title: Text(
                          "My Account",
                          style: TextStyle(
                              color: Colors.deepPurple,
                              fontSize: 17,
                              fontWeight: FontWeight.w700),
                        ),
                        trailing: Icon(
                          Icons.account_circle,
                          color: Colors.deepPurple,
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const PasswordResetScreen()));
                    },
                    child: Container(
                      height: 55,
                      width: 300,
                      margin: const EdgeInsets.only(top: 10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: const ListTile(
                        title: Text(
                          "Password Reset",
                          style: TextStyle(
                              color: Colors.deepPurple,
                              fontSize: 17,
                              fontWeight: FontWeight.w700),
                        ),
                        trailing: Icon(
                          Icons.lock_reset_rounded,
                          color: Colors.deepPurple,
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      myProvider.signOut(context);
                      SharedPreferenceClass.preferences!.setBool("loggedIn", false);
                    },
                    child: Container(
                      height: 55,
                      width: 300,
                      margin: const EdgeInsets.only(top: 10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: const ListTile(
                        title: Text(
                          "Logout",
                          style: TextStyle(
                              color: Colors.deepPurple,
                              fontSize: 17,
                              fontWeight: FontWeight.w700),
                        ),
                        trailing: Icon(
                          Icons.logout,
                          color: Colors.deepPurple,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          )),
    );
  }
}
