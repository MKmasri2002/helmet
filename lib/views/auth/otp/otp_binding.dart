import 'package:get/get.dart';
import 'package:helmet_customer/views/auth/otp/otp_controller.dart';

class OtpBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OtpController>(() => OtpController());
    // Get.create<OtpController>(() => OtpController());
  }
}
