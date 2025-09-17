import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:helmet_customer/generated/assets.dart';
import 'package:helmet_customer/theme/app_colors.dart';
import 'package:helmet_customer/theme/app_size.dart';
import 'package:helmet_customer/utils/colors/color1.dart';
import 'package:helmet_customer/utils/languages/translation_data.dart';
import 'package:helmet_customer/utils/routes/routes_string.dart';
import 'package:helmet_customer/utils/tools/tools.dart';
import 'package:helmet_customer/views/auth/login/login_screen/login_screen_widget/login_screen_rich_text.dart';
import 'package:helmet_customer/views/widget/field/field1.dart';
import 'package:helmet_customer/views/widget/text/t1.dart';
import 'package:helmet_customer/views/widget/text/t2.dart';
import 'package:helmet_customer/widget/my_country_code/call_country_code.dart';
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
                      alignment: AlignmentDirectional.centerStart,
                      child: TextButton(
                          onPressed: () {
                            Get.offAllNamed(RoutesString.home);
                          },
                          child: Text(
                            TranslationData.skip.tr,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          )),
                    ),
                    SizedBox(height: AppSize.height * 0.15),
                    Image.asset(
                      Assets.newLogo,
                      height: 200,
                    ),
                    const SizedBox(height: 16),
                    const T1(
                      text: 'هــلمت يغسل سيارتك وين ماكنت',
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
                          TextFormField1(
                            onChanged: (val) {
                              controller.phone = val;
                              controller.update();
                            },
                            hintText: '05xxxxxxxxx',
                            labelText: "الرقم",
                            // iconData: Icons.phone_android,
                            prefixIcon: const CallCountryCodeIcon(),
                            iconColor: AppColors.primary,
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
                            height: AppSize.height *
                                0.07, // ارتفاع الزر (مثلاً 7% من ارتفاع الشاشة)
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
