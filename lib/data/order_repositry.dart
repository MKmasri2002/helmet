import 'package:cloud_firestore/cloud_firestore.dart' hide Order;
import 'package:firebase_database/firebase_database.dart';
import 'package:helmet_customer/models/car.dart';
import 'package:helmet_customer/models/wash_models/order.dart';

class OrderRepositry {
 
   
  static FirebaseFirestore firestore = FirebaseFirestore.instance;

  static Future<void> addOrder({required Order order}) async {
    DocumentReference ref = firestore.collection("order").doc();

    order.id = ref.id;
    await ref.set(order.toJson());
  }
}
