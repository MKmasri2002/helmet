import 'package:firebase_database/firebase_database.dart';
import 'package:helmet_customer/models/wash_models/wash_data_trip_model.dart';

class OrderRepositry {
  static DatabaseReference ref = FirebaseDatabase.instance.ref("orders").push();

  static Future<String> setOrder({required WashDataTripModel order}) async {
    await ref.set(order.toJson());
    return ref.key!;
  }
}
