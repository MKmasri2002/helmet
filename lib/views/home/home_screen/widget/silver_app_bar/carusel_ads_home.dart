import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:helmet_customer/models/wash_models/package_model.dart';
// import 'package:helmet_customer/models/wash_models/order.dart';
import 'package:helmet_customer/theme/app_size.dart';
import 'package:helmet_customer/views/booking/booking_binding.dart';
import 'package:helmet_customer/views/booking/booking_view/booking_view.dart';
import 'package:helmet_customer/views/home/home_controller.dart';

class CaruselAdsHome extends StatelessWidget {
  final PackageModel adsData;
  const CaruselAdsHome({super.key, required this.adsData});

  void _handleTap() {
    HomeController homeController = Get.find<HomeController>();
    if (homeController.checkLogin() == false) {
      homeController.pleaseLogin();
      return;
    }
    if (homeController.checkLocation() == false) {
      homeController.pleaseSelectLocation();
      return;
    }
    log("image ${adsData.image}");
    // washDataTripModel = Order(
    //   id: adsData.id,
    //   washTitleAr: adsData.nameAr,
    //   washTitleEn: adsData.nameEn,
    //   washPrice: adsData.price,
    //   endDate: adsData.endDate,
    //   washCount: adsData.count,
    // );

    if (adsData.count == 1) {
      Get.to(() => const BookingView(newOrder: true),
          binding: BookingBinding());
    } else {
      // Get.to(() => const CartScreen(), binding: CartBinding());
    }
  }

  void _showError(String message) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Get.snackbar(
        'Error',
        message,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
        duration: const Duration(seconds: 3),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _handleTap,
      child: Center(
        child: Image.network(
          adsData.imageAdds!,
          // height: 225,
          width: AppSize.width,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
