import 'package:firebase_database/firebase_database.dart';
import 'package:helmet_customer/models/wash_models/order.dart';

class DriverRepository {
  static DatabaseReference ref = FirebaseDatabase.instance.ref("driver");
  static Future<void> setOrderToDriver(
      {required String driverId,required String orderId, required Order order}) async {
    await  ref.child(driverId).child("orders").child(orderId)
        .set(order.toJson());
  }
}