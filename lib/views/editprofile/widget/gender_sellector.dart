import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart'; // 👈 أضف هذه المكتبة
import 'package:helmet_customer/views/editprofile/edit_controller.dart';

class GenderSelector extends StatelessWidget {
  const GenderSelector({super.key});

  @override
  Widget build(BuildContext context) {
    final EditController ctrl = Get.find<EditController>();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "النوع",
          style: TextStyle(
            fontFamily: 'IBM Plex Sans Arabic',
            fontWeight: FontWeight.w500,
            fontSize: 14.sp, // 👈 متكيف
            color: const Color(0xff121212),
          ),
        ),
        SizedBox(height: 20.h), // 👈 متكيف
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _genderBox(ctrl, "ذكر"),
            SizedBox(width: 15.w), // 👈 متكيف
            _genderBox(ctrl, "أنثى"),
          ],
        ),
      ],
    );
  }

  Widget _genderBox(EditController ctrl, String gender) {
    final bool isSelected = ctrl.selectedGender == gender;

    return InkWell(
      onTap: () => ctrl.changeginder(gender),
      child: Container(
        height: 65.h, // 👈 متكيف
        width: 165.w, // 👈 متكيف
        decoration: BoxDecoration(
          color: const Color(0xffF0FAFF),
          borderRadius: BorderRadius.circular(10.r), // 👈 متكيف
          border: Border.all(
            color: isSelected ? Colors.blue : const Color(0xffF0FAFF),
            width: 2.w, // 👈 متكيف
          ),
        ),
        child: Center(
          child: Text(
            gender,
            style: TextStyle(
              fontFamily: 'IBM Plex Sans Arabic',
              fontWeight: FontWeight.w500,
              fontSize: 16.sp, // 👈 متكيف
              color: const Color(0xff121212),
            ),
          ),
        ),
      ),
    );
  }
}
