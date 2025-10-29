import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:helmet_customer/theme/app_colors.dart';
import 'package:helmet_customer/views/booking/booking_controller.dart';

class TimeOfDayTimeline extends StatelessWidget {
  const TimeOfDayTimeline({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BookingController>(builder: (ctrl) {
      // تقسيم الساعات
      final morningHours = ctrl.timesDay.where((h) => h < 12).toList();
      final eveningHours = ctrl.timesDay.where((h) => h >= 12).toList();

      Widget buildTimeSection(String title, List<int> hours) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: AppColors.primary,
              ),
            ),
            const SizedBox(height: 8),
            Wrap(
              alignment: WrapAlignment.center,
              spacing: 8.0,
              runSpacing: 8.0,
              children: List.generate(hours.length, (index) {
                int hour = hours[index];

                // ⛔️ 1. لا تعرض الساعات الماضية في نفس اليوم
                if (DateTime.now().hour > hour &&
                    DateTime.now().day == ctrl.selectedDateTime.day) {
                  return const SizedBox.shrink();
                }

                // ⛔️ 2. لا تعرض الساعات اللي فل
                if (ctrl.isHourFull(hour)) {
                  return const SizedBox.shrink();
                }

                // ⛔️ 3. لا تعرض الساعات المحجوزة عند المستخدم
                if (ctrl.checkTimeInList(hour)) {
                  return const SizedBox.shrink();
                }

                // ✅ 4. باقي الساعات تظهر عادي
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
                    ctrl.update();
                  },
                  child: Container(
                    width: 80,
                    height: 40,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color:
                          ctrl.selectedTime != TimeOfDay(hour: hour, minute: 0)
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
            const SizedBox(height: 16),
          ],
        );
      }

      return SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (morningHours.isNotEmpty)
                buildTimeSection("صباحًا", morningHours),
              if (eveningHours.isNotEmpty)
                buildTimeSection("مساءً", eveningHours),
            ],
          ),
        ),
      );
    });
  }
}
