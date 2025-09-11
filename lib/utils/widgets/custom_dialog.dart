


import 'package:flutter/material.dart';
import 'package:get/get.dart';

void customProgressDialog({bool cancelable = true}){

  Future.delayed(Duration.zero,(){
    Get.dialog(
      Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40)
        ),
        child: Dialog(
          // ignore: deprecated_member_use
          child: WillPopScope(
            onWillPop: () async{

              return cancelable;
            },
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const CircularProgressIndicator(),
                  Text("Please wait...".tr),
                ],
              ),
            ),
          ),
        ),
      ),
      barrierDismissible: cancelable,
    );

  });

}


void closeProgressDialog(){
  if (Get.isDialogOpen == true){
    Get.back();
  }
}