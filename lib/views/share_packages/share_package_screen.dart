import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:helmet_customer/theme/app_colors.dart';
import 'package:helmet_customer/theme/app_size.dart';
import 'package:helmet_customer/utils/languages/translation_data.dart';
import 'package:helmet_customer/views/editprofile/widget/CustomTextField.dart';
import 'package:helmet_customer/views/share_packages/share_package_controller.dart';

class SharePackageScreen extends StatelessWidget {
  const SharePackageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SharePackagesController>(
      init: SharePackagesController(), // تأكد إنها تنشأ أول مرة
      builder: (ctrl) {
        return Scaffold(
          backgroundColor: Colors.grey[200],
          appBar: AppBar(
            
          ),
          body: SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Container(
                width: AppSize.width,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 8,
                      offset: Offset(0, 3),
                    )
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Center(
                      child: Text(
                        "Share Package",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),

                    // رقم الهاتف
                    Text(
                      TranslationData.recipientPhoneNumber.tr,
                      style: const TextStyle(
                        fontFamily: 'IBM Plex Sans Arabic',
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                        color: Color(0xff121212),
                      ),
                    ),
                    const SizedBox(height: 8),
                    TextField(
                      controller: ctrl.phoneController,
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                        labelText: 'رقم الهاتف',
                        hintText: 'مثال: 0791234567',
                        prefixIcon: const Icon(Icons.phone),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      maxLength: 10,
                    ),

                    const SizedBox(height: 20),

                    // عدد الباقات
                    const Text(
                      "عدد الغسلات",
                      style: TextStyle(
                        fontFamily: 'IBM Plex Sans Arabic',
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                        color: Color(0xff121212),
                      ),
                    ),
                    const SizedBox(height: 8),
                   TextField(
                      controller: ctrl.phoneController,
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                        labelText: 'عدد الغسلات',
                        prefixIcon: const Icon(Icons.local_car_wash),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),

                    const SizedBox(height: 30),

                    // زر الإرسال
                    ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(AppColors.boldTextColor),
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        minimumSize: MaterialStateProperty.all(
                          const Size(double.infinity, 50),
                        ),
                      ),
                      onPressed: ctrl.sendPackage,
                      child: const Text(
                        "Send",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
