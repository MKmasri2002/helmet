import 'dart:async';
import 'dart:convert';
import 'dart:core';
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart' as firestore;
import 'package:cloud_firestore/cloud_firestore.dart' hide Order;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:helmet_customer/data/area_repository.dart';
import 'package:helmet_customer/data/driver_repository.dart';
import 'package:helmet_customer/data/user_repository.dart';
import 'package:helmet_customer/data/wash_package_repository.dart';
import 'package:helmet_customer/models/area/area_model.dart';
import 'package:helmet_customer/models/schedule_list.dart';
import 'package:helmet_customer/models/subscribe.dart';
import 'package:helmet_customer/models/user_model.dart';
import 'package:helmet_customer/models/wash_models/package_model.dart';
// import 'package:helmet_customer/models/wash_models/order.dart';
import 'package:helmet_customer/models/wash_models/wash_items.dart';
import 'package:helmet_customer/models/wash_models/order.dart';
// import 'package:helmet_customer/models/wash_models/order.dart';
import 'package:helmet_customer/utils/constants.dart';
import 'package:helmet_customer/data/auth_repository.dart';

UserModel userModel = UserModel();
Order order = Order();
Subscribe subscribe = Subscribe();
List<WashItemsModel> washItemsAfterFiltering = [];
List<Area> areasList = [];
Order? nearestOrder;
Duration? remainingTime;
Timer? _timer;
List<Order> userOrders = [];
List<Order> FutureOrders = [];
// List<WashSession> futureSessions = [];
// WashSession? nearestSession;

String? newStatus;

class HomeController extends GetxController {
  List<Subscribe> subscriptions = [];
  StreamSubscription<DocumentSnapshot>? _orderListener;
  List<PackageModel> adsPackages = [];
  List<PackageModel> oneTimePackages = [];
  List<PackageModel> subscriptionPackages = [];

  Timer? sessionTimer;
  late DatabaseReference orderRef;
  @override
  void onInit() async {
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
    await getUserInfo();
    await getPackages();
    await getAllAreas();
    await getSubscriptions(userModel.uid!);
    await getAllUserOrder();
    await getAllDriverInArea();
    await getNearestOrderAndListen();
    // startSessionTimer();
    log(userModel.toString());

    update();
  }

  Future<void> getSubscriptions(String userId) async {
    try {
      subscriptions.clear();
      var snapshot = await firestore.FirebaseFirestore.instance
          .collection('subscribe')
          .where('user_id', isEqualTo: userId)
          .where('remain', isGreaterThan: 0)
          .get();

      subscriptions = snapshot.docs.map((doc) {
        final data = doc.data();
        data['id'] = doc.id; // حفظ الـ doc id
        return Subscribe.fromJson(data);
      }).toList();

      update(); // تحديث الـ UI
    } catch (e) {
      print('Error getting subscriptions: $e');
    }
  }

  Future<void> getUserInfo() async {
    if (FirebaseAuth.instance.currentUser != null) {
      userModel.uid = FirebaseAuth.instance.currentUser!.uid;

      userModel = await AuthRepository.getFullUserData(userModel.uid!);
    }
    update();
  }

  Future<void> getPackages() async {
    List<PackageModel> packages = await WashPackageRepository.getAllPackage();
    for (PackageModel package in packages) {
      if (package.showInAdds == true) {
        adsPackages.add(package);
      }
      if (package.type == "one_time") {
        oneTimePackages.add(package);
      } else {
        subscriptionPackages.add(package);
      }
    }
    update();
  }

  Future<void> getAllAreas() async {
    areasList = await AreaRepository.getAllAreas();
    update();
  }

  Future<void> getAllUserOrder() async {
    userOrders.clear();

    userOrders = await UserRepository.getUserOrders(userId: userModel.uid!);
    update();
  }

  Future<void> getNearestOrderAndListen() async {
    try {
      final snap = await FirebaseFirestore.instance
          .collection('order')
          .where('user_id', isEqualTo: userModel.uid)
          .get();
      if (snap.docs.isEmpty) {
        nearestOrder = null;
        FutureOrders.clear();
        update();
        return;
      }

      // 2️⃣ تحويل الطلبات إلى Objects
      FutureOrders.clear();
      FutureOrders = snap.docs
          .map((doc) => Order.fromJson(doc.data()))
          .where((o) => o.status != 'done') // استبعد المنتهية
          .toList();

      // 3️⃣ ترتيب الطلبات حسب الوقت (الأقرب أولًا)
      FutureOrders.sort((a, b) {
        final aTime = DateTime.tryParse(a.washTime ?? '') ?? DateTime(2100);
        final bTime = DateTime.tryParse(b.washTime ?? '') ?? DateTime(2100);
        return aTime.compareTo(bTime);
      });

      if (FutureOrders.isEmpty) {
        print("✅ لا يوجد طلبات نشطة حالياً");
        nearestOrder = null;
        update();
        return;
      }

      nearestOrder = FutureOrders.first;
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
          final updatedOrder = Order.fromJson(doc.data()!);
          if (nearestOrder!.status != updatedOrder.status) {
            nearestOrder = updatedOrder;
            update();

            print('🚀 الحالة الجديدة: ${updatedOrder.status}');

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

  Future<void> getAllDriverInArea() async {
    final List<String> areas_id = [];
    for (var address in userModel.addresses) {
      areas_id.add(address.areaId!);
    }
    driverList.clear();
    driverList = await DriverRepository.getAllDrivers(
        userId: userModel.uid!, areas_id: areas_id);
    getAllSchedulesDriver();
    update();
  }

  void getAllSchedulesDriver() async {
    if (driverList.isEmpty) {
      log("No drivers available in this area");
      return;
    }
    log("Getting schedules for driver: ${driverList[0].name!}");
    FirebaseDatabase.instance
        .ref("driver/${driverList[0].id!}/schedule")
        .get()
        .then((value) {
      if (!value.exists) {
        return;
      }
      try {
        Map<String, dynamic> data = jsonDecode(jsonEncode(value.value));
        log("User orders data: ${data.keys}");
        for (var key in data.keys) {
          ScheduleModel driverModel = ScheduleModel.fromJson(data[key]);
          schedulesList.add(driverModel);
        }
        log("User orders Driver: ${driverList.length}");
      } catch (e) {
        log('Error fetching users Dsssssata: $e');
      }
      update();
    }).catchError((error) {
      log("Error getting schedules: $error");
    });
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
