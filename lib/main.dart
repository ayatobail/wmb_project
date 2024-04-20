import 'dart:io';
import 'package:flutter/material.dart';
import 'package:mwb_project/app/my_app.dart';
import 'package:mwb_project/app/my_app_controller.dart';
import 'package:mwb_project/core/data/reposotories/shared_preferences_repository.dart';
import 'package:mwb_project/core/services/connectivity_service.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Get.putAsync<SharedPreferences>(() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs;
  }); 
  await Get.put(SharedPreferencesRepository());
  Get.put(ConnectivityService());
  Get.put(MyAppController());

  HttpOverrides.global = MyHttpOverrides();
  runApp(const MyApp());
}

class MyHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient(SecurityContext? context){
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
  }
}
