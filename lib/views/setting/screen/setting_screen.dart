import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:helmet_customer/generated/assets.dart';
import 'package:helmet_customer/utils/languages/translation_data.dart';
import 'package:helmet_customer/utils/tools/tools.dart';
import 'package:helmet_customer/views/profile/settings_screen.dart';
import 'package:helmet_customer/views/setting/controller/setting_controller.dart';
import 'package:helmet_customer/widget/change_language.dart';

class SettingScreen extends StatelessWidget {
  List<String> setting = [
    "تغيير اللغة",
    "سياسات الخصوصة",
    "الشروط والاحكام",
    "تلقي الاشعارات",
  ];
  List<String> icon = [
    "assets/images/language-skill.png",
    "assets/images/secur.png",
    "assets/images/tag.png",
    "assets/images/notification-03.png",
  ];

  SettingScreen({super.key});
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    double sizebox20 = h * 0.02;
    return GetBuilder<SettingController>(
      builder: (ctrl) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.white,
            title: const Text("الاعدادات"),
            centerTitle: true,
            toolbarHeight: h / 7.5,
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
              icon: Icon(
                Icons.arrow_back_ios,
                color: Colors.black,
                size: 16,
                textDirection: Get.locale?.languageCode == 'ar'
                    ? TextDirection.rtl
                    : TextDirection.ltr,
              ),
            ),
          ),
          body: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.all(h * .02),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(
                    child: Container(
                      width: w * .9,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                          color: const Color.fromARGB(
                            255,
                            193,
                            192,
                            192,
                          ).withAlpha(150),
                          width: .5,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(h * .02),
                        child: Column(
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
                            MenuItem(
                              mainText: TranslationData.receiveNotifications.tr,
                              path: Assets.receivwNotifications,
                              onTap: () {},
                              isNotification: true,
                            ),
                          ],
                        ),
                      ),
                    ),
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
