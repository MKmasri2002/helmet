import 'package:firebase_database/firebase_database.dart';
import 'package:helmet_customer/models/car.dart';
import 'package:helmet_customer/models/wash_models/wash_data_trip_model.dart';
import 'package:helmet_customer/models/wash_models/wash_items.dart';
import 'package:helmet_customer/views/home/home_controller.dart';

class UserRepository {
  static DatabaseReference ref =
      FirebaseDatabase.instance.ref("Users/${userModel.uid}/order");
  ////////////////////////////////<Get User Data>///////////////////////////////////////
  static Future<List<WashDataTripModel>> getUserOrders() async {
    DataSnapshot snapshot = await ref.get();

    if (snapshot.exists) {
      try {
        final Map<String, dynamic> data =
            Map<String, dynamic>.from(snapshot.value as Map);
        final List<WashDataTripModel> orders =
            await Future.wait(data.entries.map((entry) async {
          final order = WashDataTripModel.fromJson(
              Map<String, dynamic>.from(entry.value));
          order.cars = await getCarsForOrder(orderId: order.id!);
          return order;
        }).toList());
        print(orders.length);
        if (orders.isNotEmpty) 
        print(orders[0].cars.length);
        return orders;
      } catch (e) {}
    }

    return [];
  }

  static Future<List<Car>> getCarsForOrder({required String orderId}) async {
    DataSnapshot snapshot = await ref.child(orderId).child('cars').get();

    if (snapshot.exists) {
      try {
        final Map<String, dynamic> data =
            Map<String, dynamic>.from(snapshot.value as Map);
        final List<Car> cars = data.entries.map((entry) {
          final car = Car.fromJson(Map<String, dynamic>.from(entry.value));

          return car;
        }).toList();
        return cars;
      } catch (e) {}
    }

    return [];
  }

  ////////////////////////////////<Set User Data>///////////////////////////////////////
  static Future<void> setOrderToUser(
      {required String orderId, required WashDataTripModel order}) async {
    await ref.child(orderId).set(order.toJson());
  }

  static Future<void> setItemsToOrder(
      {required orderId, required List<WashItemsModel> items}) async {
    for (WashItemsModel item in items) {
      await ref
          .child(orderId)
          .child('items')
          .child(item.id!)
          .set(item.toJson());
    }
  }

  static Future<void> setCarsToOrder(
      {required orderId, required List<Car> cars}) async {
    for (Car car in cars) {
      await ref.child(orderId).child('cars').push().set(car.toJson());
    }
  }
}
