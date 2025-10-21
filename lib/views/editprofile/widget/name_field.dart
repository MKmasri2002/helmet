import 'package:flutter/material.dart';

class NameFields extends StatelessWidget {
  const NameFields({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildField("الإسم الاول", "Ahmad"),
        const SizedBox(width: 10),
        _buildField("إسم العائلة", "Khaled"),
      ],
    );
  }

  Widget _buildField(String label, String initialValue) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontFamily: 'IBM Plex Sans Arabic',
            fontWeight: FontWeight.w500,
            fontSize: 14,
            color: Color(0xff121212),
          ),
        ),
        const SizedBox(height: 20),
        SizedBox(
          width: 155,
          height: 50,
          child: TextFormField(
            initialValue: initialValue,
            textAlign: TextAlign.left,
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
