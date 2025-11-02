import 'package:get/get.dart';
import 'package:helmet_customer/views/gifts/gifts/gifts_controller.dart';
import 'package:helmet_customer/views/ahare_packages/share_package_controller.dart';

class SharePackagesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SharePackagesController());
  }
}
