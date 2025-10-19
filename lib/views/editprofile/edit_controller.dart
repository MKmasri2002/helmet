import 'package:get/get.dart';

class EditController extends GetxController {
  String selectedGender = '';

  @override
  void onInit() {
    super.onInit();
  }

  void changeginder(String s) {
    selectedGender = s;

    update();
  }
}
