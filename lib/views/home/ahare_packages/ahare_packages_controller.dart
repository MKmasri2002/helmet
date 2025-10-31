import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SharePackagesController extends GetxController {
  TextEditingController phoneController = TextEditingController();
  TextEditingController numberofwashes = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    phoneController.addListener(() {
      update();
    });
  }

  void phone(String c) {
    phoneController.text = c;
    update();
  }

  Future<void> checkphone({required String packageid}) async {
    try {
      final currentUser = FirebaseAuth.instance.currentUser;
      if (currentUser == null) {
        Get.snackbar("خطأ", "المستخدم الحالي غير مسجل الدخول");
        return;
      }

      final phone = phoneController.text.trim();
      if (phone.isEmpty) {
        Get.snackbar("خطأ", "الرجاء إدخال رقم هاتف المستقبل");
        return;
      }

      // 🔍 البحث عن المستخدم المستقبل بناءً على رقم الهاتف
      final userSnap = await FirebaseFirestore.instance
          .collection('user')
          .where('phone', isEqualTo: phone)
          .limit(1)
          .get();

      if (userSnap.docs.isEmpty) {
        Get.snackbar("خطأ", "لم يتم العثور على مستخدم بهذا الرقم");
        return;
      }

      final receiverId = userSnap.docs.first.id;

      // 📝 إضافة الهدية إلى قاعدة البيانات
      // await FirebaseFirestore.instance.collection('gifts').add({
      //   "senderId": currentUser.uid,
      //   "receiverId": receiverId,
      //   "value": value,
      //   "date": Timestamp.now(),
      // });

      final docSnap = await FirebaseFirestore.instance
          .collection('subscribe')
          .doc(packageid)
          .get();
      if (docSnap.data()!["remain"] <= numberofwashes.text) {
Get.snackbar("خطأ","عدد الغسلات المتبقية ${docSnap.data()!["remain"]}");
      }

      Get.snackbar("تم الإرسال", "تم إرسال البكج بنجاح 🎁");
    } catch (e) {
      Get.snackbar("خطأ", "حدث خطأ أثناء الإرسال: $e");
    }
  }
}
