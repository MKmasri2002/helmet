import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class giftsController extends GetxController {
  TextEditingController phoneController = TextEditingController();
  TextEditingController option1Controller = TextEditingController();
  TextEditingController option2Controller = TextEditingController();
  TextEditingController option3Controller = TextEditingController();
  int selected = 0;

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

  void select(int value) {
    selected = value;
    update();
  }

  /// 🔹 إرسال هدية وتخزينها في Firestore
  Future<void> sendGift({required String value}) async {
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
      await FirebaseFirestore.instance.collection('gifts').add({
        "senderId": currentUser.uid,
        "receiverId": receiverId,
        "value": value,
        "date": Timestamp.now(),
      });

      Get.snackbar("تم الإرسال", "تم إرسال الهدية بنجاح 🎁");
    } catch (e) {
      Get.snackbar("خطأ", "حدث خطأ أثناء الإرسال: $e");
    }
  }
  Future<List<Map<String, dynamic>>> getReceivedGifts() async {
  try {
    final currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser == null) return [];

    final query = await FirebaseFirestore.instance
        .collection("gifts")
        .where("senderId", isEqualTo: currentUser.uid)
        .get();

    return query.docs.map((doc) => doc.data()).toList();
  } catch (e) {
    Get.snackbar("خطأ", "تعذر جلب الهدايا: $e");
    return [];
  }
}
 Stream<QuerySnapshot> getgiftsStream() {
    String uid = FirebaseAuth.instance.currentUser!.uid;
    return FirebaseFirestore.instance
        .collection('gifts')
        .where("receiverId", isEqualTo: uid)
        .snapshots();
  }

}
