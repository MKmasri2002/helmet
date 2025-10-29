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

  static Future<List<Order>> getOrdersInArea({required String areaId}) async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    QuerySnapshot query = await firestore
        .collection('order')
        .where('areaId', isEqualTo: areaId)
        .where('status', isNotEqualTo: 'done')
        .get();
    if (query.docs.isNotEmpty) {
      final List<Order> orders = query.docs.map((doc) {
        final data = doc.data() as Map<String, dynamic>;
        final order = Order.fromJson(data);
        return order;
      }).toList();
      return orders;
    }
    return [];
  }
}
