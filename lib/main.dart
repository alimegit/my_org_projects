import 'package:default_project/app/app.dart';
import 'package:default_project/bloc/auth_bloc.dart';
import 'package:default_project/bloc/auth_event.dart';
import 'package:default_project/data/local/storage_repository.dart';
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
  runApp(const AppLevel());
}
