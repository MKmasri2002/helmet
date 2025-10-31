import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:helmet_customer/data/car_repository.dart';
import 'package:helmet_customer/models/car.dart';
import 'package:helmet_customer/models/cars_model.dart';
import 'package:helmet_customer/utils/global/global.dart';
import 'package:helmet_customer/utils/tools/tools.dart';
import 'package:helmet_customer/views/booking/booking_controller.dart';
import 'package:helmet_customer/views/home/home_controller.dart';

class AddCarController extends GetxController {
  CarsModel carsModel = CarsModel();
  List<String> carType = [];
  final TextEditingController plateNumberController = TextEditingController();
  String selectedBrand = "Select Brand";
  String selectedModel = "Select Model";
  String selectedColorHex = "Select Color";
  Color selectedColor = const Color(0xFF111111);
  String selectedImage = '';
  List<Map<String, dynamic>> carColorMap = [
    {"hex": const Color(0xFF000000), "color_code": "#000000"},
    {"hex": const Color(0xFFFFFFFF), "color_code": "#FFFFFF"},
    {"hex": const Color(0xFF808080), "color_code": "#808080"},
    {"hex": const Color(0xFFB0B0B0), "color_code": "#B0B0B0"},
    {"hex": const Color(0xFFFF0000), "color_code": "#FF0000"},
    {"hex": const Color(0xFF8B0000), "color_code": "#8B0000"},
    {"hex": const Color(0xFF0000FF), "color_code": "#0000FF"},
    {"hex": const Color(0xFF00008B), "color_code": "#00008B"},
    {"hex": const Color(0xFF00FF00), "color_code": "#00FF00"},
    {"hex": const Color(0xFF006400), "color_code": "#006400"},
    {"hex": const Color(0xFFFFFF00), "color_code": "#FFFF00"},
    {"hex": const Color(0xFFFFA500), "color_code": "#FFA500"},
    {"hex": const Color(0xFF800080), "color_code": "#800080"},
    {"hex": const Color(0xFFFFC0CB), "color_code": "#FFC0CB"},
    {"hex": const Color(0xFF964B00), "color_code": "#964B00"},
    {"hex": const Color(0xFF2F4F4F), "color_code": "#2F4F4F"},
    {"hex": const Color(0xFF708090), "color_code": "#708090"},
    {"hex": const Color(0xFFADD8E6), "color_code": "#ADD8E6"},
    {"hex": const Color(0xFFFFE4B5), "color_code": "#FFE4B5"},
    {"hex": const Color(0xFFC0C0C0), "color_code": "#C0C0C0"},
    {"hex": const Color(0xFF3B3B3B), "color_code": "#3B3B3B"},
    {"hex": const Color(0xFFDAA520), "color_code": "#DAA520"},
    {"hex": const Color(0xFF228B22), "color_code": "#228B22"},
    {"hex": const Color(0xFFD2691E), "color_code": "#D2691E"},
    {"hex": const Color(0xFF5F9EA0), "color_code": "#5F9EA0"},
  ];

  @override
  void onInit() async {
    super.onInit();
    String car = await rootBundle.loadString("assets/json/cars.json");
    carsModel = CarsModel.fromJson(jsonDecode(car));
    carsModel.cars!.sort((a, b) => a.brand!.compareTo(b.brand!));
  }

  void addCar(BuildContext context) async {
    
    appTools.unFocusKeyboard(context);
    if (plateNumberController.text.isEmpty) {
      Get.snackbar("Error", "Please enter plate number",
          snackPosition: SnackPosition.BOTTOM);
      return;
    }
    if (selectedBrand == "Select Brand") {
      Get.snackbar("Error", "Please select brand",
          snackPosition: SnackPosition.BOTTOM);
      return;
    }
    if (selectedModel == "Select Model") {
      Get.snackbar("Error", "Please select model",
          snackPosition: SnackPosition.BOTTOM);
      return;
    }
    if (selectedColorHex == "Select Color") {
      Get.snackbar("Error", "Please select color",
          snackPosition: SnackPosition.BOTTOM);
      return;
    }
    // Add car to the firestore database
    // the local database will be users/uid/cars/id/add car
    Car newCar = Car(
        id: "",
        user_id: userModel.uid,
        plateNumber: plateNumberController.text,  
        brand: selectedBrand,
        model: selectedModel,
        color: selectedColorHex,
        image:
            "https://raw.githubusercontent.com/filippofilip95/car-logos-dataset/master/logos/optimized/${selectedBrand.toLowerCase().replaceAll(' ', '-')}.png");

    userModel.cars.add(newCar);
    CarRepository.addCar(car: newCar);
    plateNumberController.clear();
      selectedBrand = "Select Brand";
      selectedModel = "Select Model";
      selectedColorHex = "Select Color";
      selectedColor = const Color(0xFF111111);
      Get.find<BookingController>().update();
      Get.back();
      update();
  }


  ///////////////////////////////////////////////////////////
   Stream<QuerySnapshot> getUserCarsStream() {
    String uid = FirebaseAuth.instance.currentUser!.uid;
    return FirebaseFirestore.instance
        .collection('car')
        .where("user_id", isEqualTo: uid)
        .snapshots();
  }

  Future<void> deleteCar(String docId) async {
    try {
      await FirebaseFirestore.instance
          .collection('car')
          .doc(docId)
          .delete();
      Get.snackbar(
        "تم الحذف",
        "تم حذف السيارة بنجاح",
        snackPosition: SnackPosition.BOTTOM,
      );
    } catch (e) {
      Get.snackbar(
        "خطأ",
        "حدث خطأ أثناء حذف السيارة: $e",
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }
}
