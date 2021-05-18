import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import 'componets/body.dart';

class QuizScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        extendBodyBehindAppBar: true, //o body extedera ate la no topo do appBar
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () => Get.back(
              closeOverlays: true,
            ),
          ),
          actions: [
            TextButton(
              child: Text('skip'),
              onPressed: () {},
            )
          ],
        ),
        body: Body());
  }
}
