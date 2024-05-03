import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../bloc/auth/auth_bloc.dart';
import '../bloc/auth/auth_event.dart';
import '../data/repositories/auth_repository.dart';
import '../routes.dart';

class AppLevel extends StatelessWidget {
  const AppLevel({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [RepositoryProvider(create: (_) => AuthRepository())],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => AuthBloc(authRepository: context.read<AuthRepository>())
              ..add(
                CheckAuthenticationEvent(),
              ),
          ),
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