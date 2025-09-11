// import 'package:flutter/material.dart';
// import 'package:helmet_customer/theme/app_size.dart';
// import 'package:helmet_customer/utils/colors/color1.dart';
// import 'package:helmet_customer/utils/tools/tools.dart';

// class Button1 extends StatelessWidget {
//   const Button1({super.key, required this.controller});
//   final TextEditingController controller;
//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       width: AppSize.width, // عرض الزر
//       height: AppSize.height * 0.07, // ارتفاع الزر (مثلاً 7% من ارتفاع الشاشة)
//       child: ElevatedButton(
//         style: ElevatedButton.styleFrom(
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(16), // الزوايا
//           ),
//           backgroundColor: primaryColor,
//         ),
//         onPressed: () {
//           appTools.unFocusKeyboard(context);
//           controller.sendOTP(controller.phone);
//         },
//         child: controller.isLoading
//             ? CircularProgressIndicator(color: Colors.white)
//             : Text(
//                 "Sign In".tr,
//                 textAlign: TextAlign.center,
//                 style: TextStyle(
//                   color: Colors.white,
//                   fontSize: 18,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//       ),
//     );
//   }
// }
