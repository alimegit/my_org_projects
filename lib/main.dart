import 'package:default_project/routes.dart';
import 'package:default_project/view_models/calculator_view_model.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import 'calculator/hello_screen.dart';

void main(List<String> args) {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CalculatorViewModel()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(320, 568),
      builder: (context, child) {
        ScreenUtil.init(context);
        return MaterialApp(
          initialRoute: RouteNames.helloScreen,
          debugShowCheckedModeBanner: false,
          theme: ThemeData(useMaterial3: false),
          home: child,
        );
      },
      child: const CalculatorScreen(),
    );
  }
}
