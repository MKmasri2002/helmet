import 'package:get/get.dart';
import 'package:helmet_customer/views/hajez/hajez_controller.dart';

class HajezBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HajezController());
  }
}
