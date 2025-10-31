import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:helmet_customer/theme/app_colors.dart';
import 'package:helmet_customer/utils/languages/translation_data.dart';
import 'package:helmet_customer/views/editprofile/widget/CustomTextField.dart';
import 'package:helmet_customer/views/gifts/gifts/gifts_controller.dart';
import 'package:helmet_customer/views/gifts/widget/phonetextfield.dart';
import 'package:helmet_customer/views/home/ahare_packages/ahare_packages_controller.dart';

class SuccessDialog extends StatelessWidget {
  final String packageid;

  const SuccessDialog({super.key, required this.packageid});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SharePackagesController>(builder: (ctrl) {
      return Align(
        alignment: Alignment.center,
        child: Container(
          width: 320,
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 10,
                offset: Offset(0, 5),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                "share packages",
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
                    fontStyle: FontStyle.normal,
                    fontSize: 13,
                    height: 0.25,
                    letterSpacing: 0,
                    color: Color(0xff121212),
                  ),
                ),
              ),
              phonetextfield(controller: ctrl.phoneController),
              const SizedBox(height: 20),
              const Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Text(
                  "Number of washes",
                  style: const TextStyle(
                    fontFamily: 'IBM Plex Sans Arabic',
                    fontWeight: FontWeight.w600,
                    fontStyle: FontStyle.normal,
                    fontSize: 13,
                    height: 0.25,
                    letterSpacing: 0,
                    color: Color(0xff121212),
                  ),
                ),
              ),
              CustomTextField(
                  controller: ctrl.numberofwashes,
                  label: "",
                  hint: "enter number"),
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(AppColors.boldTextColor),
                ),
                onPressed: () {
                  ctrl.checkphone(packageid: packageid);
                },
                child: const Text(
                  "send",
                  style: TextStyle(color: AppColors.white),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
