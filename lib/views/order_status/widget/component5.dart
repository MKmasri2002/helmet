import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:helmet_customer/theme/app_size.dart';
import 'package:helmet_customer/views/home/home_controller.dart';
import 'package:helmet_customer/views/order_status/order_status_controller.dart';
import 'package:helmet_customer/views/order_status/widget/sperator.dart';

class Component5 extends StatelessWidget {
  const Component5({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OrderStatusController>(builder: (ctrl) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          padding: const EdgeInsets.all(8),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(16)),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Row(
                children: [
                  Icon(Icons.person_2_outlined),
                  Text(
                    "تفاصيل البايكر الخاص بك",
                    style: TextStyle(
                      fontFamily: 'IBMPlexSansArabic',
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      height: 25 / 16,
                      letterSpacing: 0,
                      color: Color(0xff121212),
                    ),
                    textAlign: TextAlign.start,
                  ),
                ],
              ),
              const Sperator(),
              Row(
                children: [
                  CircleAvatar(
                    backgroundImage:
                        NetworkImage(washDataTripModel.driverPhoto ?? ""),
                    radius: 30,
                  ),
                  Column(
                    children: [
                      Text(
                        washDataTripModel.driverName ?? "",
                        style: const TextStyle(
                          fontFamily: 'IBMPlexSansArabic',
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                          height: 25 / 14,
                          letterSpacing: 0,
                          color: Color(0xff121212),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Row(children: [
                        Icon(
                          Icons.star,
                          color: Colors.grey,
                        ),
                        Icon(
                          Icons.star,
                          color: Colors.yellow,
                        ),
                        Icon(
                          Icons.star,
                          color: Colors.yellow,
                        ),
                        Icon(
                          Icons.star,
                          color: Colors.yellow,
                        ),
                        Icon(
                          Icons.star,
                          color: Colors.yellow,
                        ),
                        Text(
                          "4.0",
                          style: TextStyle(
                            fontFamily: 'IBMPlexSansArabic',
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                            height: 25 / 14,
                            letterSpacing: 0,
                            color: Color(0xff121212),
                          ),
                        ),
                      ]),
                      Text(
                        washDataTripModel.driverPhone ?? "",
                        textAlign: TextAlign.left,
                        style: const TextStyle(
                          fontFamily: 'IBMPlexSansArabic',
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                          height: 25 / 12,
                          letterSpacing: 0,
                          color: Color(0xff8193B3),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: AppSize.width * 0.3,
                  ),
                  CircleAvatar(
                    backgroundColor: Colors.blue[200],
                    child: IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.phone,
                          color: Colors.white,
                        )),
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
