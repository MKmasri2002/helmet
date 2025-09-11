
import 'package:get/get.dart';
import 'package:helmet_customer/utils/controllers/language_controller.dart';

class CarSubTypeModel {
  String id = "";
  String arName = "";
  String enName = "";
  String image="";
  String carTypeId ="";


  CarSubTypeModel.fromJson(Map<dynamic,dynamic> map){
    try{ id=map["id"];}catch(e){}
    try{ arName=map["ar_name"];}catch(e){}
    try{ enName=map["en_name"];}catch(e){}
    try{ image=map["image"];}catch(e){}
    try{ carTypeId=map["carTypeId"];}catch(e){}
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
      "carTypeId": carTypeId,
    };
  }
}