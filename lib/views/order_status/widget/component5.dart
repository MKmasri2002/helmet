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
                            Text("تفاصيل البايكر الخاص بك"),
                          ],
                        ),
                        const Sperator(),
                        Row(
                          children: [
                            CircleAvatar(
                              backgroundImage: NetworkImage(
                                  washDataTripModel.driverPhoto ?? ""),
                              radius: 30,
                            ),
                            Column(
                              children: [
                                Text(washDataTripModel.driverName ?? ""),
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
                                  Text("4.0"),
                                ]),
                                Text(
                                  washDataTripModel.driverPhone ?? "",
                                  textAlign: TextAlign.left,
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
