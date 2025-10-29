import 'dart:convert';
import 'dart:developer';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:helmet_customer/data/order_repositry.dart';
import 'package:helmet_customer/data/subscribe_repositry.dart';
import 'package:helmet_customer/data/user_repository.dart';
import 'package:helmet_customer/models/car.dart';
import 'package:helmet_customer/models/dirver_model.dart';
import 'package:helmet_customer/models/subscribe.dart';
import 'package:helmet_customer/models/wash_models/order.dart';
import 'package:helmet_customer/models/wash_models/wash_items.dart';

import 'package:helmet_customer/utils/constants.dart';
import 'package:helmet_customer/utils/tools/tools.dart';
import 'package:helmet_customer/views/cart/cart_binding.dart';
import 'package:helmet_customer/views/cart/cart_screen.dart';
import 'package:helmet_customer/views/home/home_controller.dart';
import 'package:helmet_customer/views/order_status/order_status_binding.dart';
import 'package:helmet_customer/views/order_status/order_status_view.dart';
import 'package:moyasar/moyasar.dart';

class BookingController extends GetxController {
  GoogleMapController? mapController;

  List<DriverModel> currentDrivers = [];
  List<Order> currentOrders = [];

  int totalPrice = 0;

  List<Car> selectedCars = [];
  DateTime? fullDate;
  TimeOfDay selectedTime = TimeOfDay.now();

  DateTime selectedDateTime = DateTime.now();
  List<int> timesDay = List.generate(24, (index) => index);
  bool didUserSeletedDateOfDay = false;
  bool didUserSeletedCar = false;
  bool didUserSeletedDate = false;
  List<WashItemsModel> washItems = [];

  bool applePay = false;
  bool creditCard = false;
  dynamic product;
  @override
  void onInit() async {
    product = Get.arguments['product'];
    super.onInit();
    if (order.price != null) {
      if (product is Order) {
        totalPrice = order.price!.toInt();
      } else {
        totalPrice = 0;
      }
    }
    await getSchedules();
    await getWashItems();
  }

  Future<void> getSchedules() async {
    await getOrdersAndDriversInThisAreaId(
        areaId: userModel.addresses
                .firstWhere((ele) => ele.defaultLocation == true)
                .areaId ??
            '');
            
    update();
  }

  Future<void> getOrdersAndDriversInThisAreaId({required String areaId}) async {
    currentDrivers = await UserRepository.getDriversInArea(areaId: areaId);
    log("Drivers in area $areaId : ${driverList.length}");
    currentOrders = await OrderRepositry.getOrdersInArea(areaId: areaId);
    log("Schedules in area $areaId : ${currentOrders.length}");
  }

  void selectAndUnSelectCar({required Car car}) {
    if (selectedCars.contains(car)) {
      selectedCars.removeWhere((e) => e == car);
    } else {
      selectedCars.add(car);
    }

    update();
  }

  String formatHour(BuildContext context, int hour) {
    final time = TimeOfDay(hour: hour, minute: 0);
    return time.format(context); // يرجع "2:00 PM" أو "14:00" حسب لغة الجهاز
  }

  bool checkTimeInList(int dates) {
    for (var data in schedulesList) {
      DateTime time = DateTime.parse(data.time!);
      if (time.hour == dates && time.day == selectedDateTime.day) {
        return true;
      }
    }
    return false;
  }

  /////////////////*******is using for one time package and subsicription*/
  void createOrder() async {
    selectedDateTime = DateTime(
      selectedDateTime.year,
      selectedDateTime.month,
      selectedDateTime.day,
      selectedTime.hour,
    );
    order.washTime = fullDate.toString();
    order.cars = selectedCars;

    userOrders.add(order);
    // await OrderRepositry.addOrder(order: order);
    if (product is Subscribe) {
      await OrderRepositry.addOrder(order: order);
      product.remain--;
      await SubscribeRepositry.updateSubscription(
          subscribe: product as Subscribe);
      return;
    }
    Get.to(
      () => CartScreen(
        showTime: true,
      ),
      binding: CartBinding(),
      arguments: {'product': order},
    );
  }

  /// using subsicription
  Future<void> setOrderAlreadyPayed() async {
    if (driverList.isEmpty) {
      Get.snackbar("Error", "No drivers available in this area");
      return;
    }

    // WashSession newSession = WashSession(
    //   areaId: userModel.addresses[0].areaId,
    //   driverId: driverList[0].id,
    //   washTime: fullDate.toString(),
    //   status: 'pending',
    // );
    // newSession.cars = selectedCars;
    // washDataTripModel.sessions.add(newSession);

    // selectedDateTime = DateTime(
    //   selectedDateTime.year,
    //   selectedDateTime.month,
    //   selectedDateTime.day,
    //   selectedTime.hour,
    // );
    // print(washDataTripModel.sessions.last.status);
    // washDataTripModel.createdAt = DateTime.now().toString();
    // washDataTripModel.userId = userModel.uid;
    // washDataTripModel.endDate = selectedDateTime.toString();
    // if (washDataTripModel.washCount! > 1) {
    //   washDataTripModel.decrementWashCount();
    //   log("decrement");
    // }
    // print(washDataTripModel.sessions.last.status);
    // await UserRepository.updateSubscriptionOrder(
    //     orderId: washDataTripModel.id!,
    //     newWashCount: washDataTripModel.remain!,
    //     newSession: newSession,
    //     cars: selectedCars);
    // print(washDataTripModel.sessions.last.status);
    // await Get.put(HomeController()).getAllUserOrder();
    // print(washDataTripModel.sessions.last.status);
    // Get.back();
    // Get.to(
    //   () => const OrderStatusView(),
    //   binding: OrderStatusBinding(),
    //   arguments: washDataTripModel,
    // );
  }

  Future<void> getWashItems() async {
    final DatabaseReference collectionReference =
        FirebaseDatabase.instance.ref("items");
    await collectionReference.get().then((value) {
      Map<String, dynamic> data = jsonDecode(jsonEncode(value.value));

      for (var item in data.keys) {
        washItems.add(WashItemsModel.fromJson(data[item]));
      }
      log("Wash items: ${washItems.length}");
      update();
    }).catchError((error) {
      log("Error getting wash items: $error");
    });
  }

  void onPaymentResult(result) async {
    if (result is PaymentResponse) {
      switch (result.status) {
        case PaymentStatus.paid:
          // handle success.
          // save payment response to database

          appTools.unFocusKeyboard(Get.context!);
          // await Get.put(HomeController()).getAllUserOrder();
          createOrder();
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
}
