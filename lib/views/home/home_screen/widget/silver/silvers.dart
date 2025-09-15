import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:helmet_customer/theme/app_size.dart';
import 'package:helmet_customer/utils/languages/translation_data.dart';
import 'package:helmet_customer/views/home/home_screen/widget/silver/h_s_carousel_slider_builder.dart';
import 'package:helmet_customer/views/home/home_screen/widget/wash_package/one_time_wash.dart';
import 'package:helmet_customer/views/home/home_screen/widget/wash_package/packages.dart';
import 'package:helmet_customer/views/home/home_controller.dart';
import 'package:helmet_customer/views/widget/custom_text.dart';

class Silvers extends StatelessWidget {
  const Silvers({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (ctrl) {
      // Debug print to check oneTimePackages

      return Container(
        decoration: const BoxDecoration(
          color: Color(0xffF0FAFF),
          borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (ctrl.userWashDataTripModel.isNotEmpty) ...[
                CustomText(
                  text: TranslationData.currentPackage.tr,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                const SizedBox(height: 16),
                HomeScreenCarouselSliderBuilder(
                    userWashDataTripModel: ctrl.userWashDataTripModel),
                const SizedBox(height: 24),
              ],

              if (ctrl.oneTimePackages.isNotEmpty) ...[
                OneTimeWash(package: ctrl.oneTimePackages),
                const SizedBox(height: 24),
              ] else ...[
                // Debug: Show message when no one-time packages are available
                Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.orange.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.orange.withOpacity(0.3)),
                  ),
                  child: const CustomText(
                    text: 'Debug: No one-time packages available',
                    fontSize: 14,
                    color: Colors.orange,
                  ),
                ),
                const SizedBox(height: 16),
              ],
              //   Packages(
              //     packages: ctrl.oneTimePackages,
              //     title: "One time wash",
              //   ),
              if (ctrl.subscriptionPackages.isNotEmpty)
                Packages(
                  packages: ctrl.subscriptionPackages,
                  title: "Economy Plan",
                ),
              SizedBox(height: AppSize.height * 0.1),
            ],
          ),
        ),
      );
    });
  }
}
