import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:helmet_customer/theme/app_colors.dart';
import 'package:helmet_customer/utils/colors/color1.dart';
import 'package:helmet_customer/views/widget/custom_text.dart';

class SettingsMenuItem extends StatelessWidget {
  const SettingsMenuItem({
    super.key,
    required this.text,
    required this.image,
    this.imageColor,
    required this.onTap,
  });
  final String text;
  final String image;
  final Color? imageColor;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        padding: const EdgeInsets.symmetric(horizontal: 16),
        height: 60,
        width: MediaQuery.sizeOf(context).width,
        child: Row(
          children: [
            SvgPicture.asset(
              image,
              color: AppColors.primary,
              width: 24,
            ),
            const SizedBox(
              width: 20,
            ),
            CustomText(
              text: text,
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
            const Spacer(),
            Icon(
              Icons.arrow_forward_ios,
              color: primaryColor,
              size: 24,
            ),
          ],
        ),
      ),
    );
  }
}
