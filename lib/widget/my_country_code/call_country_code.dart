import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:helmet_customer/widget/my_country_code/caountry_widget.dart';
import 'package:helmet_customer/widget/my_country_code/country_code_method.dart';
import 'package:helmet_customer/widget/text/headline5.dart';

class CallCountryCodeIcon extends GetView<CountryCodeMethod> {
  const CallCountryCodeIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) => Obx(
        () => GestureDetector(
          child: Container(
            padding: const EdgeInsets.all(2),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                const SizedBox(width: 16),
                myCountryCodeMethod.flagWidget(
                  mainCountryCode.value,
                ),
                
              ],
            ),
          ),
          onTap: () {
            Get.lazyPut<CountryCodeMethod>(() => CountryCodeMethod());
            showCustomBottomSheet(
              context,
              const NadCountryCodeWidget(),
              true,
            );
          },
        ),
      );
}
