import 'package:flutter/material.dart';
import 'package:helmet_customer/utils/colors/color1.dart';

class TextFormField1 extends StatelessWidget {
  const TextFormField1({
    super.key,
    required this.onChanged,
    this.hintText,
    this.labelText,
    this.iconColor,
    this.icon,
    this.textEditingController,
    this.labelFontSize,
    this.initValue,
    this.iconData,
    this.prefixIcon,
  });

  final TextEditingController? textEditingController;

  final Function(String) onChanged;
  final String? labelText;
  final String? initValue;
  final String? hintText;

  final Color? iconColor;

  final double? labelFontSize;
  final IconData? icon;
  final IconData? iconData;
  final Widget? prefixIcon;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: TextFormField(
        scrollPadding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        controller: textEditingController,
        onChanged: onChanged,
        keyboardType: TextInputType.phone,
        textAlign: TextAlign.start,
        decoration: InputDecoration(
          errorMaxLines: 1,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
            borderSide: BorderSide(
              color: Colors.grey.withValues(alpha: 0.6),
              width: 1,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.black.withValues(alpha: 0.6),
              width: 1,
            ),
            borderRadius: BorderRadius.circular(12.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: primaryColor,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(12.0),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.red, width: 1),
            borderRadius: BorderRadius.circular(12.0),
          ),
          filled: true,
          prefixIcon: prefixIcon ??
              (iconData != null
                  ? Icon(
                      iconData,
                      color: iconColor ?? primaryColor,
                    )
                  : null),
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
          labelText: labelText,
        ),
        style: const TextStyle(color: Colors.black, fontSize: 18),
      ),
    );
  }
}
