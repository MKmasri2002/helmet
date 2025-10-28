import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:helmet_customer/generated/assets.dart';
import 'package:helmet_customer/views/gifts/gifts/gifts_controller.dart';

class phonetextfield extends StatelessWidget {
  final TextEditingController controller;
  phonetextfield({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<giftsController>(
      builder: (ctrl) {
        return SizedBox(
          width: 390,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: TextFormField(
              controller: controller,
              keyboardType: TextInputType.number,
              maxLength: 10,
              textAlign: TextAlign.start,
              decoration: InputDecoration(
                hintText: " 05xxxxxxxxx",
                hintStyle: TextStyle(fontSize: 15, color: Color(0xff8193B3)),
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(
Assets.flag,                    height: 24,
                    width: 24,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Color(0xff29C1F2), width: 1.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: Colors.grey, width: 1.0),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
