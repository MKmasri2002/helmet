import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:helmet_customer/generated/assets.dart';
import 'package:helmet_customer/views/home/home_controller.dart';
import 'package:helmet_customer/views/order_status/order_status_controller.dart';

class Component8 extends StatelessWidget {
  const Component8({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OrderStatusController>(builder: (ctrl) {
      return Container(
        margin: const EdgeInsets.symmetric(vertical: 15),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          border: BoxBorder.all(color: Color(0xffC3CCD3)),
          borderRadius: const BorderRadius.all(Radius.circular(16)),
        ),
        child: Row(
          children: [
            SvgPicture.asset(
              SvgAssets.dateIcon,
              fit: BoxFit.cover, // يحافظ على نسب الصورة ويملأ الـ Container
              width: 22.21, // اختياري: عرض محدد
              height: 23.29,

              // اختياري: ارتفاع محدد
            ),
            const SizedBox(
              width: 20,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Text(
                  "التاريخ والوقت",
                  style: TextStyle(
                    fontFamily: 'IBMPlexSansArabic',
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                    height: 25 / 14,
                    letterSpacing: 0,
                    color: Color(0xff121212),
                  ),
                  textAlign: TextAlign.start,
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  washDataTripModel.washTimeDate.toString(),
                  style: const TextStyle(
                    fontFamily: 'IBMPlexSansArabic',
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                    height: 25 / 14,
                    letterSpacing: 0,
                    color: Color(0xff121212),
                  ),
                  textAlign: TextAlign.start,
                ),
              ],
            )
          ],
        ),
      );
    });
  }
}
