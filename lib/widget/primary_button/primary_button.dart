import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:helmet_customer/theme/app_colors.dart';
import 'package:helmet_customer/theme/text_themes.dart';
import 'package:helmet_customer/widget/text/headline3.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    super.key,
    required this.onTap,
    required this.title,
    this.color,
    this.backgroundColor,
    this.withBorder,
    this.image,
  });

  final VoidCallback onTap;
  final String title;
  final Color? color;
  final Color? backgroundColor;
  final bool? withBorder;
  final String? image;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      height: 60,
      decoration: BoxDecoration(
        color: backgroundColor ?? AppColors.primary,
        borderRadius: BorderRadius.circular(16),
        border: withBorder == true
            ? Border.all(color: AppColors.primary, width: 2)
            : null,
      ),
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(16),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (image != null)
                SvgPicture.asset(
                  image ?? '',
                  color: AppColors.primary,
                ),
              if (image != null) const SizedBox(width: 8),
              Headline3(
                title: title,
                style: TextThemeStyle().headline4.copyWith(
                      color: color ?? AppColors.white,
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
