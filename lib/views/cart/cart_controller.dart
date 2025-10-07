import 'dart:async';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:helmet_customer/data/order_repositry.dart';
import 'package:helmet_customer/data/user_repository.dart';
import 'package:helmet_customer/utils/constants.dart';
import 'package:helmet_customer/utils/languages/translation_data.dart';
import 'package:helmet_customer/utils/tools/tools.dart';
import 'package:helmet_customer/views/home/home_controller.dart';
import 'package:helmet_customer/views/order_status/order_status_binding.dart';
import 'package:helmet_customer/views/order_status/order_status_view.dart';
import 'package:moyasar/moyasar.dart';

class CartController extends GetxController {
  TextEditingController promoCodeController = TextEditingController();

  bool applePay = false;
  bool creditCard = false;

  static const int maxSeconds = 600; // 10 دقائق = 600 ثانية
  int seconds = maxSeconds;
  Timer? timer;

  String formatTime(int seconds) {
    final minutes = seconds ~/ 60;
    final sec = seconds % 60;
    return '${minutes.toString().padLeft(2, '0')}:${sec.toString().padLeft(2, '0')}';
  }

  void startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (seconds > 0) {
        seconds--;
        update();
      } else {
        timer?.cancel();
      }
    });
  }

  @override
  void onClose() {
    timer?.cancel();
    super.onClose();
  }

  @override
  void onInit() {
    startTimer();
    super.onInit();
  }
  ////// using one time package and subsicription*////////////
  void onPaymentResult(result) async {
    if (seconds <= 0) {
      Get.snackbar(
        TranslationData.error.tr,
        TranslationData.timeExpired.tr,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      return;
    }
    if (result is PaymentResponse) {
      PaymentResponse paymentResponse = result;
    
      CardPaymentResponseSource sourcePayment = paymentResponse.source;
      log(result.status.toString());
      switch (result.status) {
        case PaymentStatus.paid:
       
          log("order set");

          washDataTripModel.isPaid = true;

          log(washDataTripModel.toString());
         await setOrder();
          appTools.unFocusKeyboard(Get.context!);

          await Get.put(HomeController()).getAllUserOrder();

          Get.back();
          Get.back();
          Get.back();
          break;
        case PaymentStatus.failed:
          // handle failure.
          break;
        case PaymentStatus.initiated:
          break;
        case PaymentStatus.authorized:
          break;
        case PaymentStatus.captured:
          break;
      }
    }
  }
 ////// using one time package*////////////
  Future<void> setOrder() async {
    await OrderRepositry.setOrder(order: washDataTripModel);
     userOrder =
          await UserRepository.getUserOrders(userId: userModel.uid!);
      Get.find<HomeController>().update();
    if (washDataTripModel.washType == "one_time") {
      Get.to(() => const OrderStatusView(),
          binding: OrderStatusBinding(), arguments: washDataTripModel);
    }
     
     
  }

  void payCridetCard() {
    PaymentConfig paymentConfig = PaymentMethods.payWithMoyasarCridetCard(100);
    CreditCard(
      config: paymentConfig,
      onPaymentResult: onPaymentResult,
    );
  }
}
