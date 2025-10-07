import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:helmet_customer/data/area_repository.dart';
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

class HomeController extends GetxController {
  List<PackageModel> adsPackages = [];
  List<PackageModel> oneTimePackages = [];
  List<PackageModel> subscriptionPackages = [];
  List<Order> userSubscriptionOrders = [];
  List<Order> userOneTimeOrders = [];

  @override
  void onInit() async {
    await getAllData();

    super.onInit();
  }

  Future<void> getAllData() async {
    if (FirebaseAuth.instance.currentUser != null) {
      userModel.uid = FirebaseAuth.instance.currentUser!.uid.toString();
    }

    await getUserInfo();
    await getPackages();
    await getAllAreas();
    await getAllUserOrder();
    await getAllDriverInArea();

    update();
  }

  Future<void> getUserInfo() async {
    userModel = await AuthRepository.getCurrentUserInfo(userModel.uid!);
    userModel.Addresses =
        await AuthRepository.getCurrentUserAdresses(userModel.uid!);
    userModel.cars = await AuthRepository.getUserCars(userModel.uid!);

    update();
  }

  Future<void> getPackages() async {
    List<PackageModel> packages =
        await WashPackageRepository.getAllWashPackage();
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
    userSessions.clear();
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
    for (var order in userOrder) {
      userSessions.addAll(order.sessions);
    }

    if (userSessions.isEmpty) return;
    userSessions.sort((a, b) =>
        DateTime.parse(b.washTime!).compareTo(DateTime.parse(a.washTime!)));
    // استبعد الجلسات اللي وقتها مضى
    final now = DateTime.now();
    futureSessions = userSessions
        .where((session) =>
            session.washTime != null &&
            DateTime.parse(session.washTime!).isAfter(now))
        .toList();

    if (futureSessions.isEmpty) return;

    // رتبهم حسب الوقت الأقرب
    futureSessions.sort((a, b) =>
        DateTime.parse(a.washTime!).compareTo(DateTime.parse(b.washTime!)));

    nearestSession = futureSessions.first;
    final washDateTime = DateTime.parse(nearestSession!.washTime!);
    remainingTime = washDateTime.difference(now);
    update();
  }

  Future<void> getAllDriverInArea() async {
    await FirebaseDatabase.instance.ref("driver").get().then((value) {
      if (!value.exists) {
        return;
      }
      try {
        Map<String, dynamic> data = jsonDecode(jsonEncode(value.value));
        for (var key in data.keys) {
          DriverModel driverModel = DriverModel.fromJson(data[key]);
          if (currentAddress.value.areaId == driverModel.areaId) {
            driverList.add(driverModel);
            if (driverList[0].orders == null) {
              driverList[0].orders = [];
            }
          }
        }

        log("User orders Driver: ${driverList.length}");
      } catch (e) {
        log('Error fetching users Dsssssata: $e');
      }
      getAllSchedulesDriver();
      update();
    });
  }

  void getAllSchedulesDriver() async {
    if (driverList.isEmpty) {
      log("No drivers available in this area");
      return;
    }
    log("Getting schedules for driver: ${driverList[0].id!}");
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

  void checkLocaionAndLogin() {
    checkIsLoggedIn();
    checkLocation();
    return;
  }

  void checkIsLoggedIn() {
    if (FirebaseAuth.instance.currentUser == null) {
      Get.snackbar('Error', 'Please login first',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
          duration: const Duration(seconds: 3));
      return;
    }
  }

  void checkLocation() {
    if (userModel.Addresses[0].latitude == null) {
      Get.snackbar('Error', 'Please select or add an address first',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
          duration: const Duration(seconds: 3));
      return;
    }
  }
}
