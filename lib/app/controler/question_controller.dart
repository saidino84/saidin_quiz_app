import 'dart:async';

import 'package:flutter/animation.dart';
import 'package:get/get.dart';

class QuestioCotroller extends GetxController
    with SingleGetTickerProviderMixin {
  //lets aimate our progress bar
  late Animation _animation;
  late AnimationController _animcontroller;

  //so that we we can acess our animation outside
  Animation get animation => this._animation;

//called immediately after the widget is allocated memory
  @override
  void onInit() {
    //our animation duration is 60s
    //so our plan to fill the progress bar within 60s
    _animcontroller =
        AnimationController(duration: Duration(seconds: 60), vsync: this);

    _animation = Tween<double>(begin: 0, end: 1).animate(_animcontroller)
      ..addListener(() {
        //update like setState
        print('ya');
        update(); // fara actualizar cada mudanca que animation.value recebera ate chegar de 0->1 dentro de 60 segundos
      });
    //start our aimation
    _animcontroller.forward();
    // update();
    super.onInit();
  }
}
