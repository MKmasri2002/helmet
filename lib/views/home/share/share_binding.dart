import 'package:get/get.dart';
import 'package:helmet_customer/views/home/share/share_controller.dart';

class ShareBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ShareController());
  }
}
