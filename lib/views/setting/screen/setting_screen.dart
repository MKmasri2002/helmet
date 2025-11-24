import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:helmet_customer/generated/assets.dart';
import 'package:helmet_customer/utils/languages/translation_data.dart';
import 'package:helmet_customer/utils/tools/tools.dart';
import 'package:helmet_customer/views/profile/settings_screen.dart';
import 'package:helmet_customer/views/setting/controller/setting_controller.dart';
import 'package:helmet_customer/widget/change_language.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SettingController>(
      builder: (ctrl) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.white,
            title: const Text("الاعدادات"),
            centerTitle: true,
            titleTextStyle: const TextStyle(
              fontFamily: 'IBM Plex Sans Arabic',
              fontWeight: FontWeight.w500,
              fontStyle: FontStyle.normal,
              fontSize: 18,
              height: 1.5,
              letterSpacing: 0,
              color: Color(0xff121212),
            ),
            leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: const Icon(
                Icons.arrow_back_ios_new,
                color: Colors.black,
              ),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  MenuItem(
                      mainText: TranslationData.changeLanguage.tr,
                      path: Assets.changeLanguage,
                      onTap: () {
                        appTools.showCustomBottomSheet(
                          context,
                          const ChangeLanguage(),
                          true,
                        );
                      }),
                  MenuItem(
                    mainText: TranslationData.privacyPolicy.tr,
                    path: Assets.privacyPoliciy,
                    onTap: () {},
                  ),
                  MenuItem(
                    mainText: TranslationData.termsAndConditions.tr,
                    path: Assets.termsAndConditions,
                    onTap: () {},
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
