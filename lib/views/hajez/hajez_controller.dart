import 'package:get/get.dart';

class HajezController extends GetxController {
  String currentTab = "all";

  List<Map<String, dynamic>> allPackages = [
    {
      "title": "عرض العودة للمدارس",
      "description": "10 غسالات (داخلي وخارجي) لمدة 4 شهور",
      "price": "299",
      "unit": "30",
      "discount": "36%",
    },
    {
      "title": "عرض الصيف",
      "description": "7 غسالات (داخلي وخارجي) لمدة 3 شهور",
      "price": "269",
      "unit": "38",
      "discount": "36%",
    },
  ];

  List<Map<String, dynamic>> get packages {
    if (currentTab == "my") {
      return [];
    }
    return allPackages;
  }

  void changeTab(String tab) {
    currentTab = tab;
    update();
  }
}
