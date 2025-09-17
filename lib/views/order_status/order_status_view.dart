import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:helmet_customer/utils/languages/translation_data.dart';
import 'package:helmet_customer/views/order_status/widget/component1.dart';
import 'package:helmet_customer/views/order_status/widget/component10.dart';
import 'package:helmet_customer/views/order_status/widget/component2.dart';
import 'package:helmet_customer/views/order_status/widget/component3.dart';
import 'package:helmet_customer/views/order_status/widget/component4.dart';
import 'package:helmet_customer/views/order_status/widget/component5.dart';
import 'package:helmet_customer/views/order_status/widget/component6.dart';
import 'package:helmet_customer/views/order_status/widget/component7.dart';
import 'package:helmet_customer/views/order_status/widget/reservation_date.dart';
import 'package:helmet_customer/views/order_status/widget/component9.dart';
import 'package:helmet_customer/views/order_status/widget/sperator.dart';
import 'package:helmet_customer/views/order_status/order_status_controller.dart';
import 'package:helmet_customer/widget/primary_button/primary_button.dart';

class OrderStatusView extends StatelessWidget {
  const OrderStatusView({super.key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<OrderStatusController>(
      builder: (ctrl) {
        return Scaffold(
          appBar: AppBar(
            leading: IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: const Icon(Icons.arrow_back_ios_new)),
            title: Text(
              "حالة الحجز",
              style: const TextStyle(
                fontFamily: 'IBMPlexSansArabic',
                fontWeight: FontWeight.w500,
                fontSize: 16,
                height: 32 / 16,
                letterSpacing: 0,
                color: Color(0xff121212),
              ),
            ),
            centerTitle: true,
          ),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Component1(),
                Component2(),
                Padding(
                  padding: EdgeInsets.all(15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Component3(),
                      SizedBox(
                        height: 20,
                      ),
                      Sperator(),
                      Component4(),
                      Sperator(),
                      Component5(),
                      Sperator(),
                      Component6(),
                      Component7(),
                      SizedBox(
                        height: 20,
                      ),
                      Component8(),
                      SizedBox(height: 20),
                      Component9(),
                      Component10(),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: PrimaryButton(
                            onTap: () {}, title: "تأكيد نهاية الطلب"),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
