// this for order for user

import 'package:firebase_database/firebase_database.dart';
import 'package:helmet_customer/models/wash_models/wash_data_trip_model.dart';
import 'package:helmet_customer/views/home/home_controller.dart';

class UserOrders {
  static void addPackageToUser(WashDataTripModel package) {
    FirebaseDatabase database = FirebaseDatabase.instance;
    database
        .ref("users")
        .child(userModel.uid!)
        .child("packages")
        .push()
        .set(package.toJson());
  }
}