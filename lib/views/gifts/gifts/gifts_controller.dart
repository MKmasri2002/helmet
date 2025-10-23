import 'package:flutter/material.dart';
import 'package:get/get.dart';

class giftsController extends GetxController {
  TextEditingController phoneController = TextEditingController();
  TextEditingController option1Controller = TextEditingController();
  TextEditingController option2Controller = TextEditingController();
  TextEditingController option3Controller = TextEditingController();
  int selected = 0;
  @override
  void onInit() {
    super.onInit();
    phoneController.addListener(() {
      update();
    });
  }

  void phone(String c) {
    phoneController.text = c;
    update();
  }

  void select(int value) {
    selected = value;
    update();
  }
}
