import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:helmet_customer/generated/assets.dart';
import 'package:helmet_customer/models/wash_models/package_model.dart';
import 'package:helmet_customer/utils/constants.dart';
import 'package:helmet_customer/utils/languages/translation_data.dart';
import 'package:helmet_customer/views/home/home_controller.dart';
import 'package:helmet_customer/views/widget/custom_text.dart';
import 'package:helmet_customer/widget/text/headline2.dart';

class OneTimeWash extends StatelessWidget {
  const OneTimeWash({super.key, required this.package});
  final List<PackageModel> package;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (ctrl) {
        return Column(
          children: [
            Row(
              children: [
                const SizedBox(
                  width: 16,
                ),
                CustomText(
                  text: TranslationData.oneTimeWash.tr,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ],
            ),
            SizedBox(
              height: 200,
              child: ListView.builder(
                itemCount: package.length,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                return Container(
                  padding: const EdgeInsets.all(16),
                  width: screenWidth,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    children: [
                      SvgPicture.asset(
                        SvgAssets.oneWash,
                        width: 80,
                        height: 80,
                      ),
                      const SizedBox(height: 8),
                      const Headline2(title: 'غسيل خارجي و تنظيف داخلي')
                    ],
                  ),
                );
              }),
            )
          ],
        );
      },
    );
  }
}
