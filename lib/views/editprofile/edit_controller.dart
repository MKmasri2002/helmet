import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:helmet_customer/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class EditController extends GetxController {
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final birthDateController = TextEditingController();
  final emailController = TextEditingController(); // ✨ جديد
  final phoneController = TextEditingController();

  String selectedGender = '';
  UserModel user = UserModel();

  @override
  void onInit() {
    super.onInit();
    loadUserData();
    phoneController.addListener(() {
      update();
    });
  }

  

  /// 🟢 جلب بيانات المستخدم الحالي من Firestore
  Future<void> loadUserData() async {
    try {
      User? currentUser = FirebaseAuth.instance.currentUser;

      if (currentUser == null) return;

      var doc = await FirebaseFirestore.instance
          .collection('user')
          .doc(currentUser.uid)
          .get();

      if (doc.exists) {
        user = UserModel.fromJson(doc.data()!);

        firstNameController.text = user.name?.split(' ').first ?? '';
        lastNameController.text =
            user.name?.split(' ').length == 2 ? user.name!.split(' ').last : '';
        birthDateController.text = user.birthdate ?? '';
        emailController.text = user.email ?? '';
        selectedGender = user.gender ?? '';
        emailController.text = user.email ?? '';
        phoneController.text = user.phone ?? '';
        update();
      }
    } catch (e) {
      Get.snackbar("خطأ", "حدث خطأ أثناء جلب بيانات المستخدم: $e");
    }
  }

  /// 🔵 تغيير الجنس
  void changeGender(String gender) {
    selectedGender = gender;
    update();
  }

  /// 🟣 تحديث بيانات المستخدم العادية
  Future<void> updateUser() async {
    try {
      User? currentUser = FirebaseAuth.instance.currentUser;
      if (currentUser == null) return;

      user.name = "${firstNameController.text} ${lastNameController.text}";
      user.gender = selectedGender;
      user.birthdate = birthDateController.text;

      await FirebaseFirestore.instance
          .collection('user')
          .doc(currentUser.uid)
          .update(user.toJson());

      Get.snackbar('تم بنجاح', 'تم تحديث البيانات بنجاح');
    } catch (e) {
      Get.snackbar('خطأ', 'حدث خطأ أثناء حفظ التغييرات: $e');
    }
  }

  /// ✳️ التحقق من البريد بعد فتح الرابط وتحديث Firestore
  Future<void> confirmEmail() async {
    final newEmail = emailController.text.trim();
    final user = FirebaseAuth.instance.currentUser;

    if (user != null && newEmail.isNotEmpty) {
      await FirebaseFirestore.instance
          .collection('user')
          .doc(user.uid)
          .update({'email': newEmail});

      Get.snackbar("تم التأكيد", "تم تخزين البريد الإلكتروني بنجاح");
    }
  }
  Future<void> confirmphone() async {
    final newphone = phoneController.text.trim();
    final user = FirebaseAuth.instance.currentUser;

    if (user != null && newphone.isNotEmpty) {
      await FirebaseFirestore.instance
          .collection('user')
          .doc(user.uid)
          .update({'phone': newphone});

      Get.snackbar("تم التأكيد", "تم تخزين رقم الهاتف بنجاح");
    }
  }
}
