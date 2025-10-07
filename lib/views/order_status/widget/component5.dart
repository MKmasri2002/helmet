import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:helmet_customer/generated/assets.dart';
import 'package:helmet_customer/utils/constants.dart';
import 'package:helmet_customer/views/order_status/order_status_controller.dart';
import 'package:helmet_customer/views/order_status/widget/sperator.dart';

class Component5 extends StatelessWidget {
  const Component5({super.key});
  
  @override
  Widget build(BuildContext context) {
    return GetBuilder<OrderStatusController>(builder: (ctrl) {
      return Container(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(16)),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              children: [
                SvgPicture.asset(
                  SvgAssets.personIcon,
                  fit: BoxFit.cover, // يحافظ على نسب الصورة ويملأ الـ Container
                  width: 16.25, // اختياري: عرض محدد
                  height: 17.92,

                  // اختياري: ارتفاع محدد
                ),
                const Text(
                  "تفاصيل البايكر الخاص بك",
                  style: TextStyle(
                    fontFamily: 'IBMPlexSansArabic',
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                    height: 25 / 16,
                    letterSpacing: 0,
                    color: Color(0xff121212),
                  ),
                  textAlign: TextAlign.start,
                ),
              ],
            ),
            const Sperator(),
            Row(
              children: [
                CircleAvatar(
                  backgroundImage: driverList.firstWhere((e)=> e.id == ctrl.washDataTripModel.sessions.last.driverId).imageUrl  != null
                      ? NetworkImage( driverList.firstWhere((e)=> e.id == ctrl.washDataTripModel.sessions.last.driverId).imageUrl ?? "")
                      : const AssetImage(Assets.driverImage),
                  radius: 30,
                ),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      driverList.firstWhere((e)=> e.id == ctrl.washDataTripModel.sessions.last.driverId).fullName ?? "",
                      style: const TextStyle(
                        fontFamily: 'IBMPlexSansArabic',
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                        height: 25 / 14,
                        letterSpacing: 0,
                        color: Color(0xff121212),
                      ),
                    ),
                    const Row(children: [
                      Icon(
                        Icons.star,
                        color: Colors.grey,
                      ),
                      Icon(
                        Icons.star,
                        color: Colors.yellow,
                      ),
                      Icon(
                        Icons.star,
                        color: Colors.yellow,
                      ),
                      Icon(
                        Icons.star,
                        color: Colors.yellow,
                      ),
                      Icon(
                        Icons.star,
                        color: Colors.yellow,
                      ),
                      Text(
                        "4.0",
                        style: TextStyle(
                          fontFamily: 'IBMPlexSansArabic',
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                          height: 25 / 14,
                          letterSpacing: 0,
                          color: Color(0xff121212),
                        ),
                      ),
                    ]),
                    Text(
                      
                    //  washDataTripModel.driverPhone ?? "",
                      driverList.firstWhere((e)=> e.id == ctrl.washDataTripModel.sessions.last.driverId).phoneNumber ?? "",
                      textAlign: TextAlign.start,
                      textDirection: TextDirection.ltr,
                      style: const TextStyle(
                        fontFamily: 'IBMPlexSansArabic',
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                        height: 25 / 12,
                        letterSpacing: 0,
                        color: Color(0xff8193B3),
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                CircleAvatar(
                  backgroundColor: const Color(0xff29C1F2),
                  child: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.phone,
                        color: Colors.white,
                      )),
                ),
              ],
            )
          ],
        ),
      );
    });
  }
}
