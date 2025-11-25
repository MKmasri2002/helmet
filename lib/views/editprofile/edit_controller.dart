import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:helmet_customer/utils/global/global.dart';

class EditController extends GetxController {
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final birthDateController = TextEditingController();
  final emailController = TextEditingController(); // ✨ جديد
  final phoneController = TextEditingController();

  String selectedGender = '';

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

      if (FirebaseAuth.instance.currentUser == null) return;

     
        firstNameController.text = userModel.name?.split(' ').first ?? '';
        lastNameController.text =
            userModel.name?.split(' ').length == 2 ? userModel.name!.split(' ').last : '';
        birthDateController.text = userModel.birthdate ?? '';
        emailController.text = userModel.email ?? '';
        selectedGender = userModel.gender ?? '';
        emailController.text = userModel.email ?? '';
        phoneController.text = userModel.phone ?? '';
        update();
      }
     catch (e) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Get.snackbar("خطأ", "حدث خطأ أثناء جلب بيانات المستخدم: $e");
      });
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
      
      if (FirebaseAuth.instance.currentUser == null) return;

      userModel.name = "${firstNameController.text} ${lastNameController.text}";
      userModel.gender = selectedGender;
      userModel.birthdate = birthDateController.text;

      await FirebaseFirestore.instance
          .collection('user')
          .doc(userModel.uid)
          .update(userModel.toJson());

      WidgetsBinding.instance.addPostFrameCallback((_) {
        Get.snackbar('تم بنجاح', 'تم تحديث البيانات بنجاح');
      });
    } catch (e) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Get.snackbar('خطأ', 'حدث خطأ أثناء حفظ التغييرات: $e');
      });
    }
    update();
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

      WidgetsBinding.instance.addPostFrameCallback((_) {
        Get.snackbar("تم التأكيد", "تم تخزين البريد الإلكتروني بنجاح");
      });
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

      WidgetsBinding.instance.addPostFrameCallback((_) {
        Get.snackbar("تم التأكيد", "تم تخزين رقم الهاتف بنجاح");
      });
    }
  }
}
