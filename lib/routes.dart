import 'package:default_project/hello_screen.dart';
import 'package:default_project/screens/animation_1.dart';
import 'package:default_project/screens/animation_2.dart';
import 'package:default_project/screens/animation_3.dart';
import 'package:default_project/screens/animation_4.dart';
import 'package:default_project/screens/animation_5.dart';
import 'package:default_project/screens/animation_6.dart';
import 'package:default_project/screens/animation_7.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppRoute {
  static Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case "/":
        {
          return navigate(const HelloScreen());

        } case "/one_route":
        {
          return navigate(const Animation1());

        }
        case "/two_route":
        {
          return navigate(const Animation2());

        }
        case "/three_route":
        {
          return navigate( Animation3());

        }
        case "/four_route":
        {
          return navigate(const Animation4());

        }
        case "/five_route":
        {
          return navigate( Animation5());

        }
        case "/six_route":
        {
          return navigate(const Animation6());

        }
        case "/seven_route":
        {
          return navigate(const Animation7());

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
  static const String helloScreen = "/";
  static const String animation1 = "/one_route";
  static const String animation2 = "/two_route";
  static const String animation3 = "/three_route";
  static const String animation4 = "/four_route";
  static const String animation5 = "/five_route";
  static const String animation6 = "/six_route";
  static const String animation7 = "/seven_route";

}
