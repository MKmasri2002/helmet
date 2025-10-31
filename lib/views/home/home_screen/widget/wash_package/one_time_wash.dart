import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:helmet_customer/generated/assets.dart';
import 'package:helmet_customer/models/wash_models/package_model.dart';
// import 'package:helmet_customer/models/wash_models/order.dart';
import 'package:helmet_customer/models/wash_models/order.dart';
import 'package:helmet_customer/theme/app_colors.dart';
import 'package:helmet_customer/utils/constants.dart';
import 'package:helmet_customer/utils/global/global.dart';
import 'package:helmet_customer/utils/languages/translation_data.dart';
import 'package:helmet_customer/views/booking/booking_binding.dart';
import 'package:helmet_customer/views/booking/booking_view/booking_view.dart';
import 'package:helmet_customer/views/home/home_controller.dart';
import 'package:helmet_customer/views/widget/custom_text.dart';

class OneTimeWash extends StatelessWidget {
  const OneTimeWash({super.key, required this.package});
  final List<PackageModel> package;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (ctrl) {
        return Column(
          children: [
            Row(
              children: [
                const SizedBox(
                  width: 16,
                ),
                CustomText(
                  text: TranslationData.oneTimeWash.tr,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ],
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: 290,
              child: ListView.builder(
                itemCount: package.length,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      if (ctrl.checkLogin() == false) {
                        ctrl.pleaseLogin();
                        return;
                      }
                      if (ctrl.checkLocation() == false) {
                        ctrl.pleaseSelectLocation();
                        return;
                      }
                      order = OrderModel(
                        areaId: userModel.addresses
                            ?.firstWhere(
                              (addr) => addr.defaultLocation == true,
                              orElse: () => userModel.addresses!.first,
                            )
                            .areaId,
                        user_id: userModel.uid,
                        driverId: drivers.firstWhere(  
                          (driver) => driver.areaId == userModel
                              .addresses
                              ?.firstWhere(
                                (addr) => addr.defaultLocation == true,
                                orElse: () => userModel.addresses!.first,
                              )
                              .areaId,
                          orElse: () => drivers.first,
                        ).id,
                        status: 'pending',
                        price: package[index].price,
                        titleAr: package[index].nameAr,
                        titleEn: package[index].nameEn,
                        type: 'one_time',
                      );

                      Get.to(
                          () => const BookingView(
                                newOrder: false,
                              ),
                          binding: BookingBinding(),
                          arguments: {'product': order}
                          );
                    },
                    child: Container(
                      margin: const EdgeInsets.only(right: 12),
                      padding: const EdgeInsets.all(16),
                      width: MediaQuery.of(context).size.width * 0.7,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withValues(alpha: 0.1),
                            spreadRadius: 1,
                            blurRadius: 4,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          // Use Material Icon instead of SVG for better compatibility
                          Image.asset(
                            'assets/images/one_wash.png',
                            height: 150,
                            width: 150,
                          ),
                          const SizedBox(height: 8),
                          CustomText(
                            text: package[index].nameEn ?? 'One Time Wash',
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 4),
                          CustomText(
                            text: package[index].descriptionEn ?? '',
                            fontSize: 12,
                            color: Colors.grey,
                            textAlign: TextAlign.center,
                            maxLines: 2,
                          ),
                          const Spacer(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CustomText(
                                text: '${package[index].price ?? 0}',
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: AppColors.primary,
                              ),
                              SvgPicture.asset(
                                SvgAssets.reyal,
                                height: 14,
                                width: 14,
                                color: AppColors.primary,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        );
      },
    );
  }
}
