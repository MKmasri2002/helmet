import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';
import 'package:helmet_customer/data/area_repository.dart';
import 'package:helmet_customer/data/user_repository.dart';
import 'package:helmet_customer/data/wash_package_repository.dart';
import 'package:helmet_customer/models/area/area_model.dart';
import 'package:helmet_customer/models/dirver_model.dart';
import 'package:helmet_customer/models/schedule_list.dart';
import 'package:helmet_customer/models/user_model.dart';
import 'package:helmet_customer/models/wash_models/package_model.dart';
import 'package:helmet_customer/models/wash_models/wash_data_trip_model.dart';
import 'package:helmet_customer/models/wash_models/wash_items.dart';
import 'package:helmet_customer/utils/constants.dart';
import 'package:helmet_customer/data/auth_repository.dart';

UserModel userModel = UserModel();
WashDataTripModel washDataTripModel = WashDataTripModel();
List<WashItemsModel> washItemsAfterFiltering = [];
List<Area> areasList = [];
 List<WashDataTripModel> userWashDataTripModel = [];


class HomeController extends GetxController {
  List<PackageModel> adsPackages = [];
  List<PackageModel> oneTimePackages = [];
  List<PackageModel> subscriptionPackages = [];

 
  WashDataTripModel? nearest;
  Duration? remainingTime;
  Timer? _timer;

  @override
  void onInit() async {
    await getAllData();
    _startTimer();
    super.onInit();
  }

  void _startTimer() {
    if (nearest == null) return;

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      nearest = getNearestOrder();
      update();
    });
  }

  @override
  void onClose() {
    _timer?.cancel();
    super.onClose();
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
    
    userWashDataTripModel = await UserRepository.getUserOrders();
    
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
    // Get all schedules from repository from firebase
    // save them in schedulesList
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

  WashDataTripModel? getNearestOrder() {
    DateTime now = DateTime.now();

    // فلترة: بس الأوردرات القادمة
    final upcoming = userWashDataTripModel
        .where((o) => o.dateTime != null && o.dateTime!.isAfter(now))
        .toList();

    if (upcoming.isEmpty) return null;

    // ترتيب حسب التاريخ
    upcoming.sort((a, b) => a.dateTime!.compareTo(b.dateTime!));

    return upcoming.first;
  }
}
