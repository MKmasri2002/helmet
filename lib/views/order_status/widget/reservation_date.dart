import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:helmet_customer/generated/assets.dart';
import 'package:helmet_customer/views/home/home_controller.dart';
import 'package:helmet_customer/views/order_status/order_status_controller.dart';
import 'package:intl/intl.dart' as intl;

class Component8 extends StatelessWidget {
  const Component8({super.key});

  /// Formats DateTime to Arabic date and time format
  /// Returns formatted string like: "15 سبتمبر 2025 - 02:30 م"
  String formatDateTime(dynamic dateTimeValue) {
    if (dateTimeValue == null) {
      return 'غير محدد';
    }

    try {
      DateTime dateTime;

      // Handle different input types
      if (dateTimeValue is DateTime) {
        dateTime = dateTimeValue;
      } else if (dateTimeValue is String) {
        if (dateTimeValue.isEmpty) return 'غير محدد';
        dateTime = DateTime.parse(dateTimeValue);
      } else {
        return dateTimeValue.toString();
      }

      // Set Arabic locale for date formatting
      final arabicDateFormat = intl.DateFormat('dd MMMM yyyy', 'en');
      final timeFormat = intl.DateFormat('hh:mm a', 'en');

      String formattedDate = arabicDateFormat.format(dateTime);
      String formattedTime = timeFormat.format(dateTime);

      return '$formattedDate - $formattedTime';
    } catch (e) {
      // If parsing fails, return a fallback
      return 'تاريخ غير صالح';
    }
  }

  /// Alternative simple formatter for just date
  String formatDateOnly(dynamic dateTimeValue) {
    if (dateTimeValue == null) return 'غير محدد';

    try {
      DateTime dateTime;
      if (dateTimeValue is DateTime) {
        dateTime = dateTimeValue;
      } else if (dateTimeValue is String) {
        if (dateTimeValue.isEmpty) return 'غير محدد';
        dateTime = DateTime.parse(dateTimeValue);
      } else {
        return dateTimeValue.toString();
      }

      return intl.DateFormat('dd/MM/yyyy').format(dateTime);
    } catch (e) {
      return 'تاريخ غير صالح';
    }
  }

  /// Alternative simple formatter for just time
  String formatTimeOnly(dynamic dateTimeValue) {
    if (dateTimeValue == null) return 'غير محدد';

    try {
      DateTime dateTime;
      if (dateTimeValue is DateTime) {
        dateTime = dateTimeValue;
      } else if (dateTimeValue is String) {
        if (dateTimeValue.isEmpty) return 'غير محدد';
        dateTime = DateTime.parse(dateTimeValue);
      } else {
        return dateTimeValue.toString();
      }

      return intl.DateFormat('hh:mm a', 'en').format(dateTime);
    } catch (e) {
      return 'وقت غير صالح';
    }
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OrderStatusController>(builder: (ctrl) {
      return Container(
        margin: const EdgeInsets.symmetric(vertical: 15),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: const Color(0xffC3CCD3)),
          borderRadius: const BorderRadius.all(Radius.circular(16)),
        ),
        child: Row(
          children: [
            SvgPicture.asset(
              SvgAssets.dateIcon,
              fit: BoxFit.cover,
              width: 22.21,
              height: 23.29,
            ),
            const SizedBox(width: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Text(
                  "التاريخ والوقت",
                  style: TextStyle(
                    fontFamily: 'IBMPlexSansArabic',
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                    height: 25 / 14,
                    letterSpacing: 0,
                    color: Color(0xff121212),
                  ),
                  textAlign: TextAlign.start,
                ),
                const SizedBox(height: 10),
                Directionality(
                  textDirection: TextDirection.ltr,
                  child: Text(
                    formatDateTime(washDataTripModel.washTimeDate),
                    style: const TextStyle(
                      fontFamily: 'IBMPlexSansArabic',
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                      height: 25 / 14,
                      letterSpacing: 0,
                      color: Color(0xff121212),
                    ),
                    textAlign: TextAlign.start,
                  ),
                ),
              ],
            )
          ],
        ),
      );
    });
  }
}
