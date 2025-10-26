import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:helmet_customer/models/subscribe.dart';
import 'package:helmet_customer/models/wash_models/package_model.dart';

import 'package:helmet_customer/views/cart/cart_binding.dart';
import 'package:helmet_customer/views/cart/cart_screen.dart';
import 'package:helmet_customer/views/home/home_screen/widget/package2pay/cartpage2.dart';
import 'package:helmet_customer/views/home/home_screen/widget/wash_package/component/component/botoom.dart';
import 'package:helmet_customer/views/home/home_screen/widget/wash_package/component/component/description.dart';
import 'package:helmet_customer/views/home/home_screen/widget/wash_package/component/component/image.dart';
import 'package:helmet_customer/views/home/home_controller.dart';
import 'package:helmet_customer/views/widget/custom_text.dart';

class Packages extends StatelessWidget {
  const Packages({super.key, required this.packages, required this.title});
  final List<PackageModel> packages;
  final String title;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (ctrl) {
      return Column(children: [
        Row(
          children: [
            const SizedBox(
              width: 16,
            ),
            CustomText(
              text: title.tr,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        ListView.builder(
          itemCount: packages.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          padding: const EdgeInsets.all(0),
          itemBuilder: (context, index) {
            return GestureDetector(
           onTap: () async {
  if (ctrl.checkLogin() == false) {
    ctrl.pleaseLogin();
    return;
  }
  if (ctrl.checkLocation() == false) {
    ctrl.pleaseSelectLocation();
    return;
  }

  // أنشئ الاشتراك مؤقت
  Subscribe newSub = Subscribe(
    userId: userModel.uid,
    titleAr: packages[index].nameAr,
    titleEn: packages[index].nameEn,
    price: packages[index].price?.toDouble() ?? 0,
    count: packages[index].count.toString(),
    remain: packages[index].count,
    isPaid: false,
  );

  // اذهب لصفحة الدفع مع الاشتراك
  Get.to(() => SubscriptionCartScreen(subscription: newSub), binding: CartBinding());
},


              child: Container(
                margin: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                padding: const EdgeInsetsDirectional.only(
                  start: 16,
                  end: 16,
                  bottom: 12,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        PackageDescription(
                            arContent: packages[index].nameAr!,
                            enContent: packages[index].nameEn!,
                            arDescription:
                                packages[index].descriptionAr!,
                            enDescription:
                                packages[index].descriptionEn!),
                        const SizedBox(
                          width: 16,
                        ),
                        HomeImage(
                          imageUrl: packages[index].image!,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Botoom(content: packages[index].price.toString())
                  ],
                ),
              ),
            );
          },
        ),
        const SizedBox(
          height: 20,
        ),
      ]);
    });
  }
}
