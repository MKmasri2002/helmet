import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:helmet_customer/views/gifts/gifts/gifts_controller.dart';

class OptionButton extends StatelessWidget {
  final String title;
  final int value;
  final TextEditingController controller;
  final String image1;
  final String? image2;
  final String? image3;

  const OptionButton({
    super.key,
    required this.title,
    required this.value,
    required this.controller,
    required this.image1,
    this.image2,
    this.image3,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<giftsController>(
      builder: (ctrl) {
        bool isSelected = ctrl.selected == value;
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: InkWell(
            onTap: () {
              ctrl.select(value);
            },
            child: Row(
              children: [
                Container(
                  width: 18,
                  height: 18,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: const Color(0xff29C1F2), width: 2),
                  ),
                  child: isSelected
                      ? Center(
                          child: Container(
                            width: 10,
                            height: 10,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color(0xff29C1F2),
                            ),
                          ),
                        )
                      : const SizedBox.shrink(),
                ),
                const SizedBox(width: 10),
                Text(
                  title,
                  style: const TextStyle(
                    fontFamily: 'IBM Plex Sans Arabic',
                    fontWeight: FontWeight.w600,
                    fontStyle: FontStyle.normal,
                    fontSize: 14,
                    height: 0.25,
                    letterSpacing: 0,
                    color: Color(0xff121212),
                  ),
                ),
                const Spacer(),
                Image.asset(image1, width: 40, height: 40),
                const SizedBox(width: 5),
                if (image2 != null) Image.asset(image2!, width: 40, height: 40),
                const SizedBox(width: 5),

                if (image3 != null) Image.asset(image3!, width: 40, height: 30),
              ],
            ),
          ),
        );
      },
    );
  }
}
