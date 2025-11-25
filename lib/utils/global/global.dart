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
import 'package:helmet_customer/utils/constants.dart';

UserModel userModel = UserModel();
List<PackageModel> packages = [];
List<AreaModel> areas = [];
List<Subscribe> subscriptions = [];
List<OrderModel> orders = [];
List<DriverModel> driversList = [];

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
/// Fetch all available drivers based on user's current location/area
/// Filters drivers by:
/// 1. User's saved addresses areas
/// 2. Current location area (if available)
/// 3. Active and online status
Future<void> getAllDriverInArea() async {
    final List<String> areasId = [];
    
    // Get areas from user's saved addresses
    for (var address in userModel.addresses) {
      if (address.areaId != null && !areasId.contains(address.areaId)) {
        areasId.add(address.areaId!);
      }
    }
    
    // Add current location area if available and not already in list
    if (currentAddress.value.areaId != null && 
        !areasId.contains(currentAddress.value.areaId)) {
      areasId.add(currentAddress.value.areaId!);
    }
    
    // If no areas found, return empty list
    if (areasId.isEmpty) {
      driversList.clear();
      return;
    }
    
    // Fetch all drivers in these areas
    final allDrivers = await DriverRepository.getAllDrivers(
        userId: userModel.uid!, areas_id: areasId);
    
    // Filter to only active and available drivers
    driversList = allDrivers.where((driver) {
      final isActive = driver.isActive ?? false;
      final isOnline = driver.isOnline ?? false;
      final status = driver.status ?? 'Active';
      
      return isActive && isOnline && status == 'Active';
    }).toList();
    
    // Sort by rating (highest first)
    driversList.sort((a, b) {
      final ratingA = a.rating ?? 0.0;
      final ratingB = b.rating ?? 0.0;
      return ratingB.compareTo(ratingA);
    });
  }

/// Refresh drivers list based on current location
/// Can be called when user changes location or manually refreshes
Future<void> refreshDriversByLocation() async {
  await getAllDriverInArea();
}

/// Get available drivers count
int getAvailableDriversCount() {
  return driversList.where((driver) => 
    (driver.isOnline ?? false) && 
    (driver.isActive ?? false) && 
    (driver.status ?? 'Active') == 'Active'
  ).length;
}

/// Find best driver (highest rated and available)
DriverModel? getBestAvailableDriver() {
  if (driversList.isEmpty) return null;
  
  final availableDrivers = driversList.where((driver) =>
    (driver.isOnline ?? false) && 
    (driver.isActive ?? false) && 
    (driver.status ?? 'Active') == 'Active'
  ).toList();
  
  if (availableDrivers.isEmpty) return null;
  
  // Already sorted by rating in getAllDriverInArea
  return availableDrivers.first;
}

void clearAllData() {
  userModel = UserModel();
  packages.clear();
  areas.clear();
  subscriptions.clear();
  orders.clear();
  driversList.clear();
}
