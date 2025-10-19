import 'package:get/get.dart';
import 'package:helmet_customer/views/editprofile/edit_controller.dart';

class EditBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => EditController());
  }
}
