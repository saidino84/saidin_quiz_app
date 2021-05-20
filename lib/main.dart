import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:saidin_quiz_app/app/controler/app_controller.dart';
import 'app/pages/welcome/welcome_page.dart';

void main() async {
  await GetStorage.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Saidino Quiz App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: WellComePage(),
      // home:
    );
  }
}
