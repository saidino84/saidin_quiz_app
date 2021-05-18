import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'app/pages/welcome/welcome_page.dart';

void main() {
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
