import 'package:default_project/routes.dart';
import 'package:default_project/screens/home_screen/hello_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'data/repositories/file_repository.dart';
import 'data/services/file_manager_service.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  FileManagerService();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(create: (_) => FileRepository()),
      ],
      child: ScreenUtilInit(
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
        child:const FileManagerScreen(),
      )
    );
  }
}
