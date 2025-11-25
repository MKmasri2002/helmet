/// Schedule Models - Used for driver scheduling and availability management
/// These models support weekly schedules with break times
library;

/// Represents a break period during a work day
class BreakTime {
  final String start; // Time in HH:mm format (e.g., "13:00")
  final String end;   // Time in HH:mm format (e.g., "14:00")

  BreakTime({
    required this.start,
    required this.end,
  });

  /// Create BreakTime from JSON
  factory BreakTime.fromJson(Map<String, dynamic> json) {
    return BreakTime(
      start: json['start'] ?? '00:00',
      end: json['end'] ?? '00:00',
    );
  }

  /// Convert BreakTime to JSON
  Map<String, dynamic> toJson() {
    return {
      'start': start,
      'end': end,
    };
  }

  @override
  String toString() => 'BreakTime{start: $start, end: $end}';
}

/// Represents a single day's schedule including work hours and breaks
class DaySchedule {
  final bool active; // Whether the driver works on this day
  final String startTime; // Work start time in HH:mm format
  final String endTime;   // Work end time in HH:mm format
  final List<BreakTime> breaks; // List of break periods

  DaySchedule({
    required this.active,
    required this.startTime,
    required this.endTime,
    required this.breaks,
  });

  /// Create DaySchedule from JSON
  factory DaySchedule.fromJson(Map<String, dynamic> json) {
    return DaySchedule(
      active: json['active'] ?? false,
      startTime: json['startTime'] ?? '09:00',
      endTime: json['endTime'] ?? '17:00',
      breaks: (json['breaks'] as List<dynamic>?)
              ?.map((e) => BreakTime.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );
  }

  /// Convert DaySchedule to JSON
  Map<String, dynamic> toJson() {
    return {
      'active': active,
      'startTime': startTime,
      'endTime': endTime,
      'breaks': breaks.map((e) => e.toJson()).toList(),
    };
  }

  @override
  String toString() {
    return 'DaySchedule{active: $active, startTime: $startTime, endTime: $endTime, breaks: ${breaks.length}}';
  }
}

/// Weekly schedule helper class
/// Usage: Map<String, DaySchedule> schedule = {'monday': DaySchedule(...), 'tuesday': DaySchedule(...)}
class WeeklySchedule {
  final Map<String, DaySchedule> schedule;

  WeeklySchedule({required this.schedule});

  /// Create WeeklySchedule from JSON
  factory WeeklySchedule.fromJson(Map<String, dynamic> json) {
    Map<String, DaySchedule> scheduleMap = {};
    json.forEach((key, value) {
      scheduleMap[key] = DaySchedule.fromJson(value as Map<String, dynamic>);
    });
    return WeeklySchedule(schedule: scheduleMap);
  }

  /// Convert WeeklySchedule to JSON
  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    schedule.forEach((key, value) {
      json[key] = value.toJson();
    });
    return json;
  }

  /// Get schedule for a specific day
  DaySchedule? getDay(String day) => schedule[day.toLowerCase()];

  /// Check if driver is available on a specific day
  bool isAvailable(String day) => schedule[day.toLowerCase()]?.active ?? false;

  @override
  String toString() => 'WeeklySchedule{days: ${schedule.keys.join(", ")}}';
}
