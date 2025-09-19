import 'dart:convert';
import 'dart:developer';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
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
  TimeOfDay selectedTime = TimeOfDay.now();

  DateTime selectedDateTime = DateTime.now();
  List<int> timesDay = List.generate(24, (index) => index);
  bool didUserSeletedDateOfDay = false;
  bool didUserSeletedCar = false;
  bool didUserSeletedDate = false;
  List<WashItemsModel> washItems = [];
  List<int> selectedWashItemIndices = [];

  bool applePay = false;
  bool creditCard = false;

  @override
  void onInit() async {
    super.onInit();
    if (washDataTripModel.paymentMethod == null) {
      totalPrice = washDataTripModel.washPrice!.toInt();
    }

    await getWashItems();
  }

  void selectAndUnSelectCar({required Car car}) {
    if (selectedCars.contains(car)) {
      selectedCars.removeWhere((e) => e == car);
    } else {
      selectedCars.add(car);
    }
    washDataTripModel.cars = selectedCars;
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

  void toggleWashItem(int index) {
    if (selectedWashItemIndices.contains(index)) {
      selectedWashItemIndices.remove(index);
      totalPrice -= washItems[index].price!.toInt();
      washDataTripModel.washPrice = totalPrice.toDouble();
    } else {
      selectedWashItemIndices.add(index);
      totalPrice += washItems[index].price!.toInt();
      washDataTripModel.washPrice = totalPrice.toDouble();
    }
    update();
  }

  bool isWashItemSelected(int index) {
    return selectedWashItemIndices.contains(index);
  }

  void createOrder() async {
    if (washDataTripModel.paymentMethod != null) {
      log("create order");
      await setOrderAlreadyPayed();

      return;
    }
    if (driverList.isEmpty) {
      Get.snackbar("Error", "No drivers available in this area",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red[400],
          colorText: Colors.white);
      return;
    }

    
    selectedDateTime = DateTime(
      selectedDateTime.year,
      selectedDateTime.month,
      selectedDateTime.day,
      selectedTime.hour,
    );
    washDataTripModel.areaId = userModel.Addresses[0].areaId;
    washDataTripModel.createdAt = DateTime.now().toString();
    washDataTripModel.userName = userModel.name;
    washDataTripModel.userId = userModel.uid;
    washDataTripModel.washTimeDay = selectedTime.toString();
    washDataTripModel.washTimeDate = selectedDateTime.toString();
    washDataTripModel.userLat = userModel.Addresses[0].latitude!;
    washDataTripModel.userLng = userModel.Addresses[0].longitude!;
    washDataTripModel.driverName = driverList[0].fullName;
    washDataTripModel.driverPhone = driverList[0].phoneNumber;
    if (washDataTripModel.washCount! > 1) {
      washDataTripModel.washCount = washDataTripModel.washCount! - 1;
    }
    
    Get.to(
      () => const CartScreen(
        showTime: true,
      ),
      binding: CartBinding(),
    );
  }

  Future<void> setOrderAlreadyPayed() async {
    if (driverList.isEmpty) {
      Get.snackbar("Error", "No drivers available in this area");
      return;
    }

    log("Order added to driver: ${driverList[0].orders!.length}");
    if (driverList[0].orders!.contains(washDataTripModel.id!) &&
        washDataTripModel.washCount! != 0 &&
        totalPrice.toInt() == 0) {
      Get.back();
      Get.snackbar(
        "Error",
        "Order already exists for this driver",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red[400],
        colorText: Colors.white,
      );
      Get.to(
        () => const OrderStatusView(),
        binding: OrderStatusBinding(),
        arguments: washDataTripModel,
      );
      return;
    }
    washDataTripModel.cars.addAll(selectedCars);
    log(washDataTripModel.cars.length.toString());
    selectedDateTime = DateTime(
      selectedDateTime.year,
      selectedDateTime.month,
      selectedDateTime.day,
      selectedTime.hour,
    );
    washDataTripModel.areaId = userModel.Addresses[0].areaId;
    washDataTripModel.createdAt = DateTime.now().toString();
    washDataTripModel.userName = userModel.name;
    washDataTripModel.userId = userModel.uid;
    washDataTripModel.washTimeDay = selectedTime.toString();
    washDataTripModel.washTimeDate = selectedDateTime.toString();
    washDataTripModel.userLat = userModel.Addresses[0].latitude!;
    washDataTripModel.userLng = userModel.Addresses[0].longitude!;
    if (washDataTripModel.washCount! > 1) {
      washDataTripModel.washCount = washDataTripModel.washCount! - 1;
    }
    washDataTripModel.driverName = driverList[0].fullName;
    washDataTripModel.driverPhone = driverList[0].phoneNumber;
    DatabaseReference documentReference =
        FirebaseDatabase.instance.ref("orders/${washDataTripModel.id}");
    await documentReference.set(washDataTripModel.toJson());
    driverList[0].orders!.add(washDataTripModel.id!);
    FirebaseDatabase.instance
        .ref("driver/${driverList[0].id}")
        .set(driverList[0].toJson());

    // Additional logic for setting the order can be added here
    // update user order history
    DatabaseReference userOrdersRef =
        FirebaseDatabase.instance.ref("Users/${userModel.uid}/order");
    washDataTripModel.washStatus = 'active';
    await userOrdersRef
        .child(washDataTripModel.id!)
        .set(washDataTripModel.toJson());

    Get.put(HomeController()).getAllDriverInArea();
    Get.back();
    Get.to(
      () => const OrderStatusView(),
      binding: OrderStatusBinding(),
      arguments: washDataTripModel,
    );
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
          await Get.put(HomeController()).getAllUserOrder();
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
