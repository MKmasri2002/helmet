import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:helmet_customer/generated/assets.dart';
import 'package:helmet_customer/theme/app_colors.dart';
import 'package:helmet_customer/views/widget/custom_text.dart';

class Botoom extends StatelessWidget {
  final String content;
  const Botoom({super.key, required this.content});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
      ),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 1, 139, 194),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          CustomText(
            text: content,
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: AppColors.white,
          ),
          const SizedBox(
            width: 3,
          ),
          SvgPicture.asset(
            SvgAssets.reyal,
            height: 20,
            width: 20,
            colorFilter:
                const ColorFilter.mode(AppColors.white, BlendMode.srcIn),
          ),
          const Spacer(),
          const Icon(Icons.arrow_forward_ios_rounded,
              color: AppColors.white, size: 20),
        ],
      ),
    );
  }
}
