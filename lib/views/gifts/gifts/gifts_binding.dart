import 'package:get/get.dart';
import 'package:helmet_customer/views/gifts/gifts/gifts_controller.dart';

class giftsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => giftsController());
  }
}
