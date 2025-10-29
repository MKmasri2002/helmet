import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:helmet_customer/utils/colors/color1.dart';
import 'package:helmet_customer/views/booking/booking_controller.dart';

class DateBuilder extends StatelessWidget {
  const DateBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BookingController>(
      builder: (ctrl) {
        return Container(
          color: const Color(0xffE1F4FD),
          height: 90,
          child: Padding(
            padding: const EdgeInsetsDirectional.only(start: 16),
            child: DatePicker(DateTime.now(),
                // initialSelectedDate: DateTime.now(),
                selectionColor: primaryColor,
                selectedTextColor: Colors.white, onDateChange: (date) {
              bool full = ctrl.isDayFull(date);
              if (full) {
                ctrl.selectedDateTime = date;
                ctrl.didUserSeletedDate = true;
                ctrl.update();
                Get.snackbar('غير متاح', 'كل السائقين محجوزين في هذا اليوم');
              } else {
                ctrl.selectedDateTime = date;
                ctrl.didUserSeletedDate = true;
                ctrl.update();
                // ctrl.getAvailableTimesForDate(date);
              }
            }),
          ),
        );
      },
    );
  }
}
