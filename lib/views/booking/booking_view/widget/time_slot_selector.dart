import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:helmet_customer/theme/app_colors.dart';
import 'package:helmet_customer/utils/time_slot_manager.dart';
import 'package:helmet_customer/views/booking/booking_controller.dart';

class TimeSlotSelector extends StatelessWidget {
  const TimeSlotSelector({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BookingController>(builder: (ctrl) {
      // Generate time slots when date is selected
      if (ctrl.didUserSeletedDate && ctrl.availableTimeSlots.isEmpty) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          ctrl.loadTimeSlotsForDate();
        });
      }

      final morningSlots = ctrl.getTimeSlotsByPeriod(TimePeriod.morning);
      final eveningSlots = ctrl.getTimeSlotsByPeriod(TimePeriod.evening);
      final slotsCount = ctrl.getAvailableSlotsPerPeriod();

      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Period selector tabs
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                Expanded(
                  child: _buildPeriodTab(
                    title: 'الصباح',
                    subtitle: '${slotsCount[TimePeriod.morning] ?? 0} متاح',
                    icon: Icons.wb_sunny_outlined,
                    isSelected: ctrl.selectedPeriod == TimePeriod.morning,
                    onTap: () => ctrl.changePeriodFilter(TimePeriod.morning),
                  ),
                ),
                Expanded(
                  child: _buildPeriodTab(
                    title: 'المساء',
                    subtitle: '${slotsCount[TimePeriod.evening] ?? 0} متاح',
                    icon: Icons.nightlight_outlined,
                    isSelected: ctrl.selectedPeriod == TimePeriod.evening,
                    onTap: () => ctrl.changePeriodFilter(TimePeriod.evening),
                  ),
                ),
                Expanded(
                  child: _buildPeriodTab(
                    title: 'الكل',
                    subtitle: '${ctrl.getAvailableTimeSlots().length} متاح',
                    icon: Icons.access_time,
                    isSelected: ctrl.selectedPeriod == TimePeriod.all,
                    onTap: () => ctrl.changePeriodFilter(TimePeriod.all),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 16),

          // Time slots display
          if (ctrl.selectedPeriod == TimePeriod.all)
            _buildAllSlots(ctrl, morningSlots, eveningSlots)
          else if (ctrl.selectedPeriod == TimePeriod.morning)
            _buildSlotSection('أوقات الصباح (6 صباحاً - 12 ظهراً)', morningSlots, ctrl)
          else
            _buildSlotSection('أوقات المساء (12 ظهراً - 9 مساءً)', eveningSlots, ctrl),
        ],
      );
    });
  }

  Widget _buildPeriodTab({
    required String title,
    required String subtitle,
    required IconData icon,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primary : Colors.transparent,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [
            Icon(
              icon,
              color: isSelected ? Colors.white : Colors.grey[700],
              size: 24,
            ),
            const SizedBox(height: 4),
            Text(
              title,
              style: TextStyle(
                color: isSelected ? Colors.white : Colors.grey[700],
                fontWeight: FontWeight.bold,
                fontSize: 14,
                fontFamily: 'IBMPlexSansArabic',
              ),
            ),
            Text(
              subtitle,
              style: TextStyle(
                color: isSelected ? Colors.white.withValues(alpha: 0.8) : Colors.grey[600],
                fontSize: 11,
                fontFamily: 'IBMPlexSansArabic',
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAllSlots(
    BookingController ctrl,
    List<TimeSlot> morningSlots,
    List<TimeSlot> eveningSlots,
  ) {
    return Column(
      children: [
        _buildSlotSection('أوقات الصباح', morningSlots, ctrl),
        const SizedBox(height: 24),
        _buildSlotSection('أوقات المساء', eveningSlots, ctrl),
      ],
    );
  }

  Widget _buildSlotSection(
    String title,
    List<TimeSlot> slots,
    BookingController ctrl,
  ) {
    final availableSlots = slots.where((s) => s.isAvailable).toList();

    if (availableSlots.isEmpty) {
      return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              children: [
                Icon(
                  title.contains('الصباح') ? Icons.wb_sunny : Icons.nightlight,
                  color: AppColors.primary,
                  size: 20,
                ),
                const SizedBox(width: 8),
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primary,
                    fontFamily: 'IBMPlexSansArabic',
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.grey[300]!),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.info_outline, color: Colors.grey[600]),
                  const SizedBox(width: 8),
                  Text(
                    'لا توجد مواعيد متاحة في هذه الفترة',
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontFamily: 'IBMPlexSansArabic',
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                title.contains('الصباح') ? Icons.wb_sunny : Icons.nightlight,
                color: AppColors.primary,
                size: 20,
              ),
              const SizedBox(width: 8),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primary,
                  fontFamily: 'IBMPlexSansArabic',
                ),
              ),
              const Spacer(),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: AppColors.primary.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  '${availableSlots.length} متاح',
                  style: const TextStyle(
                    fontSize: 12,
                    color: AppColors.primary,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'IBMPlexSansArabic',
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Wrap(
            spacing: 8.0,
            runSpacing: 8.0,
            children: availableSlots.map((slot) {
              final isSelected = ctrl.selectedTime.hour == slot.hour &&
                  ctrl.selectedTime.minute == slot.minute &&
                  ctrl.didUserSeletedDateOfDay;

              return GestureDetector(
                onTap: () => ctrl.selectTimeSlot(slot),
                child: Container(
                  width: 100,
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                  decoration: BoxDecoration(
                    color: isSelected
                        ? AppColors.primary
                        : AppColors.primary.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: isSelected ? AppColors.primary : AppColors.primary.withValues(alpha: 0.3),
                      width: 1.5,
                    ),
                  ),
                  child: Column(
                    children: [
                      Text(
                        slot.formattedTime,
                        style: TextStyle(
                          color: isSelected ? Colors.white : AppColors.primary,
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          fontFamily: 'IBMPlexSansArabic',
                        ),
                      ),
                      const SizedBox(height: 4),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.person,
                            size: 12,
                            color: isSelected
                                ? Colors.white.withValues(alpha: 0.8)
                                : AppColors.primary.withValues(alpha: 0.7),
                          ),
                          const SizedBox(width: 2),
                          Text(
                            '${slot.availableDrivers.length}',
                            style: TextStyle(
                              color: isSelected
                                  ? Colors.white.withValues(alpha: 0.8)
                                  : AppColors.primary.withValues(alpha: 0.7),
                              fontSize: 11,
                              fontFamily: 'IBMPlexSansArabic',
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
