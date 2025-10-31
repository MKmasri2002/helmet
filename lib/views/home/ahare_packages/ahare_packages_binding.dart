import 'package:get/get.dart';
import 'package:helmet_customer/views/gifts/gifts/gifts_controller.dart';
import 'package:helmet_customer/views/home/ahare_packages/ahare_packages_controller.dart';

class SharePackagesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SharePackagesController());
  }
}
