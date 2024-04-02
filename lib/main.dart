import 'package:default_project/cubit/country/country_cubit.dart';
import 'package:default_project/data/local/storage_repository.dart';
import 'package:default_project/routes.dart';
import 'package:default_project/screens/home_screen.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'screens/countries_screen.dart';

void main(List<String> args) {
  WidgetsFlutterBinding.ensureInitialized();

  StorageRepository.instance;
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(create: (_) => CountryCubit()..callCountry()),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(414, 896),
      builder: (context, child) {
        ScreenUtil.init(context);
        return MaterialApp(
          initialRoute: RouteNames.helloScreen,
          debugShowCheckedModeBanner: false,
          theme: ThemeData(useMaterial3: false),
          home: child,
        );
      },
      child:const  PasswordScreen(),
    );
  }
}
