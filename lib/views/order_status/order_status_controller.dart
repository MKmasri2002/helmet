import 'dart:convert';
import 'dart:developer';
import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';
import 'package:helmet_customer/models/wash_models/wash_data_trip_model.dart';
import 'package:helmet_customer/models/wash_models/wash_items.dart';
import 'package:helmet_customer/utils/tools/tools.dart';
import 'package:helmet_customer/views/home/home_controller.dart';
import 'package:url_launcher/url_launcher.dart';

class OrderStatusController extends GetxController {
  WashDataTripModel washDataTripModel = WashDataTripModel();
  List<WashItemsModel> washItems = [];
  String userAddress = "";
  List<WashItemsModel> washItemsAfterFiltering = [];
  String argument = '';
  // Define your variables and methods here

  int updateOrderStatus(String status) {
    if (status.isEmpty) {
      return 0; // Return an error code
    }
    if (status == "completed") {
      // Perform actions for completed order
      return 3;
    }

    if (status == "in_progress") {
      // Perform actions for in-progress order
      return 2;
    }
    if (status == "active") {
      // Perform actions for active order
      return 1;
    }
    if (status == "pending") {
      // Perform actions for pending order
      return 0;
    }
    if (status == "cancelled") {
      // Perform actions for cancelled order
      return -1;
    }
    return 1; // Return a status code
  }

  @override
  void onInit() async {
    washDataTripModel = Get.arguments as WashDataTripModel;
    // get wash items from firebase in items
    getItemByID();
    getOrderById();
    userAddressMethod();
    super.onInit();
  }

  void userAddressMethod() async {
    userAddress = await appTools.getAddressFromLatLng(
      washDataTripModel.userLat!,
      washDataTripModel.userLng!,
    );
    update();
  }

  void getOrderById({String? orderId}) {
    DatabaseReference data = FirebaseDatabase.instance.ref('orders');

    data.child(orderId ?? washDataTripModel.id!).onValue.listen((value) async {
      if (value.snapshot.value != null) {
        washDataTripModel = WashDataTripModel.fromJson(
            jsonDecode(jsonEncode(value.snapshot.value)));
        if (washDataTripModel.washStatus == 'completed') {
          await Future.delayed(const Duration(seconds: 3));
          Get.back();
          Get.put(() => HomeController());
          Get.find<HomeController>().getAllData();
          Get.find<HomeController>().update();
        }
        log("Order. ID: ${washDataTripModel.id!}, Data: ${washDataTripModel.toJson()}");
        update();
      }
    }).onError((error) {
      log("Error getting order: $error");
    });
  }

  void getItemByID() {
    DatabaseReference data = FirebaseDatabase.instance.ref('items');
    // log(washDataTripModel.washItems![0]);
    for (WashItemsModel d in washItemsAfterFiltering) {
      log("Wash Item ID:${d.id}");
      data.child(d.id!).get().then((value) {
        if (value.value != null) {
          washItems.add(
              WashItemsModel.fromJson(jsonDecode(jsonEncode(value.value))));
          update();
        }
      }).catchError((error) {
        log("Error getting wash items: $error");
      });
    }
    update();
  }

  void callDriver(String phoneNumber) {
    // Implement logic to call the driver
    log("Calling driver...");
    // You can use a package like url_launcher to initiate a phone call
    // For example:
    canLaunchUrl(Uri.parse('tel:$phoneNumber')).then((canLaunch) {
      if (canLaunch) {
        launchUrl(Uri.parse('tel:$phoneNumber'));
      } else {
        log("Cannot launch phone call");
      }
    }).catchError((error) {
      log("Error launching phone call: $error");
    });
  }
}
