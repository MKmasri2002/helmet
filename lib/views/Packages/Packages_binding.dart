import 'package:get/get.dart';
import 'package:helmet_customer/views/Packages/Packages_controller.dart';

class PackagesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PackagesController());
  }
}
