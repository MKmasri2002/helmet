import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:helmet_customer/models/user_model.dart';
import 'package:helmet_customer/utils/global/global.dart';
import 'package:helmet_customer/utils/widgets/custom_dialog.dart';
import 'package:helmet_customer/utils/widgets/custom_snake_bar.dart';
import 'package:helmet_customer/data/auth_repository.dart';
import 'package:helmet_customer/views/home/home_controller.dart';

class ProfileScreenController extends GetxController {


  void getUserInfo() async {
  final currentUser = FirebaseAuth.instance.currentUser
;
  if (currentUser != null) {
    userModel = await AuthRepository.getCurrentUserInfo(currentUser.uid);
    update(); // لتحديث الواجهة إذا بتستخدم GetBuilder
  } else {
    customSnakeBar(message: "لم يتم العثور على مستخدم مسجل حاليًا", color: Colors.red);
  }
}

  void onClickSave() {
    if (userModel.name!.isEmpty) {
      customSnakeBar(message: "Name is empty".tr, color: Colors.red);
    } else if (userModel.email!.isEmpty) {
      customSnakeBar(message: "Email is empty".tr, color: Colors.red);
    } else if (userModel.password!.isEmpty) {
      customSnakeBar(message: "Password is empty".tr, color: Colors.red);
    } else {
      customProgressDialog();
      AuthRepository().updateAccount(userModel).then((value) {
        closeProgressDialog();
        if (!value.state) {
          customSnakeBar(message: value.getResponseMessage());
        }
      });
    }
  }
}
