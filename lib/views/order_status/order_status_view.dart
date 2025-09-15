import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:helmet_customer/generated/assets.dart';
import 'package:helmet_customer/theme/app_size.dart';
import 'package:helmet_customer/utils/colors/color1.dart';
import 'package:helmet_customer/utils/languages/translation_data.dart';
import 'package:helmet_customer/utils/tools/tools.dart';
import 'package:helmet_customer/views/widget/custom_text.dart';
import 'package:helmet_customer/views/home/home_controller.dart';
import 'package:helmet_customer/views/order_status/order_status_controller.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:helmet_customer/views/order_status/widget/estimated_time_widget.dart';

class OrderStatusView extends StatelessWidget {
  const OrderStatusView({super.key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<OrderStatusController>(
      builder: (ctrl) {
        return Scaffold(
          backgroundColor: const Color.fromARGB(255, 224, 243, 252),
          appBar: AppBar(
            title: Text(TranslationData.reservationDetailes.tr),
            centerTitle: true,
          ),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Text(
                        "رقم الحجز  1238764",
                        style: TextStyle(
                            fontSize: 18, height: 1.5, color: Colors.black),
                      ),
                      const Icon(
                        Icons.copy,
                        color: Color(0xff8193B3),
                      ),
                      SizedBox(
                        width: AppSize.width * 0.3,
                      ),
                      const Text(
                        "القادمة",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            height: 1.5,
                            color: Color(0xff29C1F2)),
                      ),
                    ],
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: SvgPicture.asset(
                      SvgAssets.biker,
                    ),
                  ),
                  const SizedBox(height: 20),
                  CustomText(
                    text: TranslationData.thankYouForOrder.tr,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  CustomText(
                    text: TranslationData.trackYourOrder.tr,
                    fontSize: 12,
                    fontWeight: FontWeight.normal,
                    color: Colors.grey,
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(
                            text: TranslationData.estimatedTime.tr,
                            fontSize: 12,
                            fontWeight: FontWeight.normal,
                            color: Colors.grey,
                          ),
                          CustomText(
                            text: '20 - 60 min',
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: primaryColor,
                          ),
                        ],
                      ),
                      Container(
                        padding: const EdgeInsets.all(6),
                        decoration: BoxDecoration(
                          color: Colors.grey.withValues(alpha: 0.2),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: CustomText(
                          text: washDataTripModel.washStatus!.tr,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: primaryColor,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  EstimatedTimeWidget(
                    status: ctrl
                        .updateOrderStatus(ctrl.washDataTripModel.washStatus!),
                  ),
                  const SizedBox(height: 16),
                  CustomText(
                    text: TranslationData.yourOrder.tr,
                  ),
                  const SizedBox(height: 8),
                  if (ctrl.washItems.isNotEmpty)
                    ListView.builder(
                      shrinkWrap: true,
                      padding: EdgeInsets.zero,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: ctrl.washItemsAfterFiltering.length,
                      itemBuilder: (context, index) {
                        final item = ctrl.washItemsAfterFiltering[index];
                        return Row(
                          children: [
                            CustomText(
                              text: Get.locale!.languageCode == 'ar'
                                  ? item.nameAr!
                                  : item.nameEn!,
                              fontSize: 16,
                              fontWeight: FontWeight.normal,
                            ),
                            const SizedBox(width: 8),
                            CircleAvatar(
                              radius: 10,
                              backgroundColor: primaryColor,
                              child: const Icon(
                                Icons.check,
                                color: Colors.white,
                                size: 14,
                              ),
                            ),
                            const Spacer(),
                            CustomText(
                              text: '${item.price}',
                              fontSize: 16,
                              fontWeight: FontWeight.normal,
                              color: primaryColor,
                            ),
                            const SizedBox(width: 4),
                            Image.asset(
                              Assets.reyalBlack,
                              width: 16,
                              height: 20,
                            ),
                          ],
                        );
                      },
                    ),
                  const SizedBox(height: 8),
                  Divider(
                    color: Colors.grey.withValues(alpha: 0.2),
                    thickness: 3,
                  ),
                  if (ctrl.washDataTripModel.driverPhone != null)
                    ListTile(
                      contentPadding: EdgeInsets.zero,
                      leading: const Icon(Icons.car_rental_outlined),
                      title: CustomText(
                        text: ctrl.washDataTripModel.driverName ?? '',
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                      ),
                      subtitle: CustomText(
                        text: ctrl.washDataTripModel.driverPhone ?? '',
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                        color: Colors.grey,
                      ),
                      trailing: IconButton(
                        onPressed: () {
                          ctrl.callDriver(ctrl.washDataTripModel.driverPhone!);
                        },
                        icon: Icon(
                          Icons.call,
                          color: primaryColor,
                        ),
                      ),
                    ),
                  const SizedBox(height: 8),
                  if (ctrl.washDataTripModel.userLat != null)
                    ListTile(
                      contentPadding: EdgeInsets.zero,
                      leading: const Icon(Icons.location_on),
                      title: CustomText(
                        text: TranslationData.userLocation.tr,
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                      ),
                      subtitle: CustomText(
                        text: ctrl.userAddress.isNotEmpty
                            ? ctrl.userAddress
                            : 'Fetching location...',
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                        color: Colors.grey,
                      ),
                      onTap: () {
                        appTools.openMap(
                          ctrl.washDataTripModel.userLat!,
                          ctrl.washDataTripModel.userLng!,
                        );
                      },
                    ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
