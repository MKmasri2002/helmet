

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:helmet_customer/utils/widgets/custom_nav_bar.dart';
import 'package:helmet_customer/views/home/home_controller.dart';
import 'package:helmet_customer/views/reservations/controller/reservation_controller.dart';
import 'package:helmet_customer/widget/primary_button/primary_button.dart';

class ReservationScreen extends StatelessWidget {
  const ReservationScreen({super.key});
final int length=1;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ReservationController>(builder: (ctrl) {
      final itemsToShow =
          ctrl.showAll.value ? userSessions : userSessions.take(length).toList();

      // for (var session in userSessions) {
      //   print(session.toString());
      // }
      print(userSessions.length);
      print(itemsToShow.length);
      return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: const Text("حجوزاتي السابقة"),
          centerTitle: true,
          toolbarHeight: 100,
          titleTextStyle: const TextStyle(
            fontFamily: 'IBM Plex Sans Arabic',
            fontWeight: FontWeight.w500,
            fontStyle: FontStyle.normal,
            fontSize: 16,
            height: 1.5,
            letterSpacing: 0,
            color: Color(0xff121212),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                ListView.builder(
                  itemCount: itemsToShow.length,
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    final session = itemsToShow[index]; // <- استخدم هذا
                    return Container(
                      height: 100,
                      margin: const EdgeInsets.symmetric(
                          vertical: 12, horizontal: 16),
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                            color: const Color.fromARGB(255, 236, 235, 235)),
                      ),
                      child: Row(
                        children: [
                          Image.network(session.cars[0].image!,
                              height: 45, width: 45),
                          const SizedBox(width: 12),
                          Text(
                            "${session.cars[0].brand!} ${session.cars[0].model!}",
                            style: const TextStyle(
                              fontFamily: 'IBM Plex Sans Arabic',
                              fontWeight: FontWeight.w500,
                              fontSize: 12,
                              color: Color.fromARGB(255, 0, 0, 0),
                            ),
                          ),
                          const Spacer(),
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                const Text(
                                  "تم تحصيل المبلغ",
                                  style: TextStyle(
                                    fontFamily: 'IBM Plex Sans Arabic',
                                    fontWeight: FontWeight.w500,
                                    fontSize: 15,
                                    color: Color(0xff29C1F2),
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  ctrl.getTime(date: session.washTime!),
                                  style: const TextStyle(
                                    fontSize: 14,
                                    color: Color(0xff8193B3),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: userSessions.length > length || ctrl.showAll.value
                  ? PrimaryButton(
                    onTap: () {
                      ctrl.toggleShowAll(); // تغيير الحالة لعرض الكل أو عرض مختصر
                    },
                    title: ctrl.showAll.value ? "عرض أقل" : "عرض الكل",
                  )   
                  :SizedBox(height: 2,),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: const CustomNavBar(pos: 2),
      );
    });
  }
}

