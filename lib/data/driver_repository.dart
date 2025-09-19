import 'package:firebase_database/firebase_database.dart';
import 'package:helmet_customer/models/wash_models/wash_data_trip_model.dart';

class DriverRepository {
  static DatabaseReference ref = FirebaseDatabase.instance.ref("driver");
  static Future<void> setOrderToDriver(
      {required String driverId,required String orderId, required WashDataTripModel order}) async {
    await  ref.child(driverId).child("orders").child(orderId)
        .set(order.toJson());
  }
}