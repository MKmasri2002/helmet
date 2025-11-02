import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:helmet_customer/theme/app_colors.dart';
import 'package:helmet_customer/utils/languages/translation_data.dart';
import 'package:helmet_customer/views/editprofile/widget/CustomTextField.dart';
import 'package:helmet_customer/views/gifts/widget/phonetextfield.dart';
import 'package:helmet_customer/views/home/ahare_packages/ahare_packages_controller.dart';

class ShareDialog extends StatelessWidget {
  final String packageid;

  const ShareDialog({super.key, required this.packageid});

  @override
  Widget build(BuildContext context) {
    return Scaffold( // ✅ ضروري لعرض الـ TextField و SnackBar بشكل صحيح
      backgroundColor: Colors.black.withOpacity(0.4),
      body: Center(
        child: GetBuilder<SharePackagesController>(builder: (ctrl) {
          return Container(
            width: 320,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 10,
                  offset: const Offset(0, 5),
                ),
              ],
            ),
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
                phonetextfield(controller: ctrl.phoneController),
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
                    minimumSize:
                        MaterialStateProperty.all(const Size(double.infinity, 45)),
                  ),
                  onPressed: () {
                    ctrl.checkphone(packageid: packageid);
                  },
                  child: const Text(
                    "Send",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
