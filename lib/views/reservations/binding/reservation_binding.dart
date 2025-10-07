import 'package:get/get.dart';
import 'package:helmet_customer/views/reservations/controller/reservation_controller.dart';

class ReservationBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<ReservationController>(() => ReservationController());
  }
}
