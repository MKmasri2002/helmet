import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';
import 'package:helmet_customer/data/wash_package_repository.dart';
import 'package:helmet_customer/models/area/area_model.dart';
import 'package:helmet_customer/models/dirver_model.dart';
import 'package:helmet_customer/models/schedule_list.dart';
import 'package:helmet_customer/models/user_model.dart';
import 'package:helmet_customer/models/wash_models/package_model.dart';
import 'package:helmet_customer/models/wash_models/wash_data_trip_model.dart';
import 'package:helmet_customer/models/wash_models/wash_items.dart';
import 'package:helmet_customer/utils/constants.dart';
import 'package:helmet_customer/utils/custom_date.dart';
import 'package:helmet_customer/views/address/address_book_controller.dart';
import 'package:helmet_customer/data/auth_repository.dart';

UserModel userModel = UserModel();
WashDataTripModel washDataTripModel = WashDataTripModel();
List<WashItemsModel> washItemsAfterFiltering = [];
List<AreaModel> areasList = [];

class HomeController extends GetxController {
  List<PackageModel> packages = [];
  List<PackageModel> adsCaruselPackages = [];
  List<PackageModel> oneTimePackages = [];
  List<PackageModel> subscriptionPackages = [];

  List<WashDataTripModel> userWashDataTripModel = [];

  @override
  void onInit() async {
    getAllData();
    super.onInit();
  }

  void getAllData() async {
    if (FirebaseAuth.instance.currentUser != null) {
      userModel.uid = FirebaseAuth.instance.currentUser!.uid.toString();
      log("uid : ${userModel.uid!}");
    }
    log("uid : ${userModel.uid!}");
    getUserInfo();
    getPackages();

    Get.lazyPut<AddressBookController>(() => AddressBookController());
    await Get.find<AddressBookController>().getCurrentPosition();
    getAllAreas();
    getAllUserOrder();
    await getAllDriverInArea();

    update();
  }

  void getPackages() async {
    packages = await WashPackageRepository.getAllWashPackage();
    for (PackageModel package in packages) {
      if (package.showInAdds == true) {
        adsCaruselPackages.add(package);
      }
      if (package.type == "one_time") {
        oneTimePackages.add(package);
      } else {
        subscriptionPackages.add(package);
      }
    }
  }

  Map<dynamic, dynamic> differenceDates = {};

  Timer? timer;
  void getDifference(int date) {
    try {
      timer!.cancel();
    } catch (e) {}
    timer = Timer.periodic(
      const Duration(seconds: 1),
      (timer) {
        differenceDates = CustomDate.differenceBetweenTowDatesDaysHoursMinuts(
            CustomDate.currentDateAtMillisecond(), date);
        update();
      },
    );
  }

  Timer? timer2;
  Map<dynamic, dynamic> differenceDatesForSubscription = {};
  void getDifferenceForSubscription(int date) {
    try {
      timer2!.cancel();
    } catch (e) {}
    timer2 = Timer.periodic(
      const Duration(seconds: 1),
      (timer) {
        differenceDatesForSubscription =
            CustomDate.differenceBetweenTowDatesDaysHoursMinuts(
                CustomDate.currentDateAtMillisecond(), date);
        update();
      },
    );
  }

  void getUserInfo() async {
    log(userModel.uid!);
    userModel = await AuthRepository.getCurrentUserInfo(userModel.uid!);
    userModel.userAddresses =
        await AuthRepository.getCurrentUserAdresses(userModel.uid!);

  }

  void getAllAreas() {
    // Get all areas from repository from firebase
    // save them in areasList
    FirebaseDatabase.instance.ref("areas").get().then((value) {
      try {
        Map<String, dynamic> data = jsonDecode(jsonEncode(value.value));
        for (var key in data.keys) {
          AreaModel areaModel = AreaModel.fromJson(data[key]);
          areasList.add(areaModel);
        }
        log('Areas Data: ${areasList.length}');
      } catch (e) {
        log('Error fetching users Data: $e');
      }
      update();
    });
  }

  Future<void> getAllUserOrder() async {
    // Get all user orders from repository from firebase
    // save them in userOrdersList
    if (FirebaseAuth.instance.currentUser == null) {
      return;
    }
    userWashDataTripModel.clear();
    await FirebaseDatabase.instance
        .ref("Users/${FirebaseAuth.instance.currentUser!.uid}/order")
        .get()
        .then((value) {
      if (!value.exists) {
        return;
      }
      try {
        Map<String, dynamic> data = jsonDecode(jsonEncode(value.value));
        log("User orders data: ${data.keys}");
        for (var key in data.keys) {
          WashDataTripModel areaModel = WashDataTripModel.fromJson(data[key]);
          if (!userWashDataTripModel.contains(areaModel)) {
            userWashDataTripModel.add(areaModel);
          }
        }
      } catch (e) {
        log('Error fetching users Dsssssata: $e');
      }
      update();
    });
  }

  Future<void> getAllDriverInArea() async {
    await FirebaseDatabase.instance.ref("driver").get().then((value) {
      if (!value.exists) {
        return;
      }
      try {
        Map<String, dynamic> data = jsonDecode(jsonEncode(value.value));
        log("User orders data keys: ${data.keys}");
        for (var key in data.keys) {
          log("Driver key: ${data[key]}");
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
}
