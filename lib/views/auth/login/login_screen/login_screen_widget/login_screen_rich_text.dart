import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:helmet_customer/theme/app_colors.dart';
import 'package:helmet_customer/utils/languages/translation_data.dart';
import 'package:helmet_customer/views/web/wev_view.dart';

class LoginScreenRichText extends StatelessWidget {
  const LoginScreenRichText({super.key});

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        text: TranslationData.fromCreateAccount.tr,
        style: const TextStyle(fontSize: 14, color: Colors.black),
        children: [
          TextSpan(
            text:
                ' ${TranslationData.termsAndConditions.tr}.',
            style:  const TextStyle(
                color: AppColors.primary, fontWeight: FontWeight.bold),
            recognizer: TapGestureRecognizer()
              ..onTap = () => Get.to(() => const WebViewPage()),
          ),
        ],
      ),
    );
  }
}
