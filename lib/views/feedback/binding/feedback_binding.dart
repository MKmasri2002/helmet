import 'package:get/get.dart';
import 'package:helmet_customer/views/feedback/controller/feedback_controller.dart';

class FeedbackBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<FeedbackController>(() => FeedbackController());
  }
}