import 'package:cloud_firestore/cloud_firestore.dart' hide Order;
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:helmet_customer/models/wash_models/order.dart';


class OrderStatusController extends GetxController {
  GoogleMapController? mapController;
  Order? currentOrder;
  
 

  @override
  void onInit() async {
    currentOrder = Get.arguments['order'];
    super.onInit();
  }
  Future<void> updateOrderStatus(String status) async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    await firestore.collection('order').doc(currentOrder!.id).update({
      'status': status,
    });

    update(); 
  }
}
