import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:helmet_customer/models/user_model.dart';
import 'package:helmet_customer/utils/widgets/custom_dialog.dart';
import 'package:helmet_customer/utils/widgets/custom_snake_bar.dart';
import 'package:helmet_customer/data/auth_repository.dart';

class ProfileScreenController extends GetxController {
  UserModel userModel = UserModel.fromJson({});

  @override
  void onInit() {
    super.onInit();
    getUserInfo();
  }

  void getUserInfo() async {
    userModel = await AuthRepository.getCurrentUserInfo(userModel.uid!);
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
