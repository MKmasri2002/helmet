import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:helmet_customer/theme/app_colors.dart';
import 'package:helmet_customer/views/splash_screen/splash_screen_controller.dart';
import 'package:video_player/video_player.dart';
import '../../generated/assets.dart';

class SplashScreen extends GetView<SplashScreenController> {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashScreenController>(builder: (controller) {
      return Scaffold(
        body: Stack(
          children: [
            Positioned.fill(
              child: controller.videoInitialized
                  ? FittedBox(
                      fit: BoxFit.cover,
                      child: SizedBox(
                        width: controller.videoController.value.size.width,
                        height: controller.videoController.value.size.height,
                        child: VideoPlayer(controller.videoController),
                      ),
                    )
                  : const Image(
                      image: AssetImage(Assets.imagesSplashPg),
                      fit: BoxFit.fill,
                    ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Row(),
                const SizedBox(
                  height: 60,
                ),
                SvgPicture.asset(
                  SvgAssets.logo,
                  width: 150,
                  height: 150,
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
