import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:helmet_customer/generated/assets.dart';
import 'package:helmet_customer/utils/languages/translation_data.dart';
import 'package:helmet_customer/utils/routes/routes_string.dart';
import 'package:helmet_customer/utils/colors/color1.dart';

class CustomNavBar extends StatelessWidget {
  final int pos;

  const CustomNavBar({
    super.key,
    required this.pos,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          GestureDetector(
            onTap: () {
              if (pos != 1) {
                Get.offNamed(RoutesString.home);
              }
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ImageIcon(
                  const AssetImage(Assets.home),
                  
                  color: pos == 1 ? primaryColor : baseGreyColor,
                ),
                Text(
                 TranslationData.home.tr,
                  style: TextStyle(
                    fontFamily: 'IBM Plex Sans Arabic',
                    fontSize: 14,
                    height: 1.5,
                    color: pos == 1 ? primaryColor : const Color(0xff8193B3),
                  ),
                ),
              ],
            ),
          ),

          GestureDetector(
            onTap: () {
              if (pos != 2) {
                Get.offNamed(RoutesString.reservations);
              }
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 75,
                  child: ImageIcon(
                    const AssetImage(Assets.schedul),
                    color: pos == 2 ? primaryColor : baseGreyColor,
                    size: 26,
                  ),
                ),
                Text(
                 TranslationData.reservation.tr,
                  style: TextStyle(
                    fontFamily: 'IBM Plex Sans Arabic',
                    fontSize: 14,
                    height: 1.5,
                    color: pos == 2 ? primaryColor : const Color(0xff8193B3),
                  ),
                ),
              ],
            ),
          ),

          GestureDetector(
            onTap: () {
              if (pos != 3) {
               Get.offNamed(RoutesString.gifts1);
              }
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ImageIcon(
                  const AssetImage(Assets.gift),
                  color: pos == 3 ? primaryColor : baseGreyColor,
                  size: 26,
                ),
                Text(
                 TranslationData.gifts.tr,
                  style: TextStyle(
                    fontFamily: 'IBM Plex Sans Arabic',
                    fontSize: 14,
                    height: 1.5,
                    color: pos == 3 ? primaryColor : const Color(0xff8193B3),
                  ),
                ),
              ],
            ),
          ),

          GestureDetector(
            onTap: () {
              if (pos != 4) {
                Get.offNamed(RoutesString.profile);
              }
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
               ImageIcon(
                const AssetImage(Assets.profile),
                  color: pos == 4 ? primaryColor : baseGreyColor,
                  size: 26,
                ),
                Text(
                 TranslationData.account.tr,
                  style: TextStyle(
                    fontFamily: 'IBM Plex Sans Arabic',
                    fontSize: 14,
                    height: 1.5,
                    color: pos == 4 ? primaryColor : const Color(0xff8193B3),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
