
import 'package:get/get.dart';

import '../utils/controllers/language_controller.dart';

class NotificationModel {

  String arDesc= "";
  String enDesc= "";
  String notiId= "";
  int date= 0;
  String toPage= "";
  String arTitle= "";
  String enTitle= "";
  String uid= "";
  String image= "";
  String type = "";   // 1- steps 2- get coins 3- invites 4-
  bool isRead = false;

  NotificationModel.fromJson(Map<dynamic,dynamic>map){
    try{ arDesc=map["ar_desc"];}catch(e){}
    try{ enDesc=map["en_desc"];}catch(e){}
    try{ notiId=map["notiId"];}catch(e){}
    try{ date=map["date"];}catch(e){}
    try{ toPage=map["toPage"];}catch(e){}
    try{ arTitle=map["ar_title"];}catch(e){}
    try{ enTitle=map["en_title"];}catch(e){}
    try{ uid=map["uid"];}catch(e){}
    try{ image=map["image"];}catch(e){}
    try{ type=map["type"];}catch(e){}
    try{ type=map["isRead"];}catch(e){}
  }

  String getTitle(){
    if(Get.find<LanguageController>().local.toLowerCase().startsWith("en")){
      return enTitle;
    }
    return arTitle;
  }


  String getDescription(){
    if(Get.find<LanguageController>().local.toLowerCase().startsWith("en")){
      return enDesc;
    }
    return arDesc;
  }


  toJson(){
    return {
      "ar_desc": arDesc,
      "en_desc": enDesc,
      "notiId": notiId,
      "date": date,
      "toPage": toPage,
      "ar_title": arTitle,
      "en_title": enTitle,
      "uid": uid,
      "image": image,
      "type": type,
      "isRead": isRead,
    };
  }
}