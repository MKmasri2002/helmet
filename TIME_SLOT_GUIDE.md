# Time Slot Display System - Usage Guide

## Overview
The time slot system displays available driver time slots based on the selected time period (morning, evening, or all day).

---

## Features

### 1. **Period-Based Filtering**
- **Morning** (6 AM - 12 PM): Shows only morning time slots
- **Evening** (12 PM - 9 PM): Shows only evening time slots
- **All Day**: Shows both morning and evening slots

### 2. **Real-time Availability**
- ✅ Shows only available time slots
- 🚫 Hides fully booked slots
- 👥 Displays number of available drivers per slot
- ⏰ Excludes past time slots automatically

### 3. **Driver Schedule Integration**
- Respects driver working hours
- Excludes driver break times
- Checks driver online/active status
- Validates against existing bookings

---

## How to Use

### In Booking Flow

1. **User selects a car** → Date picker appears
2. **User selects a date** → Time slot selector appears
3. **User selects period** (Morning/Evening/All)
4. **Available slots are displayed** with driver count
5. **User taps a time slot** → Booking continues

### Period Selection Tabs

```
┌─────────────────────────────────────────┐
│  ☀️ الصباح    🌙 المساء    🕐 الكل      │
│  3 متاح      5 متاح      8 متاح        │
└─────────────────────────────────────────┘
```

### Time Slot Display

```
أوقات الصباح (6 صباحاً - 12 ظهراً)              3 متاح

┌─────────┐  ┌─────────┐  ┌─────────┐
│ 09:00 AM│  │ 10:00 AM│  │ 11:00 AM│
│  👤 2    │  │  👤 3    │  │  👤 1    │
└─────────┘  └─────────┘  └─────────┘
```

---

## Integration Points

### 1. BookingController

```dart
class BookingController extends GetxController {
  List<TimeSlot> availableTimeSlots = [];
  TimePeriod selectedPeriod = TimePeriod.all;

  // Generate time slots for selected date
  void loadTimeSlotsForDate({TimePeriod? period}) {
    selectedPeriod = period ?? TimePeriod.all;
    availableTimeSlots = TimeSlotManager.generateTimeSlots(
      date: selectedDateTime,
      drivers: currentDrivers,
      existingBookings: currentOrders,
      period: selectedPeriod,
    );
    update();
  }

  // Change period filter
  void changePeriodFilter(TimePeriod period) {
    loadTimeSlotsForDate(period: period);
  }

  // Select time slot
  void selectTimeSlot(TimeSlot slot) {
    selectedTime = TimeOfDay(hour: slot.hour, minute: slot.minute);
    didUserSeletedDateOfDay = true;
    fullDate = DateTime(...);
    update();
  }
}
```

### 2. TimeSlotManager

```dart
// Generate time slots with driver availability
final slots = TimeSlotManager.generateTimeSlots(
  date: DateTime(2025, 11, 25),
  drivers: driversList,
  existingBookings: currentOrders,
  period: TimePeriod.morning,
);

// Filter only available slots
final available = TimeSlotManager.getAvailableSlots(slots);

// Get count per period
final counts = TimeSlotManager.getAvailableSlotsCount(slots);
// Returns: {morning: 3, evening: 5}
```

### 3. TimeSlotSelector Widget

```dart
// In BookingView
if (ctrl.didUserSeletedDate) const TimeSlotSelector(),
```

---

## Data Models

### TimeSlot
```dart
class TimeSlot {
  final int hour;                          // Hour (0-23)
  final int minute;                        // Minute (0-59)
  final bool isAvailable;                  // Has available drivers?
  final List<DriverModel> availableDrivers; // Available drivers
  final TimePeriod period;                 // morning/evening

  String get formattedTime;  // "09:00 AM"
  bool get isMorning;        // hour >= 6 && hour < 12
  bool get isEvening;        // hour >= 12 && hour < 22
}
```

### TimePeriod Enum
```dart
enum TimePeriod {
  morning,  // 6 AM - 12 PM
  evening,  // 12 PM - 9 PM
  all       // All available times
}
```

