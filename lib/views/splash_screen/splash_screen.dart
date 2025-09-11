import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:helmet_customer/theme/app_colors.dart';
import 'package:helmet_customer/views/splash_screen/splash_screen_controller.dart';
import '../../generated/assets.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashScreenController>(builder: (controller) {
      return Scaffold(
        backgroundColor: AppColors.primary,
        body: Stack(
          children: [
            // Image.asset(
            //   Assets.imagesSplashPg,
            //   width: AppSize.width,
            //   height: AppSize.height,
            //   fit: BoxFit.cover,
            // ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Row(),
                const SizedBox(
                  height: 60,
                ),
                Image.asset(
                  Assets.newLogo,
                  width: 200,
                  height: 200,
                ),
                const SizedBox(
                  height: 40,
                ),
                const CircularProgressIndicator(
                  color: AppColors.white,
                ),
              ],
            ),
          ],
        ),
      );
    });
  }
}
