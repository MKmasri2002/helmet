import 'dart:convert';
import 'dart:developer';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:helmet_customer/data/user_repository.dart';
import 'package:helmet_customer/models/car.dart';
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
  int totalPrice = 0;
  // Car selectedCar = Car();
  // List<CarTypeModel> carTypes = [];
  // List<CarTypeModel> carTypesAfterFiltering = [];
  // List<CarSubTypeModel> carSubTypes = [];
  // List<CarSubTypeModel> carSubTypes2 = [];
  // List<CarSubTypeModel> carSubTypesAfterFiltering = [];

  // List<Car> myCars = [];
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

  @override
  void onInit() async {
    super.onInit();
    // if (washDataTripModel.washPrice != null) {
    //   if (washDataTripModel.washType == 'one_time') {
    //     totalPrice = washDataTripModel.washPrice!.toInt();
    //   } else {
    //     totalPrice = 0;
    //   }
    // }

    await getWashItems();
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
    // if (washDataTripModel.isPaid != null) {
    //   log("create order");
    //   await setOrderAlreadyPayed();

    //   return;
    // }
    // if (driverList.isEmpty) {
    //   Get.snackbar("Error", "No drivers available in this area",
    //       snackPosition: SnackPosition.BOTTOM,
    //       backgroundColor: Colors.red[400],
    //       colorText: Colors.white);
    //   return;
    // }

    // selectedDateTime = DateTime(
    //   selectedDateTime.year,
    //   selectedDateTime.month,
    //   selectedDateTime.day,
    //   selectedTime.hour,
    // );
    // WashSession washSession = WashSession(
    //   areaId: userModel.addresses[0].areaId,
    //   driverId: driverList[0].id,
    //   washTime: fullDate.toString(),
    //   status: 'pending',
    // );
    // washSession.cars = selectedCars;
    // washDataTripModel.sessions.add(washSession);

    // if (washDataTripModel.washCount! > 1) {
    //   washDataTripModel.washCount = washDataTripModel.washCount! - 1;
    // }

    Get.to(
      () => const CartScreen(
        showTime: true,
      ),
      binding: CartBinding(),
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
