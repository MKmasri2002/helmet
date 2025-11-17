import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:helmet_customer/models/subscribe.dart';
import 'package:helmet_customer/models/user_model.dart';
import 'package:helmet_customer/utils/global/global.dart';

class SharePackagesController extends GetxController {
  final phoneController = TextEditingController();
  TextEditingController numberOfWashes = TextEditingController();
  final String? packageId;

  SharePackagesController(this.packageId);

  @override
  void onInit() {
    // packageId = Get.arguments['packageId'];
    numberOfWashes.text = "0";
    super.onInit();
  }

  /// زيادة العدد بواحد
  void incrementWashes() {
    int current = int.tryParse(numberOfWashes.text) ?? 0;
    if (current < 10) {
      current++;
      numberOfWashes.text = current.toString();
      update(); // لتحديث الـ UI إذا كان يستخدم GetBuilder
    }
  }

  /// نقصان العدد بواحد
  void decrementWashes() {
    int current = int.tryParse(numberOfWashes.text) ?? 0;
    if (current > 0) {
      current--;
      numberOfWashes.text = current.toString();
      update(); // لتحديث الـ UI
    }
  }

  // تابع بسيط لتجريب القيم
  Future<Map<String, dynamic>> sendPackage() async {
    final phone = phoneController.text.trim();
    final washes = int.tryParse(numberOfWashes.text.trim()) ?? 0;

    if (phone.isEmpty || washes <= 0) {
      return {
        'success': false,
        'message': 'يجب تعبئة جميع الحقول',
      };
    }

    final userExist = await isUserExsist(phone);
    if (!userExist) {
      return {
        'success': false,
        'message': 'لا يوجد مستخدم مسجل بالتطبيق للرقم الذي ادخلته',
      };
    }

    final differnt = isNumberGiftLessOrEqualeToRemain(packageId!, washes);
    if (!differnt) {
      return {
        'success': false,
        'message': 'لا يمكنك ارسال عدد باقات أكبر من المتوفر لك',
      };
    }

    await addPackage(phone, washes);

    return {
      'success': true,
      'message': 'تمت مشاركة ${washes ?? ""} من غسلاتك مع\n${phone ??''}',
    };
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
      final index = subscriptions.indexWhere((sub) => sub.id == packageId);
      final doc = FirebaseFirestore.instance.collection("subscribe").doc();

      Subscribe s = new Subscribe(
        count: subscriptions[index].count,
        descriptionAr: subscriptions[index].descriptionAr,
        descriptionEn: subscriptions[index].descriptionEn,
        endDate: subscriptions[index].endDate,
        isPaid: subscriptions[index].isPaid,
        type: subscriptions[index].type,
        price: subscriptions[index].price,
        remain: washes,
        titleAr: subscriptions[index].titleAr,
        titleEn: subscriptions[index].titleEn,
        id: doc.id,
        userId: user.uid!
      );

      await doc.set(s.toJson());

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
