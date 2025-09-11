
import 'package:get/get.dart';
import 'package:helmet_customer/utils/controllers/language_controller.dart';

class ResponseModel{
  String responseCode = "" ;
  String arMessage = "";
  String enMessage = "";
  bool state = false ;
  Map<dynamic,dynamic> otherData = {};

  ResponseModel();

  String getResponseMessage(){
    if(Get.find<LanguageController>().local.toUpperCase().toLowerCase().startsWith("ar")){
      return arMessage;
    }

    return enMessage;
  }
}