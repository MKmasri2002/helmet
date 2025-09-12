import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:helmet_customer/generated/assets.dart';
import 'package:helmet_customer/models/wash_models/package_model.dart';
import 'package:helmet_customer/utils/constants.dart';
import 'package:helmet_customer/views/home/home_controller.dart';

class OneTimeWash extends StatelessWidget {
  const OneTimeWash({super.key, required this.package});
  final PackageModel package;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (ctrl) {
        return Container(
          padding: const EdgeInsets.all(16),
          width: screenWidth,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            children: [
              SvgPicture.asset(
                SvgAssets.oneWash,
                width: 80,
                height: 80,
              ),
            ],
          ),
        );
      },
    );
  }
}
