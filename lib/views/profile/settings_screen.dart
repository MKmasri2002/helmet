import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:helmet_customer/generated/assets.dart';
import 'package:helmet_customer/theme/app_colors.dart';
import 'package:helmet_customer/utils/colors/color1.dart';
import 'package:helmet_customer/utils/routes/routes_string.dart';
import 'package:helmet_customer/utils/tools/tools.dart';
import 'package:helmet_customer/views/profile/ar_privacy_policy_screen.dart';
import 'package:helmet_customer/views/profile/en_privacy_policy_screen.dart';
import 'package:helmet_customer/views/profile/setting_menu_item.dart';
import 'package:helmet_customer/widget/change_language.dart';
import 'package:helmet_customer/utils/controllers/language_controller.dart';
import 'package:helmet_customer/views/widget/custom_text.dart';
import 'package:helmet_customer/widget/primary_button/primary_button.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomText(
          text: "Settings".tr,
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 22,
        ),
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: AppColors.primary,
          ),
        ),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          SettingsMenuItem(
            onTap: () {},
            text: "Notifications".tr,
            image: Assets.notification,
            imageColor: secondaryColor,
          ),
          SettingsMenuItem(
            onTap: () {
              Get.toNamed(RoutesString.myCars);
            },
            text: "My Cars".tr,
            image: Assets.invite,
            imageColor: secondaryColor,
          ),
          SettingsMenuItem(
            onTap: () {
              Get.toNamed(RoutesString.addressBook);
            },
            text: "My Addresses".tr,
            image: Assets.security,
            imageColor: secondaryColor,
          ),
          SettingsMenuItem(
            onTap: () {
              appTools.showCustomBottomSheet(
                context,
                const ChangeLanguage(),
                true,
              );
            },
            text: "Language".tr,
            image: Assets.language,
          ),
          SettingsMenuItem(
            onTap: () {
              if (Get.find<LanguageController>().localIsEnglish()) {
                Get.to(const PrivacyPolicyScreen());
              } else {
                Get.to(const PrivacyPolicyScreenAr());
              }
            },
            text: "Privacy Policy".tr,
            image: Assets.helpCenter,
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, bottom: 30),
            child: PrimaryButton(
              onTap: () async {
                await FirebaseAuth.instance.signOut();
                Get.offAllNamed(RoutesString.login);
              },
              title: "Sign out".tr,
              color: AppColors.primary,
              backgroundColor: AppColors.white,
              withBorder: true,
              image: Assets.logout,
            ),
          )
        ],
      ),
    );
  }
}
