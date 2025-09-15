import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:helmet_customer/generated/assets.dart';
import 'package:helmet_customer/theme/app_colors.dart';
import 'package:helmet_customer/theme/app_size.dart';
import 'package:helmet_customer/utils/widgets/custom_nav_bar.dart';
import 'package:helmet_customer/views/booking/booking_binding.dart';
import 'package:helmet_customer/views/booking/booking_view/booking_view.dart';
import 'package:helmet_customer/views/home/home_screen/widget/silver_app_bar/silver_app_bar.dart';
import 'package:helmet_customer/views/home/home_screen/widget/silver/silvers.dart';
import 'package:helmet_customer/views/order_status/order_status_binding.dart';
import 'package:helmet_customer/views/order_status/order_status_view.dart';
import '../home_controller.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (ctrl) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: SafeArea(
            child: CustomScrollView(
              slivers: [
                SilverAppBar(adsCarusel: ctrl.adsCaruselPackages),
                const SliverToBoxAdapter(
                  child: Silvers(),
                ),
              ],
            ),
          ),

          /// الجزء المهم
          bottomNavigationBar: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (ctrl.nearest != null && ctrl.nearest?.remainingTime != null)
                Container(
                  width: AppSize.width,
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                      color: AppColors.primary,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(16),
                          topRight: Radius.circular(16))),
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        SvgAssets.stopWatch,
                        height: 24,
                        width: 24,
                        colorFilter: const ColorFilter.mode(
                            AppColors.white, BlendMode.srcIn),
                      ),
                      SizedBox(
                        width: AppSize.width * 0.03,
                      ),
                      Text(
                        ctrl.nearest!.remainingTime!.inHours >= 1
                            ? "الحجز القادم خلال ${ctrl.nearest?.remainingTime!.inHours} ساعة"
                            : "الحجز القادم خلال ${ctrl.nearest?.remainingTime!.inMinutes} دقيقة",
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          height: 1.5,
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(
                        width: AppSize.width * 0.15,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          if (FirebaseAuth.instance.currentUser == null) {
                            Get.snackbar('Error', 'Please login first',
                                snackPosition: SnackPosition.BOTTOM,
                                backgroundColor: Colors.red,
                                colorText: Colors.white,
                                duration: const Duration(seconds: 3));
                            return;
                          }

                          if (ctrl.nearest!.washCount! > 1 &&
                              ctrl.nearest!.washType! == 'subscription' &&
                              ctrl.nearest!.washStatus! == 'pending') {
                            Get.to(
                              () => const BookingView(newOrder: true),
                              binding: BookingBinding(),
                            );
                            return;
                          }
                          Get.to(
                            () => const OrderStatusView(),
                            binding: OrderStatusBinding(),
                            arguments: washDataTripModel,
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white, // لون الخلفية
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(10), // صفر = حواف مربعة
                          ),
                          padding: const EdgeInsets.symmetric(
                              vertical: 14, horizontal: 40),
                        ),
                        child: Text(
                          "عرض",
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: AppColors.primary,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            height: 1.5,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              const CustomNavBar(pos: 1),
            ],
          ),
        );
      },
    );
  }
}
