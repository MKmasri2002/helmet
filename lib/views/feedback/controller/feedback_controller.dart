import 'package:get/get.dart';

class FeedbackController extends GetxController {
  int index = -1;
  bool ButtonEnabled = false;
  List<String> list = [
    "assets/images/star (5).png",
    "assets/images/star (4).png",
    "assets/images/star (3).png",
    "assets/images/star (2).png",
    "assets/images/star (1).png",
  ];
  List<String> list2 = [
    "assets/images/5review-star (1).png",
    "assets/images/4review-star (1).png",
    "assets/images/3review-star (1).png",
    "assets/images/2review-star (1).png",
    "assets/images/1review-star (1).png",
  ];
  List<String> updated = [];
  Map<String, String> price = {
    "assets/images/5real.PNG": "5 ",
    "assets/images/10real.PNG": "10 ",
    "assets/images/15real.PNG": "15 ",
    "assets/images/other.PNG": "اخرى",
  };

  @override
  void onInit() {
    super.onInit();
    updated = List.from(list);
  }

  void changestate() {
    for (int x = 0; x <= 4; x++) {
      updated[x] = x <= index ? list2[x] : list[x];
    }
    update();
  }

  void changebuttonstate() {
    ButtonEnabled = true;
    update();
  }
}
