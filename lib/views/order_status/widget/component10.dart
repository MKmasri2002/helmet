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
                          Text("ملخص الحجز"),
                        ],
                      ),
                      Divider(
                        color: Colors.grey, // لون الخط
                        thickness: 2, // سمك الخط
                        height: 30, // المسافة العمودية قبل وبعد الخط
                      ),
                      Text(washDataTripModel.washTitleAr ?? ""),
                      Text(washDataTripModel.washTitleAr ?? ""),
                      Text("رقم السجل الضريبي : 14214689124"),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("الذهاب الى قائمة الفواتير"),
                          Icon(Icons.arrow_forward_ios)
                        ],
                      ),
                    ],
                  ),
                );
    });
  }
}
