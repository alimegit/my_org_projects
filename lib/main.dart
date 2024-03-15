import 'package:default_project/data/repository/app_repository.dart';
import 'package:default_project/routes.dart';
import 'package:default_project/view_models/country_view_model.dart';
import 'package:default_project/view_models/users_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'data/network/api_provider.dart';
import 'hello_screen.dart';

void main(List<String> args) {
  ApiProvider apiProvider = ApiProvider();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => UsersViewModel(
            appRepository: AppRepository(apiProvider: apiProvider),
          )..fetchUsers(),
        ),
        ChangeNotifierProvider(
          create: (_) => CountryViewModel(
            appRepository: AppRepository(apiProvider: apiProvider),
          )..fetchAllCountries(),
        ),
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
      child: HelloScreen(),
    );
  }
}
