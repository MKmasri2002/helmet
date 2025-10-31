import 'package:cloud_firestore/cloud_firestore.dart' hide Order;
import 'package:firebase_database/firebase_database.dart';
import 'package:helmet_customer/models/car.dart';
import 'package:helmet_customer/models/subscribe.dart';
import 'package:helmet_customer/models/wash_models/order.dart';

class OrderRepositry {
  static FirebaseFirestore firestore = FirebaseFirestore.instance;

  static Future<void> addOrder({required OrderModel order}) async {
    DocumentReference ref = firestore.collection("order").doc();

    order.id = ref.id;
    await ref.set(order.toJson());
  }

  static Future<List<OrderModel>> getOrdersInArea({required String areaId}) async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    QuerySnapshot query = await firestore
        .collection('order')
        .where('areaId', isEqualTo: areaId)
        .where('status', isNotEqualTo: 'done')
        .get();
    if (query.docs.isNotEmpty) {
      final List<OrderModel> orders = query.docs.map((doc) {
        final data = doc.data() as Map<String, dynamic>;
        final order = OrderModel.fromJson(data);
        return order;
      }).toList();
      return orders;
    }
    return [];
  }
  static Future<List<Subscribe>> getUserSubscriptions({required String userId}) async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    QuerySnapshot query = await firestore
        .collection('subscribe')
        .where('user_id', isEqualTo: userId)
        .where('remain', isGreaterThan: 0)
        .get();
    if (query.docs.isNotEmpty) {
      final List<Subscribe> subscriptions = query.docs.map((doc) {
        final data = doc.data() as Map<String, dynamic>;
        final subscribe = Subscribe.fromJson(data);
        return subscribe;
      }).toList();
      return subscriptions;
    }
    return [];
  }
}
