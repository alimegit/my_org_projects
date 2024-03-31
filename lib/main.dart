import 'package:default_project/screens/splash_screen.dart';
import 'package:default_project/view_models/adress_view_model.dart';
import 'package:default_project/view_models/location_view_model.dart';
import 'package:default_project/view_models/maps_view_model.dart';
import 'package:default_project/view_models/notification_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => LocationViewModel()),
      ChangeNotifierProvider(create: (_) => MapsViewModel()),
      ChangeNotifierProvider(create: (_) => NotificationViewModel()),
      ChangeNotifierProvider(create: (_) => AddressesViewModel()),

    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(

      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(useMaterial3: false),
        home: SplashScreen(),
      ),
    );
  }
}
