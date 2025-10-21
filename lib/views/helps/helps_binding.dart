import 'package:get/get.dart';
import 'package:helmet_customer/views/helps/helps_controller.dart';

class HelpsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HelpsController());
  }
}
