import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:helmet_customer/views/widget/custom_text.dart';

class PackageDescription extends StatelessWidget {
  final String arContent;
  final String enContent;
  final String arDescription;
  final String enDescription;
  const PackageDescription({super.key, required this.arContent, required this.enContent, required this.arDescription, required this.enDescription});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            height: 5,
          ),
          CustomText(
            text: Get.locale!.languageCode == 'en'
                ? enContent
                : arContent,
            fontWeight: FontWeight.bold,
            fontSize: 13,
          ),
          const SizedBox(
            height: 5,
          ),
          CustomText(
            text: Get.locale!.languageCode == 'en'
                ? enDescription
                : arDescription,
            color: Colors.black54,
            fontWeight: FontWeight.normal,
            fontSize: 13,
            maxLines: 2,
          ),
        ],
      ),
    );
  }
}
