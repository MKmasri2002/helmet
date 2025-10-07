import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:helmet_customer/utils/routes/routes_string.dart';
import 'package:helmet_customer/utils/colors/color1.dart';
import 'package:helmet_customer/views/profile/settings_screen.dart';

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
                Icon(
                  Icons.home_outlined,
                  color: pos == 1 ? primaryColor : baseGreyColor,
                  size: 26,
                ),
                const SizedBox(
                  height: 10,
                )
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
                  child: Icon(
                    Icons.calendar_month_outlined,
                    color: pos == 2 ? primaryColor : baseGreyColor,
                    size: 24,
                  ),
                ),
                const SizedBox(
                  height: 10,
                )
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
                Icon(
                  Icons.person_2_outlined,
                  color: pos == 4 ? primaryColor : baseGreyColor,
                  size: 26,
                ),
                const SizedBox(
                  height: 10,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}


