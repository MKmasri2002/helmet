import 'package:helmet_customer/models/dirver_model.dart';
import 'package:helmet_customer/models/schedule_model.dart';
import 'package:helmet_customer/models/wash_models/order.dart';

/// Time period for filtering time slots
enum TimePeriod { morning, evening, all }

/// Represents a time slot with availability info
class TimeSlot {
  final int hour;
  final int minute;
  final bool isAvailable;
  final List<DriverModel> availableDrivers;
  final TimePeriod period;

  TimeSlot({
    required this.hour,
    required this.minute,
    required this.isAvailable,
    required this.availableDrivers,
    required this.period,
  });

  /// Format time slot as string (e.g., "09:00 AM")
  String get formattedTime {
    final period = hour >= 12 ? 'PM' : 'AM';
    final displayHour = hour > 12 ? hour - 12 : (hour == 0 ? 12 : hour);
    return '${displayHour.toString().padLeft(2, '0')}:${minute.toString().padLeft(2, '0')} $period';
  }

  /// Check if slot is in morning period (6 AM - 12 PM)
  bool get isMorning => hour >= 6 && hour < 12;

  /// Check if slot is in evening period (12 PM - 10 PM)
  bool get isEvening => hour >= 12 && hour < 22;
}

/// Helper class to generate and manage time slots based on driver schedules
class TimeSlotManager {
  /// Generate all time slots for a specific date
  /// Returns time slots with availability info based on driver schedules and existing bookings
  static List<TimeSlot> generateTimeSlots({
    required DateTime date,
    required List<DriverModel> drivers,
    required List<OrderModel> existingBookings,
    TimePeriod period = TimePeriod.all,
    int slotIntervalMinutes = 60, // Default: 1-hour slots
  }) {
    final List<TimeSlot> timeSlots = [];
    final now = DateTime.now();

    // Define time range based on period
    int startHour = _getStartHour(period);
    int endHour = _getEndHour(period);

    // If it's today, start from next available hour
    if (date.year == now.year && 
        date.month == now.month && 
        date.day == now.day) {
      startHour = now.hour + 1 > startHour ? now.hour + 1 : startHour;
    }

    // Generate slots
    for (int hour = startHour; hour <= endHour; hour++) {
      for (int minute = 0; minute < 60; minute += slotIntervalMinutes) {
        final slotTime = DateTime(date.year, date.month, date.day, hour, minute);
        
        // Skip past times
        if (slotTime.isBefore(now)) continue;

        // Get available drivers for this slot
        final availableDrivers = _getAvailableDriversForSlot(
          slotTime: slotTime,
          drivers: drivers,
          existingBookings: existingBookings,
        );

        // Determine period
        final slotPeriod = hour < 12 ? TimePeriod.morning : TimePeriod.evening;

        // Only add if matches requested period
        if (period == TimePeriod.all || period == slotPeriod) {
          timeSlots.add(TimeSlot(
            hour: hour,
            minute: minute,
            isAvailable: availableDrivers.isNotEmpty,
            availableDrivers: availableDrivers,
            period: slotPeriod,
          ));
        }
      }
    }

    return timeSlots;
  }

  /// Get available drivers for a specific time slot
  static List<DriverModel> _getAvailableDriversForSlot({
    required DateTime slotTime,
    required List<DriverModel> drivers,
    required List<OrderModel> existingBookings,
  }) {
    final List<DriverModel> available = [];

    for (var driver in drivers) {
      // Check if driver is active and online
      if (!(driver.isActive ?? false) || !(driver.isOnline ?? false)) {
        continue;
      }

      // Check if driver has a booking at this time
      bool hasBooking = existingBookings.any((booking) {
        if (booking.driverId != driver.id) return false;
        
        final washTime = DateTime.parse(booking.washTime!);
        return washTime.year == slotTime.year &&
               washTime.month == slotTime.month &&
               washTime.day == slotTime.day &&
               washTime.hour == slotTime.hour;
      });

      if (hasBooking) continue;

      // Check driver schedule if available
      if (driver.schedule != null) {
        final dayName = _getDayName(slotTime.weekday);
        final weeklySchedule = WeeklySchedule.fromJson(driver.schedule!);
        final daySchedule = weeklySchedule.getDay(dayName);

        if (daySchedule != null && daySchedule.active) {
          // Check if slot is within working hours
          final startHour = int.parse(daySchedule.startTime.split(':')[0]);
          final endHour = int.parse(daySchedule.endTime.split(':')[0]);

          if (slotTime.hour >= startHour && slotTime.hour < endHour) {
            // Check if not during break time
            bool isDuringBreak = daySchedule.breaks.any((breakTime) {
              final breakStart = int.parse(breakTime.start.split(':')[0]);
              final breakEnd = int.parse(breakTime.end.split(':')[0]);
              return slotTime.hour >= breakStart && slotTime.hour < breakEnd;
            });

            if (!isDuringBreak) {
              available.add(driver);
            }
          }
        }
      } else {
        // No schedule means always available (during business hours)
        available.add(driver);
      }
    }

    return available;
  }

  /// Get start hour based on period
  static int _getStartHour(TimePeriod period) {
    switch (period) {
      case TimePeriod.morning:
        return 6; // 6 AM
      case TimePeriod.evening:
        return 12; // 12 PM
      case TimePeriod.all:
        return 6; // 6 AM
    }
  }

  /// Get end hour based on period
  static int _getEndHour(TimePeriod period) {
    switch (period) {
      case TimePeriod.morning:
        return 11; // 11 AM (last morning slot)
      case TimePeriod.evening:
        return 21; // 9 PM (last evening slot)
      case TimePeriod.all:
        return 21; // 9 PM
    }
  }

  /// Get day name from weekday number
  static String _getDayName(int weekday) {
    switch (weekday) {
      case DateTime.monday:
        return 'monday';
      case DateTime.tuesday:
        return 'tuesday';
      case DateTime.wednesday:
        return 'wednesday';
      case DateTime.thursday:
        return 'thursday';
      case DateTime.friday:
        return 'friday';
      case DateTime.saturday:
        return 'saturday';
      case DateTime.sunday:
        return 'sunday';
      default:
        return 'monday';
    }
  }

  /// Group time slots by period
  static Map<TimePeriod, List<TimeSlot>> groupSlotsByPeriod(List<TimeSlot> slots) {
    final Map<TimePeriod, List<TimeSlot>> grouped = {
      TimePeriod.morning: [],
      TimePeriod.evening: [],
    };

    for (var slot in slots) {
      grouped[slot.period]?.add(slot);
    }

    return grouped;
  }

  /// Get only available time slots
  static List<TimeSlot> getAvailableSlots(List<TimeSlot> slots) {
    return slots.where((slot) => slot.isAvailable).toList();
  }

  /// Get count of available slots per period
  static Map<TimePeriod, int> getAvailableSlotsCount(List<TimeSlot> slots) {
    final grouped = groupSlotsByPeriod(slots);
    return {
      TimePeriod.morning: grouped[TimePeriod.morning]!
          .where((s) => s.isAvailable)
          .length,
      TimePeriod.evening: grouped[TimePeriod.evening]!
          .where((s) => s.isAvailable)
          .length,
    };
  }
}
