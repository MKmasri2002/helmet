import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:helmet_customer/theme/app_colors.dart';
import 'package:helmet_customer/utils/controllers/language_controller.dart';
import 'package:helmet_customer/widget/text/headline4.dart';
import 'package:helmet_customer/widget/text/headline5.dart';

class ChangeLanguage extends StatelessWidget {
  const ChangeLanguage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      width: MediaQuery.sizeOf(context).width,
      decoration: const BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Headline4(title: 'Change Language'),
          const SizedBox(
            height: 16,
          ),
          ListTile(
            title: const Headline5(title: 'English'),
            leading: CircleAvatar(
              radius: 8,
              backgroundColor: Get.locale!.languageCode == 'en'
                  ? AppColors.primary
                  : AppColors.grey,
            ),
            trailing: const Icon(
              Icons.arrow_forward_ios,
              color: AppColors.grey,
            ),
            onTap: () {
              LanguageController.updateLocal("en");
              Get.back();
            },
          ),
          ListTile(
            title: const Headline5(title: 'العربية'),
            leading: CircleAvatar(
              radius: 8,
              backgroundColor: Get.locale!.languageCode == 'ar'
                  ? AppColors.primary
                  : AppColors.grey,
            ),
            trailing: const Icon(
              Icons.arrow_forward_ios,
              color: AppColors.grey,
            ),
            onTap: () {
              LanguageController.updateLocal("ar");
              Get.back();
            },
          ),
          const SizedBox(
            height: 24,
          ),
        ],
      ),
    );
  }
}
