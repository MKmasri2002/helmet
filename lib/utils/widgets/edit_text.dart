import 'package:flutter/material.dart';
import 'package:helmet_customer/utils/colors/color1.dart';

class CustomEditText extends StatelessWidget {
  const CustomEditText({
    super.key,
    required this.onChanged,
    this.width,
    this.height,
    this.hintText,
    this.labelText,
    this.circular,
    this.backgroundColor,
    this.iconColor,
    this.icon,
    this.image,
    this.textInputType,
    this.obscureText,
    this.textEditingController,
    this.fontSize,
    this.textColor,
    this.labelColor,
    this.labelFontSize,
    this.hintColor,
    this.hintFontSize,
    this.initValue,
    this.prefixIcon,
    this.suffixIcon,
  });

  final TextEditingController? textEditingController;
  final double? width;
  final double? height;
  final double? circular;
  final Function(String) onChanged;
  final TextInputType? textInputType;
  final String? labelText;
  final String? initValue;
  final String? hintText;
  final Color? backgroundColor;
  final Color? iconColor;
  final Color? textColor;
  final Color? hintColor;
  final Color? labelColor;
  final double? fontSize;
  final double? hintFontSize;
  final double? labelFontSize;
  final IconData? icon;
  final String? image;
  final bool? obscureText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: TextFormField(
        controller: textEditingController,
        onChanged: onChanged,
        keyboardType: textInputType ?? TextInputType.text,
        obscureText: obscureText ?? false,
        textAlign: TextAlign.start,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.only(
            left: 12,
            right: 12,
            top: 16,
            bottom: 16,
          ),
          isDense: false,
          errorMaxLines: 4,
          suffixIcon: suffixIcon,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
            borderSide: BorderSide(
              color: Colors.grey.withValues(alpha: 0.6),
              width: 1.2,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.black.withValues(alpha: 0.6),
              width: 1.2,
            ),
            borderRadius: BorderRadius.circular(12.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide:  BorderSide(
              color: primaryColor,
              width: 1.2,
            ),
            borderRadius: BorderRadius.circular(12.0),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.red, width: 1.6),
            borderRadius: BorderRadius.circular(12.0),
          ),
          filled: true,
          prefixIcon: prefixIcon,
          prefixIconConstraints: const BoxConstraints(
            minWidth: 10,
          ),
          fillColor: Colors.white,
          hintText: hintText,
          hintStyle: TextStyle(
            color: Colors.grey.shade600,
            fontWeight: FontWeight.w400,
            fontSize: 14,
          ),
        ),
        style: TextStyle(color: textColor ?? Colors.black, fontSize: fontSize),
      ),
    );
  }
}
