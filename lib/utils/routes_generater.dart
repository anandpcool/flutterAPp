import 'package:flutter/material.dart';
import 'package:iboss_flutter/screens/login/login_page.dart';
import 'package:iboss_flutter/screens/login/login_with_otp.dart';
import 'package:iboss_flutter/screens/login/splash.dart';

import '../screens/credit_page/full_screen_dialog.dart';
import '../screens/home/dashboard.dart';

class RouteGenerater {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // final args = settings.arguments;
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => SplashScreen());

      case '/otp':
        return MaterialPageRoute(builder: (_) => LoginWithOtp());
      case '/login':
        return MaterialPageRoute(builder: (_) => const LoginPage());
      case '/home':
        return MaterialPageRoute(builder: (_) => DashBoardPage());
      case '/dialog':
        return MaterialPageRoute(builder: (context) => ShowFullScreenDialod());

      default:
        return MaterialPageRoute(builder: (_) => SplashScreen());
    }
  }
}
