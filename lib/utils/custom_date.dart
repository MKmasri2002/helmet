

import 'package:date_picker_plus/date_picker_plus.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CustomDate {

  static String getDateDDMMYYYYFromMillisecond(int msDate){
    var d = DateFormat("dd-MM-yyyy",);
    return d.format(DateTime.fromMillisecondsSinceEpoch(msDate));
  }

  static String getDateDDMMYYYYHHmmssFromMillisecond(int msDate){
    var d = DateFormat("dd-MM-yyyy hh:mm:ss a",);
    return d.format(DateTime.fromMillisecondsSinceEpoch(msDate));
  }

  static String getDateTimeHHmmssFromMillisecond(int msDate){
    var d = DateFormat("dd-MM-yyyy hh:mm a",);
    String s = "${d.format(DateTime.fromMillisecondsSinceEpoch(msDate)).split(" ")[1]} ${d.format(DateTime.fromMillisecondsSinceEpoch(msDate)).split(" ")[2]}";
    return s;
  }

  static int currentDateAtMillisecond(){
    return DateTime.now().millisecondsSinceEpoch;
  }

  static int currentMillisecondsFromDDMMYYYY(){
    DateTime tempDate = DateFormat("dd-MM-yyyy").parse(getDateDDMMYYYYFromMillisecond(currentDateAtMillisecond()));
    return tempDate.millisecondsSinceEpoch;
  }


  static String timeOfDayIn12Format(TimeOfDay timeOfDay){
    const MaterialLocalizations localizations = DefaultMaterialLocalizations();
    return localizations.formatTimeOfDay(timeOfDay, alwaysUse24HourFormat: false);
  }

  static TimeOfDay timeOfDayFromString(String time){
    final DateFormat format = DateFormat("hh:mm a"); // تنسيق الوقت
    final DateTime dateTime = format.parse(time); // تحويل النص إلى DateTime
    return TimeOfDay.fromDateTime(dateTime);
  }

  static Future<int> chooseDate(BuildContext context)async{
    var d= await showDatePickerDialog(
      context: context,
      initialDate: DateTime.now(),
      minDate: DateTime.now(),
      maxDate: DateTime(2060, 10, 30),
      width: 300,
      height: 300,
      currentDate: DateTime.now(),
      selectedDate:DateTime.now(),
      currentDateDecoration: const BoxDecoration(),
      currentDateTextStyle: const TextStyle(),
      daysOfTheWeekTextStyle: const TextStyle(),
      disabledCellsTextStyle: const TextStyle(),
      enabledCellsDecoration: const BoxDecoration(),
      enabledCellsTextStyle: const TextStyle(),
      initialPickerType: PickerType.days,
      selectedCellDecoration: const BoxDecoration(),
      selectedCellTextStyle: const TextStyle(),
      leadingDateTextStyle: const TextStyle(),
      slidersColor: Colors.lightBlue,
      highlightColor: Colors.redAccent,
      slidersSize: 20,
      splashColor: Colors.lightBlueAccent,
      splashRadius: 40,
      centerLeadingDate: true,
    );

    return d!.millisecondsSinceEpoch;
  }

  static Future<TimeOfDay> chooseTime(BuildContext context)async{
    var d= await showTimePicker(
      context: context,
       initialTime: TimeOfDay.now(),
    );

    return d!;
  }


  static Future<String> getCurrentMonth()async{
    return DateFormat.MMMM().format(DateTime.now());
  }

  static Map<dynamic,dynamic> differenceBetweenTowDatesDaysHoursMinuts(int date1 ,int date2){
    DateTime d1 = DateTime.fromMillisecondsSinceEpoch(date1);
    DateTime d2 = DateTime.fromMillisecondsSinceEpoch(date2);
    // Calculate the difference
    Duration diff = d2.difference(d1);

    // Extract days, hours, and minutes
    int days = diff.inDays;
    int hours = diff.inHours % 24;
    int minutes = diff.inMinutes % 60;
    int seconds = diff.inSeconds % 60;


    var temp = {
      "days": days,
      "hours":hours,
      "minutes":minutes,
      "seconds":seconds,
    };
    return temp;
  }
}
