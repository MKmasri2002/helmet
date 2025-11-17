import 'package:date_picker_timeline/extra/color.dart';
import 'package:flutter/material.dart';

class CustompackageTextField extends StatelessWidget {
  final TextEditingController controller;
  final String? hintText;
  final double? width;
  final Widget? prefixIcon;
  final String? sufixtext;
  final TextStyle? textStyle; // أضفنا هذا

  const CustompackageTextField({
    super.key,
    required this.controller,
    this.hintText,
    this.width = 400,
    this.prefixIcon,
    this.sufixtext,
    this.textStyle, // أضفنا هذا
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 55,
      width: width,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 0.0),
        child: TextFormField(
          keyboardType: TextInputType.number,
          controller: controller,
          textAlign: TextAlign.start,
          style:
              textStyle ?? const TextStyle(fontSize: 16, color: Colors.black),
          decoration: InputDecoration(
            hintText: hintText ?? "",
            hintStyle: const TextStyle(fontSize: 15, color: Color(0xff8193B3)),
            suffix: sufixtext != null
                ? Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: Text(
                      sufixtext!,
                      style: const TextStyle(
                        color: AppColors.defaultDeactivatedColor,
                        fontSize: 13,
                      ),
                    ),
                  )
                : null,
            prefixIcon: prefixIcon != null
                ? Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: prefixIcon,
                  )
                : null,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide:
                  const BorderSide(color: Color(0xff29C1F2), width: 1.0),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: Colors.grey, width: 1.0),
            ),
          ),
        ),
      ),
    );
  }
}

class CircularIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;
  final double size;
  final Color backgroundColor;
  final Color iconColor;

  const CircularIconButton({
    super.key,
    required this.icon,
    required this.onPressed,
    this.size = 48, // القطر الافتراضي
    this.backgroundColor = const Color(0xffF0FAFF),
    this.iconColor = const Color(0xff078EC2),
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: Material(
        color: backgroundColor,
        shape: const CircleBorder(),
        child: InkWell(
          customBorder: const CircleBorder(),
          onTap: onPressed,
          child: Center(
            child: Icon(
              icon,
              color: iconColor,
            ),
          ),
        ),
      ),
    );
  }
}
