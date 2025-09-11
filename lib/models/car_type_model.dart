
import 'package:get/get.dart';

import '../utils/controllers/language_controller.dart';

class CarTypeModel {
  String id = "";
  String arName = "";
  String enName = "";
  String image="";

  CarTypeModel.fromJson(Map<dynamic,dynamic> map){
    try{ id=map["id"];}catch(e){}
    try{ arName=map["ar_name"];}catch(e){}
    try{ enName=map["en_name"];}catch(e){}
    try{ image=map["image"];}catch(e){}
  }
  String getName(){
    return Get.find<LanguageController>().localIsEnglish()?enName:arName;
  }
  toJson(){
    return {
      "id": id,
      "ar_name": arName,
      "en_name": enName,
      "image": image,
    };
  }
}