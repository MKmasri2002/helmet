import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:helmet_customer/views/home/home_controller.dart';
import 'package:helmet_customer/views/order_status/order_status_controller.dart';

class Component8 extends StatelessWidget {
  const Component8({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OrderStatusController>(builder: (ctrl) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            border: BoxBorder.all(color: Colors.black),
            borderRadius: const BorderRadius.all(Radius.circular(16)),
          ),
          child: Row(
            children: [
              const Icon(
                Icons.date_range,
              ),
              const SizedBox(
                width: 20,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
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
                    height: 20,
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
        ),
      );
    });
  }
}
