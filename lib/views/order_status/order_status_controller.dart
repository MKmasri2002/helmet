import 'dart:convert';
import 'dart:developer';
import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:helmet_customer/models/wash_models/wash_data_trip_model.dart';
import 'package:helmet_customer/models/wash_models/wash_items.dart';
import 'package:helmet_customer/utils/tools/tools.dart';
import 'package:helmet_customer/views/home/home_controller.dart';

class OrderStatusController extends GetxController {
  GoogleMapController? mapController;
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
    
    userAddressMethod();
    super.onInit();
  }

  void userAddressMethod() async {
  
    userAddress = await appTools.getAddressFromLatLng(
      userModel.Addresses[0].latitude ?? 0,
      userModel.Addresses[0].longitude ?? 0,
    );
    update();
  }

  

 
}
