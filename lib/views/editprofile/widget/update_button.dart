import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:helmet_customer/views/editprofile/edit_controller.dart';

class UpdateButton extends StatelessWidget {
  final EditController controller;

  const UpdateButton({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        controller.updateUser();
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xff4AC5ED),
        minimumSize: const Size(double.infinity, 55),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
      child: const Text(
        "تحديث",
        style: TextStyle(
          fontSize: 18,
          color: Colors.white,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
