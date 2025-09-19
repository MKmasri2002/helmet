import 'dart:async';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:helmet_customer/data/driver_repository.dart';
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
      // log("Payment Response: ${paymentResponse.toJson()}");
      CardPaymentResponseSource sourcePayment = paymentResponse.source;
      log(result.status.toString());
      switch (result.status) {
        case PaymentStatus.paid:
          // handle success.
          // save payment response to database
          log("order set");
          washDataTripModel.paymentAmount = paymentResponse.amount;
          washDataTripModel.paymentDate = paymentResponse.createdAt;
          washDataTripModel.paymentMethod = sourcePayment.company.toString();
          washDataTripModel.paymentStatus = paymentResponse.status.toString();
          washDataTripModel.paymentTransactionId = sourcePayment.transactionUrl;
          washDataTripModel.paymentToken = sourcePayment.token;
          washDataTripModel.paymentId = paymentResponse.id;
          washDataTripModel.paymentCard = sourcePayment.number;
          washDataTripModel.areaId = userModel.addresses[0].areaId;
          washDataTripModel.createdAt = DateTime.now().toString();
          washDataTripModel.userName = userModel.name;
          washDataTripModel.userId = userModel.uid;
          washDataTripModel.userPhone = userModel.phone;
          if (driverList.isNotEmpty) {
            washDataTripModel.driverName = driverList[0].fullName;
            washDataTripModel.driverPhone = driverList[0].phoneNumber;
          } else {
            log("⚠️ driverList is empty or null");
          }
          log(washDataTripModel.toString());
          setOrder();
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

  Future<void> setOrder() async {
    washDataTripModel.id =
        await OrderRepositry.setOrder(order: washDataTripModel);
    await UserRepository.setOrderToUser(
        orderId: washDataTripModel.id!, order: washDataTripModel);
    // if (washItemsAfterFiltering.isNotEmpty) {
    //   await UserRepository.setItemsToOrder(
    //       items: washItemsAfterFiltering, orderId: washDataTripModel.id);
    // }
    if(washDataTripModel.cars.isNotEmpty){
     await UserRepository.setCarsToOrder(
          cars: washDataTripModel.cars, orderId: washDataTripModel.id);
    }

    if (washDataTripModel.washType == "one_time") {
      await DriverRepository.setOrderToDriver(
          driverId: driverList[0].id!,
          orderId: washDataTripModel.id!,
          order: washDataTripModel);
      userWashDataTripModel = await UserRepository.getUserOrders();
      Get.find<HomeController>().update();
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
