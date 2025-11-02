import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:helmet_customer/models/subscribe.dart';
import 'package:helmet_customer/models/user_model.dart';
import 'package:helmet_customer/utils/global/global.dart';

class SharePackagesController extends GetxController {
  final phoneController = TextEditingController();
  final numberOfWashes = TextEditingController();
  String? packageId;

  @override
  void onInit() {
    packageId = Get.arguments['packageId'];
    super.onInit();
  }

  // تابع بسيط لتجريب القيم
  Future<void> sendPackage() async {
    final phone = phoneController.text.trim();
    final washes = int.tryParse(numberOfWashes.text.trim()) ?? -1;

    if (phone.isEmpty || washes <= -1) {
      Get.snackbar('خطأ', 'يرجى تعبئة جميع الحقول');
      return;
    }
    final userExist = await isUserExsist(phone);
    if (!userExist) {
      Get.snackbar("خطأ", "لا يوجد مستخم مسجل بالتطبيق للرقم الذي ادخلته");
      return;
    }
    final differnt = isNumberGiftLessOrEqualeToRemain(packageId!, washes);
    if (!differnt) {
      Get.snackbar("خطأ", "لا يمكنك ارسال عدد باقات اكبر من المتوفر لك");
      return;
    }
    addPackage(phone, washes);

    Get.snackbar("نجاح", "تم التحديث بنجاح");
    return;

    // هون تقدر تكمل المنطق (إرسال البيانات للسيرفر أو الفايرستور مثلاً)
  }

  Future<bool> addPackage(String phone, int washes) async {
    final snap = await FirebaseFirestore.instance
        .collection('user')
        .where('phone', isEqualTo: phone)
        .limit(1)
        .get();
    if (snap.docs.isNotEmpty) {
      final user = UserModel.fromJson(snap.docs.first.data());
      final id = user.uid!;
      Subscribe s = subscriptions.firstWhere((test) => test.id == packageId);
      s.remain = washes;
      final doc = FirebaseFirestore.instance.collection("subscribe").doc();
      s.id = doc.id;
      await doc.set(s.toJson());
      final index = subscriptions.indexWhere((sub) => sub.id == packageId);
      if (index != -1) {
        subscriptions[index].remain = (subscriptions[index].remain! - washes);
        await FirebaseFirestore.instance
            .collection('subscribe')
            .doc(subscriptions[index].id)
            .update({
          "remain": subscriptions[index].remain, // القيمة الجديدة
        });
        // 🔹 غيّرها للقيمة الجديدة
      }
    }
    return false;
  }

  Future<bool> isUserExsist(String phone) async {
    final snap = await FirebaseFirestore.instance
        .collection('user')
        .where('phone', isEqualTo: phone)
        .get();
    if (snap.docs.isNotEmpty) return true;
    return false;
  }

  bool isNumberGiftLessOrEqualeToRemain(String id, int numberOfPackage) {
    final num = subscriptions.firstWhere((test) => test.id == id).remain ?? 0;
    if (num >= numberOfPackage) return true;
    return false;
  }

  @override
  void onClose() {
    phoneController.dispose();
    numberOfWashes.dispose();
    super.onClose();
  }
}
