import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:helmet_customer/theme/app_colors.dart';
import 'package:helmet_customer/theme/app_size.dart';
import 'package:helmet_customer/views/booking/booking_controller.dart';

class TimeOfDayTimeline extends StatelessWidget {
  const TimeOfDayTimeline({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BookingController>(builder: (ctrl) {
      return Center(
        child: SizedBox(
          width: AppSize.width,
          child: Wrap(
            alignment: WrapAlignment.center,
            spacing: 8.0, // Horizontal spacing between items
            runSpacing: 8.0, // Vertical spacing between rows
            children: List.generate(ctrl.timesDay.length, (index) {
              int hour = ctrl.timesDay[index];

              // ⛔️ 1. لا تعرض الساعات الماضية في نفس اليوم
              if (DateTime.now().hour > hour &&
                  DateTime.now().day == ctrl.selectedDateTime.day) {
                return const SizedBox.shrink();
              }

              // ⛔️ 2. لا تعرض الساعات اللي فل (كل البايكرز مشغولين)
              if (ctrl.isHourFull(hour)) {
                return const SizedBox.shrink();
              }

              // ⛔️ 3. لو الساعة محجوزة عند المستخدم نفسه أو قائمة
              if (ctrl.checkTimeInList(hour)) {
                return const SizedBox.shrink();
              }

              // ✅ 4. باقي الساعات تعرض عادي
              return GestureDetector(
                onTap: () {
                  ctrl.selectedTime = TimeOfDay(hour: hour, minute: 0);
                  ctrl.didUserSeletedDateOfDay = true;
                  ctrl.fullDate = DateTime(
                    ctrl.selectedDateTime.year,
                    ctrl.selectedDateTime.month,
                    ctrl.selectedDateTime.day,
                    ctrl.selectedTime.hour,
                    ctrl.selectedTime.minute,
                  );
                  print('fullDate: ${ctrl.fullDate}');
                  ctrl.update();
                },
                child: Container(
                  width: 80,
                  height: 40,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: ctrl.selectedTime != TimeOfDay(hour: hour, minute: 0)
                        ? AppColors.primary.withValues(alpha: 0.2)
                        : AppColors.primary,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Center(
                    child: Text(
                      ctrl.formatHour(context, hour),
                      style: TextStyle(
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
