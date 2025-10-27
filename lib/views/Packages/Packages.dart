import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:helmet_customer/utils/languages/translation_data.dart';
import 'package:helmet_customer/views/Packages/packegecard.dart';

class PackagesPage extends StatelessWidget {
  const PackagesPage({super.key});

  static  List<Map<String, dynamic>> packages = [
    {
      "title": TranslationData.silverPackage.tr,
      "description":TranslationData.twoWashesPerWeek.tr,
      "price": "50",
      "unit": "25",
      "discount": "10%",
    },
    {
      "title": TranslationData.basicPackage.tr,
      "description": TranslationData.fiveWashesPerWeek.tr,
      "price": "100",
      "unit": "20",
      "discount": "20%",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(400, 850),
      builder: (context, child) {
        return  Scaffold(
            appBar: AppBar(
              title:  Text(TranslationData.packages.tr),
              centerTitle: true,
            ),
            body: ListView.builder(
              padding: EdgeInsets.all(12.w),
              itemCount: packages.length,
              itemBuilder: (context, index) {
                return PackageCard(
                  package: packages[index],
                  onPressed: () {
                  },
                );
              },
            ),
          
        );
      },
    );
  }
}
