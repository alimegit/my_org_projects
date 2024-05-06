import 'package:default_project/app/app.dart';
import 'package:default_project/services/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'data/local/storage_repository.dart';
Future<void> main(List<String> args) async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  StorageRepository.instance;
  runApp(const AppLevel());
}
