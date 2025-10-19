import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:helmet_customer/generated/assets.dart';
import 'package:helmet_customer/theme/app_size.dart';
import 'package:helmet_customer/utils/languages/translation_data.dart';
import 'package:helmet_customer/utils/routes/routes_string.dart';
import 'package:helmet_customer/utils/widgets/custom_nav_bar.dart';

class SettingsScreen extends StatelessWidget {
  SettingsScreen({super.key});

  List<String> icon = [
    "assets/images/1.png",
    "assets/images/2.png",
    "assets/images/3.png",
    "assets/images/4.png",
    "assets/images/5.png",
    "assets/images/6.png",
    "assets/images/7.png",
    "assets/images/8.png",
    "assets/images/9.png",
    "assets/images/10.png",
    "assets/images/11.png",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text("حسابي"),
        centerTitle: true,
        toolbarHeight: AppSize.height / 7.5,
        titleTextStyle: const TextStyle(
          fontFamily: 'IBM Plex Sans Arabic',
          fontWeight: FontWeight.w500,
          fontStyle: FontStyle.normal,
          fontSize: 20,
          height: 1.5,
          letterSpacing: 0,
          color: Color(0xff121212),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(AppSize.height * .02),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Container(
                  height: AppSize.height / 3,
                  width: AppSize.width * .9,
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
                    padding: EdgeInsets.symmetric(
                        horizontal: AppSize.height * .02,
                        vertical: AppSize.height * .01),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.all(AppSize.width / 30),
                              child: CircleAvatar(
                                radius: AppSize.width / 15,
                                child: Image.network(
                                  "https://i.pinimg.com/736x/17/a4/a1/17a4a17e6a350f456ec86a21afa2e007.jpg",
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            const Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ProfileText(
                                    text: "khaled mohammed", height: 0.25),
                                SizedBox(height: 15),
                                Row(
                                  children: [
                                    // Image.asset(
                                    //   "assets/images/Icon.png",
                                    //   width: 24,
                                    //   height: 24,
                                    // ),
                                    ProfileText(text: "3.5", height: 0.25),
                                  ],
                                ),
                              ],
                            ),
                            const Spacer(),
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  // InkWell(
                                  //   onTap: () {
                                  //     // Get.to(
                                  //     //   () => editpage(),
                                  //     //   binding: EditBinding(),
                                  //     // );
                                  //   },
                                  //   // child: Image.asset(
                                  //   //   "assets/images/edit.png",
                                  //   //   width: 24,
                                  //   //   height: 24,
                                  //   // ),
                                  // ),
                                  TextButton(
                                    onPressed: () {
                                      Get.toNamed(RoutesString.edit);
                                    },
                                    child: ProfileText(
                                        text: "تعديل",
                                        height: 0.25,
                                        fontSize: 16,
                                        color: Color(0xff29C1F2)),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const ProfileDivider(),
                        MenuItem(
                          mainText: 'اضافة البريد الالكتروني',
                          path: Assets.profileEmailIcon,
                          onTap: () {},
                        ),
                        MenuItem(
                          mainText: '+962793313222',
                          path: Assets.profilePhoneIcon,
                          onTap: () {},
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: AppSize.height * 0.02),
              Column(
                children: [
                  Center(
                    child: Container(
                      width: AppSize.width * .9,
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
                        padding: EdgeInsets.all(AppSize.height * .02),
                        child: Column(
                          children: [
                            MenuItem(
                              mainText: TranslationData
                                  .freeBalanceForYouAndYourFriend.tr,
                              subText: TranslationData.whenShareTheApp.tr,
                              path: Assets.profile1,
                              onTap: () {},
                            ),
                            MenuItem(
                              mainText: TranslationData.vision.tr,
                              path: Assets.profile2,
                              onTap: () {},
                            ),
                            MenuItem(
                              mainText:
                                  TranslationData.joinAsServiceProvider.tr,
                              path: Assets.profile3,
                              onTap: () {},
                            ),
                            MenuItem(
                              mainText: TranslationData.myWallet.tr,
                              path: Assets.profile4,
                              onTap: () {},
                            ),
                            MenuItem(
                              mainText: TranslationData.myCars.tr,
                              path: Assets.profile5,
                              onTap: () {},
                            ),
                            MenuItem(
                              mainText: TranslationData.discountCodes.tr,
                              path: Assets.profile6,
                              onTap: () {},
                            ),
                            MenuItem(
                              mainText: TranslationData.bills.tr,
                              path: Assets.profile7,
                              onTap: () {},
                            ),
                            MenuItem(
                              mainText: TranslationData.settings.tr,
                              path: Assets.profile8,
                              onTap: () {
                                Get.toNamed(RoutesString.settings);
                              },
                            ),
                            MenuItem(
                              mainText: TranslationData.activatePackages.tr,
                              path: Assets.profile9,
                              onTap: () {},
                            ),
                            MenuItem(
                              mainText: TranslationData.packages.tr,
                              path: Assets.profile10,
                              onTap: () {},
                            ),
                            MenuItem(
                              mainText: TranslationData.help.tr,
                              path: Assets.profile11,
                              onTap: () {},
                            ),
                            MenuItem(
                              mainText: TranslationData.logout.tr,
                              path: Assets.profileLogoutIcon,
                              isLogout: true,
                              onTap: () async {
                                await FirebaseAuth.instance.signOut();
                                Get.offAllNamed(RoutesString.login);
                              },
                            ),
                            const SizedBox(height: 50),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const CustomNavBar(pos: 4),
    );
  }
}

////////////////////////////**********************************************/////////////////////
class ProfileDivider extends StatelessWidget {
  const ProfileDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Divider(
      color: const Color.fromARGB(
        255,
        226,
        226,
        226,
      ).withAlpha(150),
      thickness: 0.8,
    );
  }
}

////////////////////////////**********************************************/////////////////////
class ProfileText extends StatelessWidget {
  final String text;
  final double? height;
  final double? fontSize;
  final Color? color;
  const ProfileText(
      {super.key, required this.text, this.height, this.fontSize, this.color});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: 'IBM Plex Sans Arabic',
        fontWeight: FontWeight.w500,
        fontSize: fontSize ?? 14,
        height: height ?? 1.5,
        letterSpacing: 0,
        color: color ?? const Color(0xff121212),
      ),
    );
  }
}

class MenuItem extends StatelessWidget {
  final String mainText;
  final String? subText;
  final String path;
  final bool? isLogout;
  final bool? isNotification;
  final void Function() onTap;
  const MenuItem(
      {super.key,
      required this.mainText,
      this.subText,
      required this.path,
      this.isLogout,
      required this.onTap,
      this.isNotification});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        child: Column(
          children: [
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Image.asset(
                    path,
                    width: 24,
                    height: 24,
                  ),
                  SizedBox(width: AppSize.height * 0.02),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ProfileText(
                        text: mainText,
                        color: isLogout != null ? Colors.red : null,
                      ),
                      if (subText != null)
                        ProfileText(
                          text: subText!,
                          color: const Color(0xff8193B3),
                        ),
                    ],
                  ),
                  const Spacer(),
                  if (isLogout == null && isNotification == null)
                    const Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.black,
                      size: 15,
                    ),
                  if (isNotification == true)
                    AnimatedContainer(
                      duration: const Duration(
                        milliseconds: 250,
                      ),
                      width: 51,
                      height: 28,
                      padding: const EdgeInsets.all(
                        4,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                          20,
                        ),
                        // color: ctrl.isOn
                        color: true ? Colors.green : Colors.red,
                      ),
                      child: AnimatedAlign(
                        duration: const Duration(
                          milliseconds: 250,
                        ),
                        // alignment: ctrl.isOn
                        alignment:
                            true ? Alignment.centerRight : Alignment.centerLeft,
                        child: Container(
                          width: 22,
                          height: 22,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
            if (isLogout == null) const ProfileDivider(),
          ],
        ),
      ),
    );
  }
}
   // appBar: AppBar(
      //   title: CustomText(
      //     text: TranslationData.account.tr,
      //     color: Colors.black,
      //     fontWeight: FontWeight.bold,
      //     fontSize: 22,
      //   ),
      //   centerTitle: true,
      // ),
      // body: Column(
      //   children: [
      //     const SizedBox(
      //       height: 20,
      //     ),
      //     SettingsMenuItem(
      //       onTap: () {},
      //       text: "Notifications".tr,
      //       image: Assets.notification,
      //       imageColor: secondaryColor,
      //     ),
      //     SettingsMenuItem(
      //       onTap: () {
      //         Get.toNamed(RoutesString.myCars);
      //       },
      //       text: "My Cars".tr,
      //       image: Assets.invite,
      //       imageColor: secondaryColor,
      //     ),
      //     SettingsMenuItem(
      //       onTap: () {
      //         Get.toNamed(RoutesString.addressBook);
      //       },
      //       text: "My Addresses".tr,
      //       image: Assets.security,
      //       imageColor: secondaryColor,
      //     ),
      //     SettingsMenuItem(
      //       onTap: () {
      //         appTools.showCustomBottomSheet(
      //           context,
      //           const ChangeLanguage(),
      //           true,
      //         );
      //       },
      //       text: "Language".tr,
      //       image: Assets.language,
      //     ),
      //     SettingsMenuItem(
      //       onTap: () {
      //         if (Get.find<LanguageController>().localIsEnglish()) {
      //           Get.to(const PrivacyPolicyScreen());
      //         } else {
      //           Get.to(const PrivacyPolicyScreenAr());
      //         }
      //       },
      //       text: "Privacy Policy".tr,
      //       image: Assets.helpCenter,
      //     ),
      //     const Spacer(),
      //     Padding(
      //       padding: const EdgeInsets.only(left: 16, right: 16, bottom: 30),
      //       child: PrimaryButton(
      //         onTap: () async {
      //           await FirebaseAuth.instance.signOut();
      //           Get.offAllNamed(RoutesString.login);
      //         },
      //         title: "Sign out".tr,
      //         color: AppColors.primary,
      //         backgroundColor: AppColors.white,
      //         withBorder: true,
      //         image: Assets.logout,
      //       ),
      //     )
      //   ],
      // ),