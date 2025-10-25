import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:helmet_customer/views/Packages/packegecard.dart';

class PackagesPage extends StatelessWidget {
  const PackagesPage({super.key});

  static const List<Map<String, dynamic>> packages = [
    {
      "title": "الباقة الفضية",
      "description": "غسلتين أسبوعيًا لمدة شهر",
      "price": "50",
      "unit": "25",
      "discount": "10%",
    },
    {
      "title": "الباقة الذهبية",
      "description": "خمس غسلات أسبوعيًا لمدة شهر",
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
        return Directionality(
          textDirection: TextDirection.rtl,
          child: Scaffold(
            appBar: AppBar(
              title: const Text("الباقات"),
              centerTitle: true,
            ),
            body: ListView.builder(
              padding: EdgeInsets.all(12.w),
              itemCount: packages.length,
              itemBuilder: (context, index) {
                return PackageCard(
                  package: packages[index],
                  onPressed: () {
                    Get.snackbar("تم", "ضغطت على ${packages[index]["title"]}");
                  },
                );
              },
            ),
          ),
        );
      },
    );
  }
}
