// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:get/get.dart';
// import 'package:helmet_customer/generated/assets.dart';

// import 'package:helmet_customer/models/wash_models/wash_session.dart';
// import 'package:helmet_customer/theme/app_colors.dart';
// import 'package:helmet_customer/theme/app_size.dart';
// import 'package:helmet_customer/utils/custom_date.dart';
// import 'package:helmet_customer/utils/languages/translation_data.dart';
// import 'package:helmet_customer/views/widget/custom_text.dart';
// import 'package:helmet_customer/views/booking/booking_binding.dart';
// import 'package:helmet_customer/views/booking/booking_view/booking_view.dart';
// import 'package:helmet_customer/views/home/home_controller.dart';
// import 'package:helmet_customer/views/order_status/order_status_binding.dart';
// import 'package:helmet_customer/views/order_status/order_status_view.dart';

// class CurrentPackageWidget extends StatelessWidget {
//   const CurrentPackageWidget({
//     super.key,
//     required this.currentOrder,
//   });
//    final Order currentOrder;
//   @override
//   Widget build(BuildContext context) {
//     return GetBuilder<HomeController>(builder: (ctrl) {
//       return Container(
//         width: AppSize.width,
//         padding: const EdgeInsets.only(
//           left: 16,
//           right: 16,
//           top: 16,
//         ),
//         decoration: BoxDecoration(
//             color: Colors.white, borderRadius: BorderRadius.circular(16)),
//         child: Column(
//           children: [
//             Row(
//               children: [
//                 Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     // CustomText(
//                     //   text: Get.locale!.languageCode == 'ar'
//                     //       ? currentOrder.washTitleAr
//                     //       : currentOrder.washTitleEn,
//                     //   fontSize: 16,
//                     //   fontWeight: FontWeight.w700,
//                     // ),
//                     const SizedBox(
//                       height: 8,
//                     ),
//                     // if (currentOrder.endDate != null)
//                       CustomText(
//                         text:
//                             '${TranslationData.endDate.tr} ${CustomDate.getDateDDMMYYYYFromMillisecond(DateTime.parse(currentOrder.endDate!).millisecondsSinceEpoch)}',
//                         fontSize: 12,
//                         fontWeight: FontWeight.w700,
//                         color: Colors.grey,
//                       ),
//                     const SizedBox(
//                       height: 8,
//                     ),
//                     Container(
//                       width: AppSize.width * 0.35,
//                       height: AppSize.width * 0.13,
//                       decoration: BoxDecoration(
//                           borderRadius: BorderRadius.all(Radius.circular(50)),
//                           color: Color(0xff29C1F2)),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Text(
//                             TranslationData.sharePackage.tr,
//                             style: TextStyle(
//                               color: Color(0xffFFFFFF),
//                               fontFamily: 'IBMPlexSansArabic',
//                               fontWeight: FontWeight.w600,
//                               fontSize: 12,
//                               height: 1.5,
//                             ),
//                           ),
//                           SizedBox(
//                             width: 8,
//                           ),
//                           SvgPicture.asset(
//                             SvgAssets.sharePackage,
//                             fit: BoxFit
//                                 .cover, // يحافظ على نسب الصورة ويملأ الـ Container
//                             width: 22.21, // اختياري: عرض محدد
//                             height: 23.29,

//                             // اختياري: ارتفاع محدد
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//                 const Spacer(),
//                 Container(
//                   height: 80,
//                   width: 1,
//                   color: AppColors.primary,
//                 ),
//                 const SizedBox(
//                   width: 16,
//                 ),
//                 Column(
//                   children: [
//                     CustomText(
//                       text: TranslationData.remain.tr,
//                       fontSize: 14,
//                       fontWeight: FontWeight.w700,
//                     ),
//                     // CustomText(
//                     //   text:
//                     //       userOrder.isNotEmpty ? '${currentOrder.remain}' : '0',
//                     //   fontSize: 32,
//                     //   fontWeight: FontWeight.w700,
//                     //   color: AppColors.primary,
//                     // ),
//                     // CustomText(
//                     //   text: TranslationData.outOf.tr +
//                     //       " " +
//                     //       (userOrder.isNotEmpty
//                     //           ? '${currentOrder.washCount}'
//                     //           : '0'),
//                     //   fontSize: 14,
//                     //   fontWeight: FontWeight.w700,
//                     // ),
//                   ],
//                 ),
//                 const SizedBox(
//                   width: 16,
//                 ),
//               ],
//             ),
//             const SizedBox(
//               height: 16,
//             ),
//             GestureDetector(
//               onTap: () {
//                 if (ctrl.checkLogin() == false) {
//                   ctrl.pleaseLogin();
//                   return;
//                 }
//                 if (ctrl.checkLocation() == false) {
//                   ctrl.pleaseSelectLocation();
//                   return;
//                 }
//                 // washDataTripModel = currentOrder;
//                 if (currentOrder.washType! == 'subscription') {
//                   if (currentOrder.sessions.isEmpty) {
//                     Get.to(
//                       () => const BookingView(newOrder: true),
//                       binding: BookingBinding(),
//                     );
//                     return;
//                   } else {
//                     // // final WashSession? currentSession = currentOrder.sessions
//                     //     .firstWhereOrNull(
//                     //         (session) => session.status != "done");
//                     // if (currentSession != null) {
//                     //   Get.to(
//                     //     () => const OrderStatusView(),
//                     //     binding: OrderStatusBinding(),
//                     //     arguments: currentOrder,
//                     //   );
//                     //   return;
//                     // } else {
//                     //   Get.to(
//                     //     () => const BookingView(newOrder: true),
//                     //     binding: BookingBinding(),
//                     //   );
//                     // }
//                     return;
//                   }
//                 } else if (currentOrder.washType! == 'one_time') {
//                   if (currentOrder.sessions[0].status != "done") {
//                     Get.to(
//                       () => const OrderStatusView(),
//                       binding: OrderStatusBinding(),
//                       arguments: currentOrder,
//                     );
//                     return;
//                   } else {
//                     Get.snackbar('Error', 'you already used this package',
//                         snackPosition: SnackPosition.BOTTOM,
//                         backgroundColor: Colors.red,
//                         colorText: Colors.white,
//                         duration: const Duration(seconds: 3));
//                     return;
//                   }
//                 }
//               },
//               child: Container(
//                 height: 50,
//                 padding: const EdgeInsets.all(16),
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(8),
//                   color: Color(0xffF0FAFF),
//                 ),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     CustomText(
//                         text: TranslationData.usePackage.tr,
//                         fontSize: 14,
//                         fontWeight: FontWeight.w700,
//                         color: AppColors.primary),
//                     const Icon(
//                       Icons.arrow_forward_ios,
//                       color: AppColors.primary,
//                       size: 16,
//                     )
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       );
//     });
//   }
// }
