import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:default_project/bloc/auth_bloc.dart';
import 'package:default_project/bloc/auth_event.dart';
import 'package:default_project/data/repositories/auth_repository.dart';
import 'package:default_project/routes.dart';
import 'package:default_project/services/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Future<void> main(List<String> args) async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [RepositoryProvider(create: (_) => AuthRepository())],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => AuthBloc(authRepository: context.read<AuthRepository>())..add(CheckAuthenticationEvent()))
        ],
        child: ScreenUtilInit(
          designSize: const Size(430, 932),
          builder: (context, child) {
            ScreenUtil.init(context);
            return AnnotatedRegion(
              value: const SystemUiOverlayStyle(
                  statusBarColor: Colors.transparent, statusBarIconBrightness: Brightness.dark),
              child: MaterialApp(
                initialRoute: RouteNames.splashScreen,
                onGenerateRoute: AppRoute.generateRoute,
                debugShowCheckedModeBanner: false,
                theme: ThemeData(useMaterial3: false),
              ),
            );
          },
        ),
      ),
    );
  }
}
