import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:helmet_customer/generated/assets.dart';
import 'package:helmet_customer/views/home/home_controller.dart';
import 'package:helmet_customer/views/order_status/order_status_controller.dart';

class Component10 extends StatelessWidget {
  const Component10({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OrderStatusController>(builder: (ctrl) {
      return Container(
        margin: EdgeInsets.all(8),
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.black,
          ),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          children: [
            Row(
              children: [
                Image(image: AssetImage(Assets.motorBike)),
                SizedBox(
                  width: 20,
                ),
                Text(
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
            Divider(
              color: Colors.grey, // لون الخط
              thickness: 2, // سمك الخط
              height: 30, // المسافة العمودية قبل وبعد الخط
            ),
            Text(
              washDataTripModel.washTitleAr ?? "",
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
            Text(
              washDataTripModel.washTitleAr ?? "",
              style: TextStyle(
                fontFamily: 'IBMPlexSansArabic',
                fontWeight: FontWeight.w500,
                fontSize: 14,
                height: 32 / 16,
                letterSpacing: 0,
                color: Color(0xff29C1F2),
              ),
              textAlign: TextAlign.start,
            ),
            Text("رقم السجل الضريبي : 14214689124",
                style: TextStyle(
                  fontFamily: 'IBMPlexSansArabic',
                  fontWeight: FontWeight.w400,
                  fontSize: 10,
                  height: 32 / 10,
                  letterSpacing: 0,
                  color: Color(0xff8193B3),
                ),
                textAlign: TextAlign.start),
            Row(
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
