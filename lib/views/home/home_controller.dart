import 'dart:async';
import 'dart:core';
import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:helmet_customer/models/subscribe.dart';
import 'package:helmet_customer/models/wash_models/wash_items.dart';
import 'package:helmet_customer/models/wash_models/order.dart';
import 'package:helmet_customer/utils/global/global.dart';

OrderModel order = OrderModel();
Subscribe subscribe = Subscribe();
List<WashItemsModel> washItemsAfterFiltering = [];
OrderModel? nearestOrder;
Duration? remainingTime;
Timer? _timer;

List<OrderModel> futureOrders = [];

String? newStatus;

class HomeController extends GetxController {
  StreamSubscription<DocumentSnapshot>? _orderListener;

  Timer? sessionTimer;
  late DatabaseReference orderRef;
  @override
  void onInit() async {
    // ضيف هاي
    await getAllData();
    startTimer();
    super.onInit();
  }

  void startTimer() {
    _timer?.cancel(); // إذا كان في مؤقت شغال
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (nearestOrder?.washTime != null) {
        final washTime = DateTime.tryParse(nearestOrder!.washTime!);
        if (washTime != null) {
          remainingTime = washTime.difference(DateTime.now());
          update(); // يحدث الواجهة تلقائيًا
        }
      }
    });
  }

  Future<void> getAllData() async {
    await getNearestOrderAndListen();

    update();
  }

  Future<void> getNearestOrderAndListen() async {
    if (orders.isEmpty) {
      nearestOrder = null;
      futureOrders.clear();
      update();
      return;
    } else {
      try {
        futureOrders.clear();
        futureOrders = orders
            .where((o) => o.status != 'done') 
            .toList();
        futureOrders.sort((a, b) {
          final aTime = DateTime.tryParse(a.washTime ?? '') ?? DateTime(2100);
          final bTime = DateTime.tryParse(b.washTime ?? '') ?? DateTime(2100);
          return aTime.compareTo(bTime);
        });

        if (futureOrders.isEmpty) {
          nearestOrder = null;
          update();
          return;
        }

        nearestOrder = futureOrders.first;
        update();

        // 4️⃣ إلغاء أي استماع سابق
        await _orderListener?.cancel();

        // 5️⃣ استماع مباشر لتغييرات هذا الطلب
        _orderListener = FirebaseFirestore.instance
            .collection('order')
            .doc(nearestOrder!.id)
            .snapshots()
            .listen((doc) async {
          if (doc.exists) {
            final updatedOrder = OrderModel.fromJson(doc.data()!);
            if (nearestOrder!.status != updatedOrder.status) {
              nearestOrder = updatedOrder;
              update();

         

              // ✅ إذا صارت Done، انتقل للطلب التالي
              // if (updatedOrder.status == 'done') {
              await Future.delayed(const Duration(seconds: 1));
              await getNearestOrderAndListen(); // يعيد العملية تلقائيًا
              // }
            }
          }
        });
      } catch (e) {
        log("Error getting nearest order: $e");
      }
    }
  }

  bool checkLogin() {
    if (FirebaseAuth.instance.currentUser == null) return false;

    return true;
  }

  bool checkLocation() {
    if (userModel.addresses.isEmpty) return false;

    return true;
  }

  void pleaseLogin() {
    Get.snackbar('Error', 'Please login first',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
        duration: const Duration(seconds: 3));
    return;
  }

  void pleaseSelectLocation() {
    Get.snackbar('Error', 'Please select or add an address first',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
        duration: const Duration(seconds: 3));
    return;
  }
}
