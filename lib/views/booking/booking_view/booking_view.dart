import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:helmet_customer/generated/assets.dart';
import 'package:helmet_customer/theme/app_size.dart';
import 'package:helmet_customer/utils/colors/color1.dart';
import 'package:helmet_customer/utils/tools/tools.dart';
import 'package:helmet_customer/views/booking/booking_view/widget/location/booking_map.dart';
import 'package:helmet_customer/views/booking/booking_view/widget/location/select_location.dart';
import 'package:helmet_customer/views/widget/custom_text.dart';
import 'package:helmet_customer/views/booking/booking_controller.dart';
import 'package:helmet_customer/views/booking/booking_view/widget/buy_wash_items.dart';
import 'package:helmet_customer/views/booking/booking_view/widget/choose_car_widget.dart';
import 'package:helmet_customer/views/booking/booking_view/widget/date_builder.dart';
import 'package:helmet_customer/views/booking/booking_view/widget/payment_sheet.dart';
import 'package:helmet_customer/views/booking/booking_view/widget/time_of_day_timeline.dart';
import 'package:helmet_customer/views/home/home_controller.dart';

class BookingView extends StatelessWidget {
  const BookingView({
    super.key,
    required this.newOrder,
  });
  final bool newOrder;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<BookingController>(
      builder: (ctrl) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Booking'),
            centerTitle: true,
          ),
          body: Stack(
            children: [
              SizedBox(
                height: AppSize.height,
                width: AppSize.width,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const BookingMap(),
                      const SelectLocation(),
                      const SizedBox(
                        height: 20,
                      ),
                      const ChooseCarsWidget(),
                      if (ctrl.selectedCars.isNotEmpty) const DateBuilder(),
                      const SizedBox(
                        height: 20,
                      ),
                      if (ctrl.didUserSeletedDate) const TimeOfDayTimeline(),
                      const SizedBox(
                        height: 20,
                      ),
                      if (ctrl.didUserSeletedDateOfDay) const BuyWashItems(),
                      if (ctrl.didUserSeletedDateOfDay)
                        const SizedBox(
                          height: 90,
                        ),
                    ],
                  ),
                ),
              ),
              if (ctrl.didUserSeletedDateOfDay)
                Positioned(
                  bottom: 0,
                  child: Container(
                    padding: const EdgeInsets.only(
                        bottom: 32, top: 16, left: 16, right: 16),
                    width: MediaQuery.sizeOf(context).width,
                    decoration: BoxDecoration(
                      color: primaryColor,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                    ),
                    child: Row(
                      children: [
                        const Icon(Icons.receipt_long_outlined,
                            color: Colors.white, size: 70),
                        const SizedBox(
                          width: 10,
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const CustomText(
                              text: "Total Price",
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                            ),
                            Row(
                              children: [
                                CustomText(
                                  text: ctrl.totalPrice.toString(),
                                  fontSize: 32,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white,
                                ),
                                const SizedBox(
                                  width: 8,
                                ),
                                Image.asset(
                                  Assets.reyal,
                                  width: 25,
                                )
                              ],
                            ),
                          ],
                        ),
                        const Spacer(),
                        ElevatedButton(
                          onPressed: () {
                            if (ctrl.totalPrice != 0 && newOrder) {
                              appTools.showCustomBottomSheet(
                                  context, const PaymentSheet(), true);
                              return;
                            }
                            ctrl.createOrder();
                          },
                          style: ElevatedButton.styleFrom(
                            minimumSize: const Size(100, 60),
                            backgroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: CustomText(
                            text: 'Continue',
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: primaryColor,
                          ),
                        )
                      ],
                    ),
                  ),
                )
            ],
          ),
        );
      },
    );
  }
}
