import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:helmet_customer/utils/languages/translation_data.dart';
import 'package:helmet_customer/utils/validation/validations_metod.dart';
import 'package:helmet_customer/views/editprofile/edit_controller.dart';
import 'package:helmet_customer/views/editprofile/widget/CustomButton.dart';
import 'package:helmet_customer/views/editprofile/widget/CustomTextField.dart';

class EditPhone extends StatelessWidget {
  const EditPhone({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();

    return GetBuilder<EditController>(
      builder: (ctrl) {
        // return Directionality(
        //   textDirection: TextDirection.rtl,
        /*child: */ return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.white,
            leading: Padding(
              padding: const EdgeInsets.all(20),
              child: IconButton(
                onPressed: () => Get.back(),
                icon: const Icon(
                  Icons.arrow_back_ios,
                  color: Colors.black,
                  size: 16,
                ),
              ),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(20),
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(height: 20),
                  Text(
                    TranslationData.updatePhoneNumber.tr,
                                        textAlign: TextAlign.start,

                    style: const TextStyle(
                      fontFamily: 'IBM Plex Sans Arabic',
                      fontWeight: FontWeight.w500,
                      fontStyle: FontStyle.normal,
                      fontSize: 18,
                      height: 1.5,
                      letterSpacing: 0,
                      color: Color(0xff121212),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    TranslationData.enterNewPhoneNumber.tr,
                    textAlign: TextAlign.start,
                    style: const TextStyle(
                      fontFamily: 'IBM Plex Sans Arabic',
                      fontStyle: FontStyle.normal,
                      fontSize: 15,
                      height: 1.5,
                      letterSpacing: 0,
                      color: Color(0xff8193B3),
                    ),
                  ),
                  const SizedBox(height: 40),

                  // 🔹 Text Field بنفس تصميمك
                  CustomTextField(
                    controller: ctrl.phoneController,
                    label: TranslationData.phoneNumber.tr,
                    hint: " 05xxxxxxxxx",
                    keyboardType: TextInputType.number,
                    validator: ValidationsMetod.validatePhoneNumber,
                  ),

                  const SizedBox(height: 25),

                  // 🔹 الزر بنفس الشكل
                  CustomButton(
                    title: TranslationData.continueBtn.tr,
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        ctrl.confirmphone();
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        );
        // );
      },
    );
  }
}
