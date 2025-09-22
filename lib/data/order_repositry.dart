import 'package:firebase_database/firebase_database.dart';
import 'package:helmet_customer/models/car.dart';
import 'package:helmet_customer/models/wash_models/order.dart';
import 'package:helmet_customer/models/wash_models/wash_session.dart';

class OrderRepositry {
  static Future<void> setOrder({required Order order}) async {
    DatabaseReference ref = FirebaseDatabase.instance.ref("orders").push();
    order.id = ref.key;
    await ref.set(order.toJson());
    if (order.sessions.isNotEmpty)
      for (WashSession washSession in order.sessions) {
        DatabaseReference washRef = ref.child("washSessions").push();
        washSession.id = washRef.key;
        await washRef.set(washSession.toJson());
        if(washSession.cars.isNotEmpty)
        for (Car car in washSession.cars) {
          await washRef.child("cars").push().set(car.toJson());
        }
      }
  }
}
