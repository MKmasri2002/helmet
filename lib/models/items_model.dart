
// import 'package:get/get.dart';
// import 'package:helmet_customer/utils/controllers/language_controller.dart';

// class ItemsModel {
//   String id = "";
//   String image = "";
//   String itemNameAr = "";
//   String itemNameEn = "";
//   double price=0;
//   ItemsModel();
//   ItemsModel.fromJson(Map<dynamic,dynamic>map){
//     try{ id=map["id"];}catch(e){}
//     try{ image=map["image"];}catch(e){}
//     try{ itemNameAr=map["itemNameAr"];}catch(e){}
//     try{ itemNameEn=map["itemNameEn"];}catch(e){}
//     try{ price=map["price"];}catch(e){}
//   }

//   String getName(){
//     if (Get.find<LanguageController>().localIsEnglish()){
//       return itemNameEn.isEmpty?itemNameAr:itemNameEn;
//     }else {
//       return itemNameAr.isEmpty?itemNameEn:itemNameAr;
//     }
//   }

//   toJson(){
//     return {
//       "id": id,
//       "image": image,
//       "itemNameAr": itemNameAr,
//       "itemNameEn": itemNameEn,
//       "price": price,
//     };
//   }
// }