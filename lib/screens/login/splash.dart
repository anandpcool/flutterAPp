import 'dart:async';

import 'package:flutter/material.dart';
import 'package:iboss_flutter/screens/login/login_page.dart';
import '../../utils/user_simple_preferences.dart';
import '../home/dashboard.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    //bool status = UserSimplePreferences.getUserStatus();

    Timer(const Duration(seconds: 2), () => navigateUser(context));
  }

  @override
  Widget build(BuildContext context) {
    return initWidget();
  }
}

Widget initWidget() {
  return Scaffold(
    body: Stack(
      children: [
        Container(
          decoration: const BoxDecoration(color: Colors.white),
        ),
        Center(
          child: Container(
            child: Image.asset(
              "assets/images/icon_app_logo.png",
            ),
          ),
        ),
      ],
    ),
  );
}

void navigateUser(BuildContext context) async {
  bool status = UserSimplePreferences.getUserStatus();
  print("States data------------->$status");
  if (status == true) {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => DashBoardPage()));
  } else {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => const LoginPage()));
  }
}
