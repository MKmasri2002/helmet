import 'package:firebase_database/firebase_database.dart';
import 'package:helmet_customer/models/car.dart';
import 'package:helmet_customer/models/wash_models/order.dart';
import 'package:helmet_customer/models/wash_models/wash_session.dart';

class UserRepository {
  static DatabaseReference ref = FirebaseDatabase.instance.ref("orders");
  ////////////////////////////////<Get User Data>///////////////////////////////////////
  static Future<List<Order>> getUserOrders({required String userId}) async {
    DataSnapshot snapshot =
        await ref.orderByChild("userId").equalTo(userId).get();

    if (snapshot.exists) {
      try {
        final Map<String, dynamic> data =
            Map<String, dynamic>.from(snapshot.value as Map);

        final List<Order> orders = (data.entries.map((entry) {
          final orderData = Map<String, dynamic>.from(entry.value);

          final order = Order.fromJson(orderData);

          final washSessionData =
              Map<String, dynamic>.from(orderData['washSessions'] ?? {});

          order.sessions = washSessionData.entries.map((sessionEntry) {
            final sessionData = Map<String, dynamic>.from(sessionEntry.value);
            final session = WashSession.fromJson(sessionData);
            final carsData =
                Map<String, dynamic>.from(sessionData['cars'] ?? {});
            session.cars = carsData.entries.map((carEntry) {
              return Car.fromJson(Map<String, dynamic>.from(carEntry.value));
            }).toList();
            return session;
          }).toList();

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

// مثال: تعديل السعر والعدد للاشتراك الشهري
  static Future<void> updateSubscriptionOrder({
    required String orderId,
    required int newWashCount,
    required WashSession newSession,
    required List<Car> cars, // الجلسة الجديدة
  }) async {
    final DatabaseReference ref = FirebaseDatabase.instance.ref("orders");

    Map<String, dynamic> updateData = {};

      updateData["remain"] = newWashCount;
    
    

    await ref.child(orderId).update(<String,dynamic>{"remain": newWashCount});
    DatabaseReference sessionRef =
        ref.child(orderId).child('washSessions').push();
    newSession.id = sessionRef.key;
    await sessionRef.set(newSession.toJson());
     for(Car car in cars){
    DatabaseReference carRef =sessionRef.child('cars').push();
    car.id = carRef.key;
    await carRef.set(car.toJson());
     
     }
  }
}
