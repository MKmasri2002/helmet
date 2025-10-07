import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:helmet_customer/data/user_repository.dart';
import 'package:helmet_customer/models/wash_models/order.dart';
import 'package:helmet_customer/models/wash_models/wash_items.dart';
import 'package:helmet_customer/models/wash_models/wash_session.dart';
import 'package:helmet_customer/utils/tools/tools.dart';
import 'package:helmet_customer/views/home/home_controller.dart';

class OrderStatusController extends GetxController {
  GoogleMapController? mapController;
  Order washDataTripModel = Order();
  List<WashItemsModel> washItems = [];
  String userAddress = "";
  List<WashItemsModel> washItemsAfterFiltering = [];
  String argument = '';
  WashSession? currentSession;
  String lastSessionStatus = 'pending'; // observable لتحديث الـ UI

  late DatabaseReference orderRef;
  // Define your variables and methods here

  int updateOrderStatus(String status) {
    if (status.isEmpty) {
      return 0; // Return an error code
    }
    if (status == "completed") {
      // Perform actions for completed order
      return 3;
    }

    if (status == "in_progress") {
      // Perform actions for in-progress order
      return 2;
    }
    if (status == "active") {
      // Perform actions for active order
      return 1;
    }
    if (status == "pending") {
      // Perform actions for pending order
      return 0;
    }
    if (status == "cancelled") {
      // Perform actions for cancelled order
      return -1;
    }
    return 1; // Return a status code
  }

  @override
  void onInit() async {
    washDataTripModel = Get.arguments as Order;
    currentSession = washDataTripModel.sessions
                        .firstWhereOrNull(
                            (session) => session.status != "done");
    userAddressMethod();
    super.onInit();

    orderRef = FirebaseDatabase.instance.ref("orders/${washDataTripModel.id}");
    _listenToSessionStatus(currentSession?.id ?? "");
  }

 void _listenToSessionStatus(String sessionId) {
  orderRef.child("washSessions/$sessionId/status").onValue.listen((event) async {
    if (!event.snapshot.exists) return;

    final newStatus = event.snapshot.value as String;

    if (lastSessionStatus != newStatus) {
      lastSessionStatus = newStatus;

      // حدث الجلسة جوّا الموديل اللي عندك
      final idx = washDataTripModel.sessions.indexWhere((s) => s.id == sessionId);
      if (idx != -1) {
        washDataTripModel.sessions[idx].status = newStatus;
      }

      userOrder =
          await UserRepository.getUserOrders(userId: userModel.uid!);

      update();
    }
  });
}


  void userAddressMethod() async {
    userAddress = await appTools.getAddressFromLatLng(
      userModel.Addresses[0].latitude ?? 0,
      userModel.Addresses[0].longitude ?? 0,
    );
    update();
  }
}
