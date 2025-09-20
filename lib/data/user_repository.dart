import 'package:firebase_database/firebase_database.dart';
import 'package:helmet_customer/models/car.dart';
import 'package:helmet_customer/models/payment.dart';
import 'package:helmet_customer/models/wash_models/order.dart';
import 'package:helmet_customer/models/wash_models/wash_items.dart';
import 'package:helmet_customer/views/home/home_controller.dart';

class UserRepository {
  static DatabaseReference ref = FirebaseDatabase.instance.ref("orders");
  ////////////////////////////////<Get User Data>///////////////////////////////////////
  static Future<List<Order>> getUserOrders(
      {required String userId}) async {
    DataSnapshot snapshot =
        await ref.orderByChild("userId").equalTo(userId).get();

    if (snapshot.exists) {
      try {
        final Map<String, dynamic> data =
            Map<String, dynamic>.from(snapshot.value as Map);

        final List<Order> orders =
            await Future.wait(data.entries.map((entry) async {
          final orderData = Map<String, dynamic>.from(entry.value);

          final order = Order.fromJson(orderData);

          final carsData = Map<String, dynamic>.from(orderData['cars'] ?? {});

          order.cars = carsData.entries.map((carEntry) {
            return Car.fromJson(Map<String, dynamic>.from(carEntry.value));
          }).toList();
          order.payment = orderData['payment'] != null
              ? Payment.fromJson(Map<String, dynamic>.from(orderData['payment']))
              : null;
          print(order.payment!.status!);
          return order;
        }).toList());

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
  // static Future<void> setOrderToUser(
  //     {required String orderId, required WashDataTripModel order}) async {
  //   await ref.child(orderId).set(order.toJson());
  // }

  // static Future<void> setItemsToOrder(
  //     {required orderId, required List<WashItemsModel> items}) async {
  //   for (WashItemsModel item in items) {
  //     await ref
  //         .child(orderId)
  //         .child('items')
  //         .child(item.id!)
  //         .set(item.toJson());
  //   }
  // }

  // static Future<void> setCarsToOrder(
  //     {required orderId, required List<Car> cars}) async {
  //   for (Car car in cars) {
  //     await ref.child(orderId).child('cars').push().set(car.toJson());
  //   }
  // }
}
