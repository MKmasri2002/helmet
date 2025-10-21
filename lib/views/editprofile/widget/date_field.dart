import 'package:flutter/material.dart';

class DateField extends StatelessWidget {
  const DateField({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "تاريخ الميلاد",
          style: TextStyle(
            fontFamily: 'IBM Plex Sans Arabic',
            fontWeight: FontWeight.w500,
            fontSize: 14,
            color: Color(0xff121212),
          ),
        ),
        const SizedBox(height: 20),
        SizedBox(
          width: 340,
          height: 50,
          child: TextFormField(
            keyboardType: TextInputType.datetime,
            initialValue: "30-5-1998",
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 16, color: Colors.grey),
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(vertical: 15, horizontal: 12),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(color: Colors.grey, width: 1.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(color: Colors.grey, width: 1.0),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