---

## Availability Logic

### Time Slot is Available If:

1. ✅ **Has at least one driver** in the area
2. ✅ **Driver is active** (`isActive = true`)
3. ✅ **Driver is online** (`isOnline = true`)
4. ✅ **Driver status is Active** (not Suspended/Off-Duty)
5. ✅ **Driver has no booking** at that time
6. ✅ **Within driver's working hours** (if schedule exists)
7. ✅ **Not during driver's break time**
8. ✅ **Not in the past**

### Time Slot is Hidden If:
- ❌ All drivers are booked
- ❌ No drivers available in area
- ❌ Time is in the past
- ❌ Outside working hours

---

## Customization

### Change Time Ranges

Edit `_getStartHour()` and `_getEndHour()` in `time_slot_manager.dart`:

```dart
static int _getStartHour(TimePeriod period) {
  switch (period) {
    case TimePeriod.morning:
      return 6;   // Change morning start
    case TimePeriod.evening:
      return 12;  // Change evening start
    case TimePeriod.all:
      return 6;   // Change overall start
  }
}

static int _getEndHour(TimePeriod period) {
  switch (period) {
    case TimePeriod.morning:
      return 11;  // Change morning end
    case TimePeriod.evening:
      return 21;  // Change evening end
    case TimePeriod.all:
      return 21;  // Change overall end
  }
}
```

### Change Slot Interval

```dart
// Generate 30-minute slots instead of 1-hour
final slots = TimeSlotManager.generateTimeSlots(
  date: selectedDate,
  drivers: driversList,
  existingBookings: orders,
  period: TimePeriod.morning,
  slotIntervalMinutes: 30, // Default is 60
);
```

### Customize UI Colors

In `time_slot_selector.dart`, modify:
- `AppColors.primary` - Main color
- `Colors.grey[200]` - Background color
- Icon colors and sizes

---

## Example Scenarios

### Scenario 1: Morning Rush
```
User wants morning appointment
→ Selects "الصباح" tab
→ Sees: 08:00 AM (2 drivers), 09:00 AM (3 drivers), 10:00 AM (1 driver)
→ Selects 09:00 AM
→ Booking continues with best available driver
```

### Scenario 2: All Slots Booked
```
User selects busy date
→ All morning slots booked
→ Shows: "لا توجد مواعيد متاحة في هذه الفترة"
→ User switches to evening period
→ Evening slots available
```

### Scenario 3: Driver Schedule
```
Driver works 08:00 - 17:00 with lunch break 12:00-13:00
→ Morning slots: 08:00, 09:00, 10:00, 11:00 ✅
→ 12:00 slot: Hidden (break time) ❌
→ Evening slots: 13:00, 14:00, 15:00, 16:00 ✅
→ After 17:00: Hidden (off hours) ❌
```

---

## Testing Checklist

- [ ] Time slots generate correctly for morning period
- [ ] Time slots generate correctly for evening period
- [ ] Period switching works smoothly
- [ ] Driver count displays correctly
- [ ] Selected slot highlights properly
- [ ] Past times are hidden
- [ ] Booked slots are hidden
- [ ] Driver schedules respected
- [ ] Break times excluded
- [ ] Empty state displays when no slots available
- [ ] Integration with booking flow works
- [ ] Arabic text displays correctly

---

## Benefits

1. **Better User Experience**: Clear visual separation of morning/evening
2. **Faster Booking**: See available slots at a glance
3. **Transparency**: Shows number of available drivers
4. **Smart Filtering**: Respects driver schedules and breaks
5. **Real-time Updates**: Reflects current availability
6. **Flexible**: Easy to customize time ranges and intervals

---

**Implementation Status**: ✅ Complete and Ready to Use
**Files Modified**: 3 (time_slot_manager.dart, booking_controller.dart, time_slot_selector.dart)
**Backward Compatible**: Yes (old TimeOfDayTimeline still available)
