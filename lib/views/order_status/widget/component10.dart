import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:helmet_customer/generated/assets.dart';
import 'package:helmet_customer/theme/app_size.dart';
import 'package:helmet_customer/views/order_status/order_status_controller.dart';

class Component10 extends StatelessWidget {
  const Component10({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OrderStatusController>(builder: (ctrl) {
      return Container(
        margin: const EdgeInsets.symmetric(vertical: 15),
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          border: Border.all(
            color: const Color(0xffC3CCD3),
          ),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                SvgPicture.asset(
                  SvgAssets.summuryIcon,
                  fit: BoxFit.cover, // يحافظ على نسب الصورة ويملأ الـ Container
                  width: 21.5, // اختياري: عرض محدد
                  height: 21.5,

                  // اختياري: ارتفاع محدد
                ),
                const SizedBox(
                  width: 8,
                ),
                const Text(
                  "ملخص الحجز",
                  style: TextStyle(
                    fontFamily: 'IBMPlexSansArabic',
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    height: 25 / 16,
                    letterSpacing: 0,
                    color: Color(0xff121212),
                  ),
                  textAlign: TextAlign.start,
                ),
              ],
            ),
            const Divider(
              color: Colors.grey,
              thickness: 2,
              height: 30,
            ),
            Text(
              ctrl.washDataTripModel.washTitleAr ?? "",
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
            SizedBox(
              height: AppSize.width * 0.05,
            ),
            Text(
              ctrl.washDataTripModel.washTitleAr ?? "",
              style: const TextStyle(
                fontFamily: 'IBMPlexSansArabic',
                fontWeight: FontWeight.w500,
                fontSize: 14,
                height: 32 / 16,
                letterSpacing: 0,
                color: Color(0xff29C1F2),
              ),
              textAlign: TextAlign.start,
            ),
            const Text("رقم السجل الضريبي : 14214689124",
                style: TextStyle(
                  fontFamily: 'IBMPlexSansArabic',
                  fontWeight: FontWeight.w400,
                  fontSize: 10,
                  height: 32 / 10,
                  letterSpacing: 0,
                  color: Color(0xff8193B3),
                ),
                textAlign: TextAlign.start),
            SizedBox(
              height: AppSize.width * 0.05,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("الذهاب الى قائمة الفواتير",
                    style: TextStyle(
                      fontFamily: 'IBMPlexSansArabic',
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                      height: 25 / 18,
                      letterSpacing: 0,
                      color: Color(0xff121212),
                    ),
                    textAlign: TextAlign.start),
                Icon(Icons.arrow_forward_ios)
              ],
            ),
          ],
        ),
      );
    });
  }
}
