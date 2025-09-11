import 'package:get/get.dart';
import 'package:helmet_customer/views/add_car/add_car_controller.dart';

class AddCarBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddCarController>(() => AddCarController());
  }
}
