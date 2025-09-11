import 'dart:ui';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LanguageController {
  String local = "";
  static void updateLocal(String local) {
    local = local;
    GetStorage().write("lang", local);
    Get.updateLocale(Locale(local));
  }

  static Future<String> getLocal() async {
    String data =
        GetStorage().read("lang") == null || GetStorage().read("lang") == ""
            ? Get.deviceLocale.toString()
            : GetStorage().read("lang").toString();

    return data;
  }

  bool localIsEnglish() {
    if (local.toUpperCase().startsWith("en".toUpperCase())) {
      return true;
    }
    return false;
  }
}
