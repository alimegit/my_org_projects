import 'package:default_project/screens/auth/login/login_screen.dart';
import 'package:default_project/screens/auth/register/register_screen.dart';
import 'package:default_project/screens/loacal_auth/method_one/confirm_pin_screen.dart';
import 'package:default_project/screens/loacal_auth/method_one/entry_pin_screen.dart';
import 'package:default_project/screens/loacal_auth/method_one/set_pin_screen.dart';
import 'package:default_project/screens/loacal_auth/method_two/touch_id_screen.dart';
import 'package:default_project/screens/one_screen/one_screen.dart';
import 'package:default_project/screens/splash/splash_screen.dart';
import 'package:default_project/screens/tabBox/tab_box.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:permission_handler/permission_handler.dart';

class AppRoutes {
  static Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case "/one_screen":
        {
          return navigate(const OneScreen());

        }
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
        case "/tab_box":
        {
          return navigate(const TabBox());

        }
        case "/setPin_route":
        {
          return navigate(const SetPinScreen());

        }  case "/confirmPin_route":
        {
          return navigate( ConfirmPinScreen(previousPin: settings.arguments as String,),);

        }  case "/touchId_route":
        {
          return navigate(const TouchIdScreen());

        }
        case "/entryPin_route":
        {
          return navigate(const EntryPinScreen());

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
  static const String oneScreen = "/one_screen";
  static const String loginScreen = "/login_screen";
  static const String registerScreen= "/register_screen";
  static const String tabBox= "/tab_box";
  static const String setPinScreen = "/setPin_route";
  static const String confirmPinScreen= "/confirmPin_route";
  static const String entryPinScreen= "/entryPin_route";
  static const String touchIdScreen= "/touchId_route";

}
