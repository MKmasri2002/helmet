import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:helmet_customer/utils/languages/translation_data.dart';
import 'package:helmet_customer/views/order_status/widget/component1.dart';
import 'package:helmet_customer/views/order_status/widget/component10.dart';
import 'package:helmet_customer/views/order_status/widget/component11.dart';
import 'package:helmet_customer/views/order_status/widget/component2.dart';
import 'package:helmet_customer/views/order_status/widget/component3.dart';
import 'package:helmet_customer/views/order_status/widget/component4.dart';
import 'package:helmet_customer/views/order_status/widget/component5.dart';
import 'package:helmet_customer/views/order_status/widget/component6.dart';
import 'package:helmet_customer/views/order_status/widget/component7.dart';
import 'package:helmet_customer/views/order_status/widget/component8.dart';
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
            title: Text(
              TranslationData.reservationDetailes.tr,
              style: TextStyle(
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
                const Component1(),
                const Component2(),
                const Component3(),
                const SizedBox(
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
                const Component8(),
                const SizedBox(height: 20),
                const Component9(),
                const Component10(),
                // const Component11(),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: PrimaryButton(onTap: () {}, title: "تأكيد نهاية الطلب"),
                ),
                const SizedBox(height: 32,)
              ],
            ),
          ),
        );
      },
    );
  }
}
