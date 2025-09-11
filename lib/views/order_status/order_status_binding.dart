import 'package:get/get.dart';
import 'package:helmet_customer/views/order_status/order_status_controller.dart';

class OrderStatusBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OrderStatusController>(
      () => OrderStatusController(),
    );
  }
}
