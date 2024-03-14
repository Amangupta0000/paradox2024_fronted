import 'package:flutter/material.dart';
import 'package:get/get.dart';

class QuestionController extends GetxController
    with GetSingleTickerProviderStateMixin {
  AnimationController? _animationController;
  Animation? _animation;
  Animation get animation => this.animation;
  @override
  void onInit() {
    // TODO: implement onInit
    _animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 60));
    _animation = Tween<double>(begin: 0, end: 1).animate(_animationController!)
      ..addListener(() {
        update();
      });
    _animationController!.forward();
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
    _animationController!.dispose();
  }
}
