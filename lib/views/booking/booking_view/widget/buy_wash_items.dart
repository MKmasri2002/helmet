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
            childAspectRatio: 0.81,
            crossAxisSpacing: 8,
            mainAxisSpacing: 16,
          ),
          itemCount: ctrl.washItems.length,
          itemBuilder: (context, index) {
            final item = ctrl.washItems[index];
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.network(
                  item.image ?? '',
                  height: 100,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                Text(item.nameEn ?? ''),
                Text(item.descriptionEn ?? ''),
                Text('\$${item.price ?? 0}'),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.remove_circle_outline,
                          color: AppColors.primary),
                      onPressed: () {
                        // Logic to decrease quantity
                        // if (item.quantity != null && item.quantity! > 0) {
                        //   item.quantity = (item.quantity ?? 1) - 1;
                        //   ctrl.totalPrice -= item.price!.toInt();
                        //   washDataTripModel.washPrice =
                        //       washDataTripModel.washPrice! -
                        //           item.price!.toDouble();
                        // } else {
                        //   // Remove item if quantity is 1
                        //   if (washItemsAfterFiltering.isNotEmpty) {
                        //     washItemsAfterFiltering.removeAt(index);
                        //     ctrl.totalPrice -= item.price!.toInt();
                        //     washDataTripModel.washPrice =
                        //         washDataTripModel.washPrice! -
                        //             item.price!.toDouble();
                        //   }
                        // }
                        ctrl.update();
                      },
                    ),
                    Text('Quantity: ${item.quantity ?? 0}'),
                    IconButton(
                      icon: const Icon(
                        Icons.add_circle_outline,
                        color: AppColors.primary,
                      ),
                      onPressed: () {
                        // Logic to increase quantity
                        item.quantity = (item.quantity ?? 0) + 1;
                        ctrl.totalPrice += item.price!.toInt();
                        // washDataTripModel.washPrice =
                        //     washDataTripModel.washPrice! + item.price!.toDouble();
                        ctrl.update();
                      },
                    ),
                  ],
                ),
              ],
            );
          },
        ),
      );
    });
  }
}
