import 'package:default_project/hello_screen.dart';
import 'package:default_project/screens/auth/login/login_screen.dart';
import 'package:default_project/screens/auth/register/register_screen.dart';
import 'package:default_project/screens/splash_screen/splash_screen.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppRoute {
  static Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case "/splash_screen":
        {
          return navigate(const SplashScreen());

        }
        case "/login_screen":
        {
          return navigate(const LoginScreen());

        }
        case "/register_screen":
        {
          return navigate(const RegisterScreen());

        }
      default:
        {
          return navigate(
            Scaffold(
              body: Center(
                child: Text(
                  "Mavjud Emas",
                  style: TextStyle(fontSize: 30.sp),
                ),
              ),
            ),
          );
        }
    }
  }

  static navigate(Widget widget) {
    return MaterialPageRoute(builder: (context) => widget);
  }
}

class RouteNames {
  static const String splashScreen = "/splash_screen";
  static const String loginScreen = "/login_screen";
  static const String registerScreen= "/register_screen";

}
