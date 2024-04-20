import 'package:default_project/routes.dart';
import 'package:default_project/screens/product_screen.dart';
import 'package:default_project/services/service_locator.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'bloc/qr_bloc.dart';
import 'bloc/qr_event.dart';
import 'hello_screen.dart';
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setUp();
  runApp(MyApp());
}



class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(414, 896),
      builder: (context, child) {
        ScreenUtil.init(context);
        return MultiBlocProvider(
          providers: [
            BlocProvider(create: (_) => ProductBloc()..add(LoadProducts()))
          ],
          child: MaterialApp(
            initialRoute: RouteNames.helloScreen,

            debugShowCheckedModeBanner: false,
            theme: ThemeData(useMaterial3: false),
            home: child,
          ),
        );
      },
      child:const ProductScreen(),
    );
  }
}