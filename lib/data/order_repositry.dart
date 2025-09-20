import 'package:firebase_database/firebase_database.dart';
import 'package:helmet_customer/models/car.dart';
import 'package:helmet_customer/models/wash_models/order.dart';

class OrderRepositry {
  static DatabaseReference ref = FirebaseDatabase.instance.ref("orders").push();

  static Future<void> setOrder(
      {required Order order}) async {
    await ref.set(order.toJson());
    for (Car car in order.cars) {
      await ref.child("cars").push().set(car.toJson());
    }
      await ref.child("payment").set(order.payment!.toJson());  
  }

}
