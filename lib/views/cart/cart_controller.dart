import 'dart:async';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:helmet_customer/data/order_repositry.dart';
import 'package:helmet_customer/data/subscribe_repositry.dart';
import 'package:helmet_customer/models/wash_models/order.dart';
import 'package:helmet_customer/utils/constants.dart';
import 'package:helmet_customer/utils/global/global.dart';
import 'package:helmet_customer/utils/languages/translation_data.dart';
import 'package:helmet_customer/utils/routes/routes_string.dart';
import 'package:helmet_customer/utils/tools/tools.dart';
import 'package:helmet_customer/views/home/home_controller.dart';
import 'package:helmet_customer/views/order_status/order_status_binding.dart';
import 'package:helmet_customer/views/order_status/order_status_view.dart';
import 'package:moyasar/moyasar.dart';

class CartController extends GetxController {
  TextEditingController promoCodeController = TextEditingController();
  dynamic product;
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
    product = Get.arguments['product'];
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
          if (product is OrderModel) {
            await setOrder();
            orders.add(order);
          } else {
            await setSubscribe();
          }
          appTools.unFocusKeyboard(Get.context!);

          // await Get.put(HomeController()).getAllUserOrder();

          Get.offAllNamed(RoutesString.home);
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
    await OrderRepositry.addOrder(order: order);
    
  }

  Future<void> setSubscribe() async {
    await SubscribeRepositry.addSubscription(subscribe: subscribe);
    //  userOrder =
    //       await UserRepository.getUserOrders(userId: userModel.uid!);
    //   Get.find<HomeController>().update();
    if (order.type == "one_time") {
      Get.to(() => const OrderStatusView(),
          binding: OrderStatusBinding(), arguments: order);
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
