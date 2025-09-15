import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:helmet_customer/models/car.dart';
import 'package:helmet_customer/utils/colors/color1.dart';
import 'package:helmet_customer/views/widget/custom_text.dart';
import 'package:helmet_customer/views/add_car/add_car_binding.dart';
import 'package:helmet_customer/views/add_car/add_car_screen.dart';
import 'package:helmet_customer/views/booking/booking_controller.dart';
import 'package:helmet_customer/views/home/home_controller.dart';

class ChooseCarsWidget extends StatelessWidget {
  const ChooseCarsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BookingController>(builder: (ctrl) {
      return Padding(
        padding: const EdgeInsetsDirectional.only(start: 16, bottom: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomText(
              text: "اختر المركبة",
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {
                    // controller.onClickAddCar();
                    Get.to(() => const AddCarScreen(),
                        binding: AddCarBinding());
                    // ctrl.selectedCarList.clear();
                    ctrl.update();
                  },
                  child: Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          CupertinoIcons.car_detailed,
                          color: Colors.red,
                          size: 60,
                        ),
                        CustomText(
                          text: "Add car".tr,
                          fontWeight: FontWeight.bold,
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                SizedBox(
                  width: MediaQuery.sizeOf(context).width - 140,
                  height: 130,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: userModel.cars.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GestureDetector(
                          onTap: () {
                            // ctrl.selectedCar = ctrl.myCars[index];
                            ctrl.didUserSeletedCar = true;
                            // washDataTripModel.cars.add(ctrl.myCars[index]);
                            // ctrl.selectedCarList.clear();
                            ctrl.update();

                            ctrl.selectAndUnSelectCar(
                                car: userModel.cars[index]);

                            log("Length : ${ctrl.selectedCars.length}");
                            for (Car c in ctrl.selectedCars) {
                              log(c.toString());
                            }
                          },
                          child: Container(
                            height: 140,
                            width: 100,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white,
                              border: Border.all(
                                color: ctrl.selectedCars
                                        .contains(userModel.cars[index])
                                    ? primaryColor
                                    : Colors.white,
                                width: 2,
                              ),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Image.network(
                                  "${userModel.cars[index].image}",
                                ),
                                CustomText(
                                  text: userModel.cars[index].brand,
                                  fontWeight: FontWeight.bold,
                                ),
                                const SizedBox(
                                  height: 4,
                                ),
                                CustomText(
                                  text: userModel.cars[index].model,
                                  fontWeight: FontWeight.bold,
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    });
  }
}
