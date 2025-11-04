import 'package:firebase_auth/firebase_auth.dart';
import 'package:helmet_customer/data/area_repository.dart';
import 'package:helmet_customer/data/auth_repository.dart';
import 'package:helmet_customer/data/driver_repository.dart';
import 'package:helmet_customer/data/order_repositry.dart';
import 'package:helmet_customer/data/user_repository.dart';
import 'package:helmet_customer/data/wash_package_repository.dart';
import 'package:helmet_customer/models/area/area_model.dart';
import 'package:helmet_customer/models/dirver_model.dart';
import 'package:helmet_customer/models/subscribe.dart';
import 'package:helmet_customer/models/user_model.dart';
import 'package:helmet_customer/models/wash_models/order.dart';
import 'package:helmet_customer/models/wash_models/package_model.dart';

UserModel userModel = UserModel();
List<PackageModel> packages = [];
List<AreaModel> areas = [];
List<Subscribe> subscriptions = [];
List<OrderModel> orders = [];
List<DriverModel> drivers = [];

Future<void> getAllData() async {
  clearAllData();
  await getUserInfo();
  await getPackages();
  await getAllAreas();
  await getSubscriptions(userModel.uid!);
  await getAllUserOrder();
  await getAllDriverInArea();
  
}

Future<void> getUserInfo() async {
  if (FirebaseAuth.instance.currentUser != null) {
    userModel.uid = FirebaseAuth.instance.currentUser!.uid;

    userModel = await AuthRepository.getFullUserData(userModel.uid!);
  }
}

Future<void> getPackages() async {
  packages = await WashPackageRepository.getAllPackage();
}

Future<void> getAllAreas() async {
  areas = await AreaRepository.getAllAreas();
}

Future<void> getSubscriptions(String userId) async {
  subscriptions = await OrderRepositry.getUserSubscriptions(userId: userId);
}

Future<void> getAllUserOrder() async {
  orders = await UserRepository.getUserOrders(userId: userModel.uid!);
}
Future<void> getAllDriverInArea() async {
    
    final List<String> areasId = [];
    for (var address in userModel.addresses) {
      areasId.add(address.areaId!);
    }
    
    drivers = await DriverRepository.getAllDrivers(
        userId: userModel.uid!, areas_id: areasId);
  
  }

void clearAllData() {
  userModel = UserModel();
  packages.clear();
  areas.clear();
  subscriptions.clear();
  orders.clear();
  drivers.clear();
}
