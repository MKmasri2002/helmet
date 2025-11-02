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

      final userSnap = await FirebaseFirestore.instance
          .collection('user')
          .where('phone', isEqualTo: phone)
          .limit(1)
          .get();

      if (userSnap.docs.isEmpty) {
        Get.snackbar("خطأ", "لم يتم العثور على مستخدم بهذا الرقم");
        return;
      }

     // final receiverId = userSnap.docs.first.id;

      final docSnap = await FirebaseFirestore.instance
          .collection('subscribe')
          .doc(packageid)
          .get();

      final remain = docSnap.data()?["remain"] ?? 0;
      final entered = int.tryParse(numberofwashes.text.trim()) ?? 0;

      if (entered > remain) {
        Get.snackbar("خطأ", "عدد الغسلات المدخلة أكبر من المتبقية ($remain)");
        return;
      }

      // TODO: تنفيذ عملية المشاركة الفعلية هنا

      Get.snackbar("تم الإرسال", "تم إرسال البكج بنجاح 🎁");
    } catch (e) {
      Get.snackbar("خطأ", "حدث خطأ أثناء الإرسال: $e");
    }
  }
}
