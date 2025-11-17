import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:helmet_customer/generated/assets.dart';
import 'package:helmet_customer/theme/app_size.dart';
import 'package:helmet_customer/utils/colors/color1.dart';
import 'package:helmet_customer/utils/languages/translation_data.dart';
import 'package:helmet_customer/utils/routes/routes_string.dart';
import 'package:helmet_customer/utils/tools/tools.dart';
import 'package:helmet_customer/views/auth/login/login_screen/login_screen_widget/login_screen_rich_text.dart';
import 'package:helmet_customer/views/widget/text/t1.dart';
import 'package:helmet_customer/views/widget/text/t2.dart';
import 'package:helmet_customer/widget/my_country_code/call_country_code.dart';
import 'package:helmet_customer/widget/text_field.dart';
import '../login_controller.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => appTools.unFocusKeyboard(context),
      child: GetBuilder<LoginController>(
        builder: (controller) {
          return Scaffold(
            body: Form(
              key: controller.loginForm,
              child: SingleChildScrollView(
                padding: MediaQuery.of(context).viewInsets,
                child: Column(
                  children: [
                    SizedBox(height: AppSize.height * 0.05),
                    Align(
                      alignment: AlignmentDirectional.centerEnd,
                      child: Container(
                        margin: const EdgeInsetsDirectional.only(end: 16),
                        height: 40,
                        width: 70,
                        decoration: BoxDecoration(
                          color: const Color(0xff8193b3).withValues(alpha: 0.1),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: TextButton(
                          onPressed: () {
                            Get.offAllNamed(RoutesString.home);
                          },
                          child: Text(
                            TranslationData.skip.tr,
                            style: const TextStyle(
                              color: Color(0xff8193b3),
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),
                    Image.asset(
                      Assets.newLogo,
                      height: 200,
                    ),
                    const SizedBox(height: 16),
                    const T1(
                      text: "نغسل سيارتك وين ما كانت",
                    ),
                    const SizedBox(height: 8),
                    T2(
                      text: TranslationData
                          .enterYourPhoneNumberToCreateAccount.tr,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 16.0, right: 16, top: 40, bottom: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          MainTextField(
                            controller: controller.phoneController,
                            hint: 'مثال 05xxxxxxxx',
                            textInputType: TextInputType.phone,
                            prefixIcon: const CallCountryCodeIcon(),
                            maxLength: 10,
                            formatter: [
                              FilteringTextInputFormatter.allow(
                                  controller.onlyNumberFormatter),
                            ],
                          ),
                          const SizedBox(
                            height: 24,
                          ),
                          // create rich text for terms and conditions
                          const LoginScreenRichText(),
                          const SizedBox(
                            height: 24,
                          ),

                          SizedBox(
                            width: AppSize.width, // عرض الزر
                            height:
                                50, // ارتفاع الزر (مثلاً 7% من ارتفاع الشاشة)
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.circular(16), // الزوايا
                                ),
                                backgroundColor: primaryColor,
                              ),
                              onPressed: () {
                                appTools.unFocusKeyboard(context);
                                controller.sendOTP(controller.phone);
                              },
                              child: controller.isLoading
                                  ? const CircularProgressIndicator(
                                      color: Colors.white)
                                  : Text(
                                      "Sign In".tr,
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                            ),
                          ),

                          const SizedBox(
                            height: 16,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
