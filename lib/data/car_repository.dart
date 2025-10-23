import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:helmet_customer/models/car.dart';

class CarRepository {
  static FirebaseFirestore reference = FirebaseFirestore.instance;
  static Future<List<Car>> getAllCars({required String userId}) async {
    try {
      final querySnapshot = await reference
          .collection('car')
          .where('user_id', isEqualTo: userId)
          .get();

      if (querySnapshot.docs.isNotEmpty) {
        final List<Car> cars = querySnapshot.docs.map((doc) {
          final data = doc.data() as Map<String, dynamic>;
          return Car.fromJson(data);
        }).toList();
        return cars;
      }
    } catch (e) {
      return [];
    }

    return [];
  }
  static Future<void> addCar({required Car car}) async {
    await reference.collection('car').add(car.toJson());
  }
}
