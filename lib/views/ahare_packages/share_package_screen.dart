import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:helmet_customer/theme/app_colors.dart';
import 'package:helmet_customer/theme/app_size.dart';
import 'package:helmet_customer/utils/languages/translation_data.dart';
import 'package:helmet_customer/views/editprofile/widget/CustomTextField.dart';
import 'package:helmet_customer/views/gifts/widget/phonetextfield.dart';
import 'package:helmet_customer/views/ahare_packages/share_package_controller.dart';

class SharePackageScreen extends StatelessWidget {
  const SharePackageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SharePackagesController>(builder: (ctrl) {
      return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: AppColors.boldTextColor,
          title: Text(
            TranslationData.sharePackage.tr,
            style: const TextStyle(color: Colors.white),
          ),
          centerTitle: true,
        ),
        body: Container(
          padding: EdgeInsets.all(12),
          width: AppSize.width,
          height: AppSize.height,
          color: Colors.white,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                "Share Package",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Text(
                  TranslationData.recipientPhoneNumber.tr,
                  style: const TextStyle(
                    fontFamily: 'IBM Plex Sans Arabic',
                    fontWeight: FontWeight.w600,
                    fontSize: 13,
                    color: Color(0xff121212),
                  ),
                ),
              ),
              // phonetextfield(controller: ctrl.phoneController),

              SharePackageTextField(),
              const SizedBox(height: 20),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Text(
                  "Number of washes",
                  style: TextStyle(
                    fontFamily: 'IBM Plex Sans Arabic',
                    fontWeight: FontWeight.w600,
                    fontSize: 13,
                    color: Color(0xff121212),
                  ),
                ),
              ),
              CustomTextField(
                controller: ctrl.numberofwashes,
                label: "",
                hint: "Enter number",
              ),
              const SizedBox(height: 20),
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
                      const Size(double.infinity, 45)),
                ),
                onPressed: () {},
                child: const Text(
                  "Send",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}

class SharePackageTextField extends StatelessWidget {
  const SharePackageTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: TextInputType.phone, // يخلي الكيبورد أرقام
      decoration: InputDecoration(
        labelText: 'رقم الهاتف',
        hintText: 'مثال: 0791234567',
        prefixIcon: Icon(Icons.phone),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      maxLength: 10, // يحدد الطول الأقصى للرقم
    );
  }
}
