import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:helmet_customer/models/subscribe.dart';
import 'package:helmet_customer/utils/global/global.dart';
import 'package:helmet_customer/views/cart/cart_binding.dart';
import 'package:helmet_customer/views/cart/cart_screen.dart';
import 'package:helmet_customer/views/home/home_controller.dart';

class giftsController extends GetxController {
  TextEditingController phoneController = TextEditingController();
  TextEditingController option1Controller = TextEditingController();
  TextEditingController option2Controller = TextEditingController();
  TextEditingController option3Controller = TextEditingController();
  int selected = 0;
  String? title;
  String? name;
  double? price;

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

  void chooseCard(
      {required String title, required String name, required double price}) {
    this.name = name;
    this.title = title;
    this.price = price;

    Get.snackbar("نجاح", "تم اختيار الهدية");
  }

  /// 🔹 إرسال هدية وتخزينها في Firestore
  Future<void> sendGift() async {
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

      //  البحث عن المستخدم المستقبل بناءً على رقم الهاتف
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

      //  إضافة الهدية إلى قاعدة البيانات
      if (name != null) {
        await FirebaseFirestore.instance.collection('gifts').add({
          "senderId": currentUser.uid,
          "receiverId": receiverId,
          "title": title,
          "price": price,
          "date": Timestamp.now(),
        });
        if (name == "اشتراك شهري") {
          subscribe = Subscribe(
            userId: receiverId,
            titleAr: "اشتراك شهري",
            titleEn: "Monthly Subscription",
            price: 499.99,
            count: "10",
            remain: 10,
            type: 'package',
            isPaid: true,
          );
          Get.to(
            () => CartScreen(),
            binding: CartBinding(),
            arguments: {'product': subscribe},
          );
          Get.snackbar("تم الإرسال", "تم إرسال الهدية بنجاح ");
        } else {
          Get.snackbar("خطأ", "لم يتم اختيار الهديه");
          return;
        }
      }
    } catch (e) {
      Get.snackbar("خطأ", "حدث خطأ أثناء الإرسال: $e");
    }
  }

//ملهمش داعي بس عشان الصفحه الاولى متخربش
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
        .where("senderId", isEqualTo: uid)
        .snapshots();
  }

//ستريم للكاردز
  Stream<QuerySnapshot> getgiftcardStream() {
    return FirebaseFirestore.instance.collection('giftcard').snapshots();
  }
}
