import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:helmet_customer/models/subscribe.dart';

class SubscribeRepositry {
  static FirebaseFirestore firestore = FirebaseFirestore.instance;

  static Future<void> addSubscription({required Subscribe subscribe}) async {
    final snap = firestore.collection('subscribe').doc();
    subscribe.id = snap.id;
    subscribe.isPaid = true;
    await snap.set(subscribe.toJson());
  }
}
