import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:helmet_customer/generated/assets.dart';
import 'package:helmet_customer/models/wash_models/order.dart';
import 'package:helmet_customer/theme/app_size.dart';
import 'package:helmet_customer/views/home/home_controller.dart';
import 'package:helmet_customer/views/order_status/order_status_binding.dart';
import 'package:helmet_customer/views/order_status/order_status_view.dart';
import 'package:helmet_customer/views/order_status/widget/component2.dart';

class ButtomWithStatus extends StatelessWidget {
  const ButtomWithStatus({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (ctrl) {
      return GestureDetector(
        onTap: () {
          if (nearestSession != null) print(nearestSession.toString());
          for (Order order in userOrder) {
            log(order.toString());
          }
          var order = userOrder.firstWhereOrNull(
              (order) => order.sessions.any((s) => s.id == nearestSession!.id));

          if (order != null) {
            Get.to(
              () => const OrderStatusView(),
              binding: OrderStatusBinding(),
              arguments: order,
            );
          } else {
            Get.snackbar(
              "تنبيه",
              "لا يوجد طلب مرتبط بهذه الجلسة",
              snackPosition: SnackPosition.BOTTOM,
            );
          }
        },
        child: Container(
          decoration: const BoxDecoration(
            color: Color(0xff0A6082),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    children: [
                      const Text(
                        "جايك بالطريق",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          height: 1.5,
                          color: Colors.white,
                        ),
                      ),
                      const Spacer(),
                      const Image(image: AssetImage(Assets.iconCar)),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        "${nearestSession!.cars[0].brand ?? " "}  ${nearestSession!.cars[0].model ?? " "}",
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          height: 1.5,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 14),
                  child: Row(
                    children: [
                      const IconForReservationDetailes(
                        imagePath: SvgAssets.motorbikeSvg,
                        color: Colors.white,
                      ),
                      HorizontalDashedLine(
                        color:
                            newStatus != 'on_way' ? Colors.white : Colors.grey,
                        isLine: newStatus != 'on_way' ? true : false,
                      ),
                      IconForReservationDetailes(
                          imagePath: SvgAssets.locationArrived,
                          color: newStatus != 'on_way' ? Colors.white : null),
                      HorizontalDashedLine(
                        color: newStatus != 'on_way' && newStatus != 'arrived'
                            ? Colors.white
                            : Colors.grey,
                        isLine: newStatus != 'on_way' && newStatus != 'arrived'
                            ? true
                            : false,
                      ),
                      IconForReservationDetailes(
                        imagePath: SvgAssets.car,
                        color: newStatus != 'on_way' && newStatus != 'arrived'
                            ? Colors.white
                            : null,
                      ),
                      HorizontalDashedLine(
                        color: newStatus != 'on_way' &&
                                newStatus != 'arrived' &&
                                newStatus != 'washing'
                            ? Colors.white
                            : Colors.grey,
                        isLine: newStatus != 'on_way' &&
                                newStatus != 'arrived' &&
                                newStatus != 'washing'
                            ? true
                            : false,
                      ),
                      IconForReservationDetailes(
                        imagePath: SvgAssets.locationCheck,
                        color: newStatus != 'on_way' &&
                                newStatus != 'arrived' &&
                                newStatus != 'washing'
                            ? Colors.white
                            : null,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4.0),
                  child: Row(
                    children: [
                      const Text12(
                        text: "جايك بالطريق",
                      ),
                      SizedBox(width: AppSize.width * 0.16),
                      const Text12(
                        text: "وصل",
                      ),
                      SizedBox(width: AppSize.width * 0.19),
                      const Text12(
                        text: "يتم الغسل",
                      ),
                      SizedBox(width: AppSize.width * 0.19),
                      const Text12(
                        text: "تمت",
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
