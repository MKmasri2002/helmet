import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:helmet_customer/generated/assets.dart';
import 'package:helmet_customer/views/editprofile/edit_controller.dart';

class GenderSelector extends StatelessWidget {
  final EditController controller;

  const GenderSelector({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<EditController>(
      builder: (ctrl) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
         const Text(
                            "الجنس",
                            style: TextStyle(
                              fontFamily: 'IBM Plex Sans Arabic',
                              fontWeight: FontWeight.w500,
                              fontStyle: FontStyle.normal,
                              fontSize: 16,
                              height: 0.25,
                              letterSpacing: 0,
                              color: Color(0xff121212),
                            ),
                            textAlign: TextAlign.right,
                          ),
                          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              genderOption(ctrl, "ذكر", Assets.man),
              const SizedBox(width: 15),
              genderOption(ctrl, "أنثى",Assets.woman),
            ],
          ),
        ],
      ),
    );
  }

  Widget genderOption(EditController ctrl, String gender, String imagePath) {
    return InkWell(
      onTap: () => ctrl.changeGender(gender),
      child: Container(
        height: 65,
        width: 160,
        decoration: BoxDecoration(
          color: const Color(0xffF0FAFF),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: ctrl.selectedGender == gender ? Colors.blue : Colors.grey,
            width: 2,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(imagePath, height: 40, width: 40),
            const SizedBox(width: 8),
            Text(
              gender,
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
