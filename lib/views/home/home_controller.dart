import 'dart:async';
import 'dart:convert';
import 'dart:core';
import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:helmet_customer/data/area_repository.dart';
import 'package:helmet_customer/data/driver_repository.dart';
import 'package:helmet_customer/data/user_repository.dart';
import 'package:helmet_customer/data/wash_package_repository.dart';
import 'package:helmet_customer/models/area/area_model.dart';
import 'package:helmet_customer/models/dirver_model.dart';
import 'package:helmet_customer/models/schedule_list.dart';
import 'package:helmet_customer/models/user_model.dart';
import 'package:helmet_customer/models/wash_models/package_model.dart';
import 'package:helmet_customer/models/wash_models/order.dart';
import 'package:helmet_customer/models/wash_models/reservation.dart';
import 'package:helmet_customer/models/wash_models/wash_items.dart';
import 'package:helmet_customer/models/wash_models/wash_session.dart';
import 'package:helmet_customer/utils/constants.dart';
import 'package:helmet_customer/data/auth_repository.dart';

UserModel userModel = UserModel();
Order washDataTripModel = Order();
Subscribe subscribe = Subscribe();
List<WashItemsModel> washItemsAfterFiltering = [];
List<Area> areasList = [];
List<Order> userOrder = [];
List<WashSession> userSessions = [];
List<WashSession> futureSessions = [];
WashSession? nearestSession;
Duration? remainingTime;
String? newStatus;

class HomeController extends GetxController {
  List<PackageModel> adsPackages = [];
  List<PackageModel> oneTimePackages = [];
  List<PackageModel> subscriptionPackages = [];
  List<Order> userSubscriptionOrders = [];
  List<Order> userOneTimeOrders = [];
  Timer? sessionTimer;
  late DatabaseReference orderRef;
  @override
  void onInit() async {
    await getAllData();
    if (nearestSession != null) {
      _listenToSessionStatus(nearestSession?.id ?? "");
    }
    super.onInit();
  }

  void _listenToSessionStatus(String sessionId) {
    orderRef
        .child("washSessions/$sessionId/status")
        .onValue
        .listen((event) async {
      if (!event.snapshot.exists) return;

      newStatus = event.snapshot.value as String;
      if (newStatus == "done") await getAllUserOrder();
      update();
    });
  }

  Future<void> getAllData() async {
    await getUserInfo();
    await getPackages();
    await getAllAreas();
    /////////////////////
    await getAllUserOrder();
    await getAllDriverInArea();
    startSessionTimer();
    log(userModel.toString());

    update();
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
    userOrder.clear();
    userSubscriptionOrders.clear();
    userOneTimeOrders.clear();

    userOrder = await UserRepository.getUserOrders(userId: userModel.uid!);
    if (userOrder.isNotEmpty)
      for (Order order in userOrder) {
        if (order.washType == "subscription") {
          userSubscriptionOrders.add(order);
        } else if (order.washType == "one_time") {
          userOneTimeOrders.add(order);
        }
      }
    getUserSession();

    update();
  }

  void getUserSession() {
    userSessions.clear();
    // الأفضل تنظف قبل ما تضيف عشان ما تتكرر البيانات
    for (var order in userOrder) {
      userSessions.addAll(order.sessions);
    }

    if (userSessions.isEmpty) return;

    // استبعد الجلسات المنتهية
    futureSessions =
        userSessions.where((session) => session.status != 'done').toList();

    if (futureSessions.isEmpty) return;

    // رتب الجلسات حسب الوقت الأقرب
    futureSessions.sort((a, b) =>
        DateTime.parse(a.washTime!).compareTo(DateTime.parse(b.washTime!)));

    final now = DateTime.now();

    // أقرب جلسة
    nearestSession = futureSessions.first;
    orderRef = FirebaseDatabase.instance.ref(
        "orders/${userOrder.firstWhere((order) => order.sessions.any((s) => s.id == nearestSession!.id)).id}");
    if (nearestSession!.status == 'pending') {
      final washDateTime = DateTime.parse(nearestSession!.washTime!);

      if (washDateTime.isAfter(now)) {
        remainingTime = washDateTime.difference(now);
      } else {
        nearestSession!.status = 'on_way';
        washDataTripModel = userOrder
            .firstWhere((order) => order.sessions.contains(nearestSession));
        FirebaseDatabase.instance
            .ref(
                "orders/${washDataTripModel.id}/washSessions/${nearestSession!.id}/status")
            .set('on_way');
      }
    }

    update();
  }

  void startSessionTimer() {
    sessionTimer = Timer.periodic(const Duration(seconds: 5), (timer) {
      getUserSession();
    });
  }

  Future<void> getAllDriverInArea() async {
    final List<String> areas_id = [];
    for (var address in userModel.addresses) {
      areas_id.add(address.areaId!);
    }
    driverList.clear();
    driverList = await DriverRepository.getAllDrivers(userId: userModel.uid!, areas_id: areas_id);
    // await FirebaseDatabase.instance.ref("driver").get().then((value) {
    //   if (!value.exists) {
    //     return;
    //   }
    //   try {
    //     Map<String, dynamic> data = jsonDecode(jsonEncode(value.value));
    //     for (var key in data.keys) {
    //       DriverModel driverModel = DriverModel.fromJson(data[key]);
    //       if (currentAddress.value.areaId == driverModel.areaId) {
    //         driverList.add(driverModel);
    //         if (driverList[0].orders == null) {
    //           driverList[0].orders = [];
    //         }
    //       }
    //     }

    //     log("User orders Driver: ${driverList.length}");
    //   } catch (e) {
    //     log('Error fetching users Dsssssata: $e');
    //   }
      getAllSchedulesDriver();
      update();
    // });
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
