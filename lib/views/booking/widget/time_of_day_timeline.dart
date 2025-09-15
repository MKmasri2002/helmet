import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:helmet_customer/theme/app_colors.dart';
import 'package:helmet_customer/views/booking/booking_controller.dart';

class TimeOfDayTimeline extends StatelessWidget {
  const TimeOfDayTimeline({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BookingController>(builder: (ctrl) {
      return Padding(
        padding: const EdgeInsetsDirectional.only(
          start: 8.0,
        ),
        child: SizedBox(
          width: MediaQuery.sizeOf(context).width,
          child: Wrap(
            spacing: 8.0, // Horizontal spacing between items
            runSpacing: 8.0, // Vertical spacing between rows
            children: List.generate(ctrl.timesDay.length, (index) {
              if (DateTime.now().hour > ctrl.timesDay[index] &&
                  DateTime.now().day == ctrl.selectedDateTime.day) {
                return const SizedBox.shrink();
              }
              if (ctrl.checkTimeInList(ctrl.timesDay[index])) {
                return const SizedBox.shrink();
              }
              return GestureDetector(
                onTap: () {
                  ctrl.selectedTime =
                      TimeOfDay(hour: ctrl.timesDay[index], minute: 0);
                  ctrl.didUserSeletedDateOfDay = true;
                  ctrl.update();
                },
                child: Container(
                  width: 80,
                  height: 40,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: ctrl.selectedTime !=
                            TimeOfDay(hour: ctrl.timesDay[index], minute: 0)
                        ? AppColors.primary.withValues(alpha: 0.2)
                        : AppColors.primary,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Center(
                    child: Text(
                      ctrl.formatHour(
                        context,
                        ctrl.timesDay[index],
                      ),
                      style:  TextStyle(
                        color: Colors.grey[600],
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              );
            }),
          ),
        ),
      );
    });
  }
}
