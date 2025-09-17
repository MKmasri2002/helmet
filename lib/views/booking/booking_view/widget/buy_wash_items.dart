import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:helmet_customer/theme/app_colors.dart';
import 'package:helmet_customer/views/booking/booking_controller.dart';

class BuyWashItems extends StatelessWidget {
  const BuyWashItems({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BookingController>(builder: (ctrl) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 2,
            crossAxisSpacing: 8,
            mainAxisSpacing: 16,
          ),
          itemCount: ctrl.washItems.length,
          itemBuilder: (context, index) {
            final item = ctrl.washItems[index];
            return GestureDetector(
              onTap: () {
                ctrl.toggleWashItem(index);
              },
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: ctrl.isWashItemSelected(index) 
                        ? AppColors.primary 
                        : Colors.grey.withValues(alpha: 0.3),
                    width: ctrl.isWashItemSelected(index) ? 2 : 1,
                  ),
                ),
                child: Stack(
                  children: [
                    Positioned(
                      top: 0,
                      left: 0,
                      child: Container(
                        height: 24,
                        width: 24,
                        decoration: BoxDecoration(
                          color: ctrl.isWashItemSelected(index) 
                              ? AppColors.primary 
                              : Colors.white,
                          shape: BoxShape.circle,
                          border: Border.all(
                              color: AppColors.primary.withValues(alpha: 0.5)),
                        ),
                        child: ctrl.isWashItemSelected(index)
                            ? const Icon(
                                Icons.check,
                                color: Colors.white,
                                size: 16,
                              )
                            : null,
                      ),
                    ),
                    Row(
                      children: [
                        Image.network(
                          item.image ?? '',
                          height: 50,
                          width: 50,
                          fit: BoxFit.cover,
                        ),
                        const SizedBox(width: 8),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(item.nameEn ?? ''),
                            Text('\$${item.price ?? 0}'),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      );
    });
  }
}
