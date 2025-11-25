import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:helmet_customer/models/dirver_model.dart';

class DriverRepository {
  static FirebaseFirestore reference = FirebaseFirestore.instance;

  /// Get all drivers in specified areas
  /// Optionally filter by active/online status
  static Future<List<DriverModel>> getAllDrivers({
    required String userId,
    required List<String> areas_id,
    bool? activeOnly,
    bool? onlineOnly,
  }) async {
    try {
      if (areas_id.isEmpty) {
        return [];
      }

      Query query = reference.collection('driver').where('areaId', whereIn: areas_id);

      // Add optional filters
      if (activeOnly == true) {
        query = query.where('isActive', isEqualTo: true);
      }
      if (onlineOnly == true) {
        query = query.where('isOnline', isEqualTo: true);
      }

      final querySnapshot = await query.get();

      if (querySnapshot.docs.isNotEmpty) {
        final List<DriverModel> drivers = querySnapshot.docs.map((doc) {
          final data = doc.data() as Map<String, dynamic>;
          data['id'] = doc.id; // Add document ID to driver data
          return DriverModel.fromJson(data);
        }).toList();
        return drivers;
      }
    } catch (e) {
      // Consider logging error for debugging
      return [];
    }

    return [];
  }

  /// Get a specific driver by ID
  static Future<DriverModel?> getDriverById(String driverId) async {
    try {
      final doc = await reference.collection('driver').doc(driverId).get();

      if (doc.exists) {
        final data = doc.data() as Map<String, dynamic>;
        data['id'] = doc.id;
        return DriverModel.fromJson(data);
      }
    } catch (e) {
      return null;
    }

    return null;
  }

  /// Get top rated drivers in specified areas
  static Future<List<DriverModel>> getTopRatedDrivers({
    required List<String> areas_id,
    int limit = 10,
  }) async {
    try {
      if (areas_id.isEmpty) {
        return [];
      }

      final querySnapshot = await reference
          .collection('driver')
          .where('areaId', whereIn: areas_id)
          .where('isActive', isEqualTo: true)
          .where('status', isEqualTo: 'Active')
          .orderBy('rating', descending: true)
          .limit(limit)
          .get();

      if (querySnapshot.docs.isNotEmpty) {
        final List<DriverModel> drivers = querySnapshot.docs.map((doc) {
          final data = doc.data();
          data['id'] = doc.id;
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
  // static DatabaseReference ref = FirebaseDatabase.instance.ref("driver");
  // static Future<void> setOrderToDriver(
  //     {required String driverId,required String orderId, required model.Order order}) async {
  //   await  ref.child(driverId).child("orders").child(orderId)
  //       .set(order.toJson());
  // }
}