import 'package:flutter/material.dart';
import 'package:helmet_customer/generated/assets.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final String hint;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;

  const CustomTextField({
    super.key,
    required this.controller,
    required this.label,
    required this.hint,
    this.validator,
    this.keyboardType,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontFamily: 'IBM Plex Sans Arabic',
            fontWeight: FontWeight.w500,
            fontStyle: FontStyle.normal,
            fontSize: 14,
            height: 0.25,
            letterSpacing: 0,
            color: Color(0xff121212),
          ),
          textAlign: TextAlign.right,
        ),
        const SizedBox(height: 20),
        SizedBox(
          width: 340,
          child: TextFormField(
            controller: controller,
            keyboardType: keyboardType,
            maxLength: 10,
            validator: validator,
            decoration: InputDecoration(
              hintText: hint,
              counterText: "",
              hintStyle: const TextStyle(
                fontSize: 15,
                color: Color(0xff8193B3),
              ),
              prefixIcon: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(
                 Assets.flag,
                  height: 24,
                  width: 24,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(
                  color: Color(0xff29C1F2),
                  width: 1.0,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(
                  color: Colors.grey,
                  width: 1.0,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
