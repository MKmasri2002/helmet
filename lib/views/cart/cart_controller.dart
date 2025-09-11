import 'dart:async';
import 'dart:developer';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:helmet_customer/models/wash_models/wash_items.dart';
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
          washDataTripModel.areaId = currentAddress.value.areaId;
          washDataTripModel.createdAt = DateTime.now().toString();
          washDataTripModel.userName = userModel.name;
          washDataTripModel.userId = userModel.uid;
          washDataTripModel.userPhone = userModel.phone;
          if (driverList != null && driverList.isNotEmpty) {
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
    // Implement order setting logic here
    DatabaseReference documentReference =
        FirebaseDatabase.instance.ref("orders").push();
    documentReference.set(washDataTripModel.toJson());
    log("order set");
    washDataTripModel.id = documentReference.key!;

    DatabaseReference userOrdersRef =
        FirebaseDatabase.instance.ref("Users/${userModel.uid}/order");
    await userOrdersRef
        .child(washDataTripModel.id!)
        .set(washDataTripModel.toJson());
    if (washItemsAfterFiltering.isNotEmpty) {
      for (WashItemsModel item in washItemsAfterFiltering) {
        await userOrdersRef
            .child(washDataTripModel.id!)
            .child('items')
            .child(item.id!)
            .set(item.toJson());
      }
    }
    if (washDataTripModel.washType == "one_time") {
      DatabaseReference documentReference =
          FirebaseDatabase.instance.ref("orders/${washDataTripModel.id}");
      await documentReference.set(washDataTripModel.toJson());
      await FirebaseDatabase.instance
          .ref("driver/${driverList[0].id}/orders/${washDataTripModel.id}")
          .set(washDataTripModel.toJson());
      await Get.put(HomeController()).getAllUserOrder();
      Get.to(() => const OrderStatusView(),
          binding: OrderStatusBinding(), arguments: washDataTripModel);
    }

    // you need to set list areas data in the database done
    // set to driver in same area and available time done
    // get all drivers in same area done
    // build logic to find driver have time for this in same area done
    // check the area support this order done
    // check the time support this order done
    // send to all driver have same area and time
    // send notification to the driver he have new order in list
    // send notification to the user that the order is accepted
    // create screen for order details
    // create screen for order history
  }

  void payCridetCard() {
    PaymentConfig paymentConfig = PaymentMethods.payWithMoyasarCridetCard(100);
    CreditCard(
      config: paymentConfig,
      onPaymentResult: onPaymentResult,
    );
  }
}
