import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:helmet_customer/models/dirver_model.dart';
import 'package:helmet_customer/models/wash_models/order.dart' as model;

class DriverRepository {
  static FirebaseFirestore reference =
      FirebaseFirestore.instance;
  
  static Future<List<DriverModel>> getAllDrivers({required String userId,required List<String> areas_id }) async {
    try {
      final querySnapshot = await reference.collection('driver').where('area_id',whereIn: areas_id).get();

      if (querySnapshot.docs.isNotEmpty) {
        final List<DriverModel> drivers = querySnapshot.docs.map((doc) {
          final data = doc.data() as Map<String, dynamic>;
          return DriverModel.fromJson(data);
        }).toList();
        return drivers;
      }
    } catch (e) {
      return [];
    }

    return [];
  }
  //////////////////////////////////////
  static DatabaseReference ref = FirebaseDatabase.instance.ref("driver");
  static Future<void> setOrderToDriver(
      {required String driverId,required String orderId, required model.Order order}) async {
    await  ref.child(driverId).child("orders").child(orderId)
        .set(order.toJson());
  }
}