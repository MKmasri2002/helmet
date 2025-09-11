import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:helmet_customer/utils/colors/color1.dart';
import 'package:helmet_customer/views/booking/booking_controller.dart';

class TimeOfDayTimeline extends StatelessWidget {
  const TimeOfDayTimeline({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BookingController>(builder: (ctrl) {
      return SizedBox(
        width: MediaQuery.sizeOf(context).width,
        height: 40,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: ctrl.timesDay.length,
            itemBuilder: (context, index) {
              if (DateTime.now().hour > ctrl.timesDay[index] &&
                  DateTime.now().day == ctrl.selectedDateTime.day) {
                return const SizedBox();
              }
              if (ctrl.checkTimeInList(ctrl.timesDay[index])) {
                return const SizedBox();
              }
              return GestureDetector(
                onTap: () {
                  ctrl.selectedTime =
                      TimeOfDay(hour: ctrl.timesDay[index], minute: 0);
                  ctrl.didUserSeletedDateOfDay = true;
                  ctrl.update();
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4.0),
                  child: Container(
                    width: 80,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: ctrl.selectedTime ==
                                TimeOfDay(hour: ctrl.timesDay[index], minute: 0)
                            ? primaryColor
                            : Colors.grey,
                        width: ctrl.selectedTime ==
                                TimeOfDay(hour: ctrl.timesDay[index], minute: 0)
                            ? 2
                            : 1,
                      ),
                    ),
                    child: Center(
                      child:
                          Text(ctrl.formatHour(context, ctrl.timesDay[index])),
                    ),
                  ),
                ),
              );
            }),
      );
    });
  }
}
