import 'package:default_project/hello_screen.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppRoute {
  static Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case "/":
        {
          return navigate(const HelloScreen());

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


}
