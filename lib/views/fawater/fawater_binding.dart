import 'package:get/get.dart';
import 'package:helmet_customer/views/fawater/fawater_controller.dart';

class FawaterBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => FawaterController());
  }
}
