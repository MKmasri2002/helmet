// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:helmet_customer/generated/assets.dart';
// import 'package:helmet_customer/theme/app_size.dart';
// import 'package:helmet_customer/views/order_status/order_status_controller.dart';

// class Component1 extends StatelessWidget {
//   const Component1({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return GetBuilder<OrderStatusController>(builder: (ctrl) {
//       return Container(
//         padding: const EdgeInsets.all(16),
//         width: AppSize.width,
//         decoration: BoxDecoration(
//           color: Colors.blue[300],
//           borderRadius: const BorderRadius.only(
//               bottomLeft: Radius.circular(16),
//               bottomRight: Radius.circular(16)),
//         ),
//         child: Row(
//           children: [
//             const Text(
//               "جايك بالطريق",
//               style: TextStyle(
//                 fontWeight: FontWeight.bold,
//                 fontSize: 16,
//                 height: 1.5,
//                 color: Colors.white,
//               ),
//             ),
//             const Spacer(),
//             const Image(image: AssetImage(Assets.iconCar)),
//             const SizedBox(
//               width: 10,
//             ),
//             Text(
//               "${ ctrl.washDataTripModel.sessions.last.cars[0].brand ?? " "}  ${ctrl.washDataTripModel.sessions.last.cars[0].model ?? " "}",
//               style: const TextStyle(
//                 fontWeight: FontWeight.bold,
//                 fontSize: 16,
//                 height: 1.5,
//                 color: Colors.white,
//               ),
//             ),
//           ],
//         ),
//       );
//     });
//   }
// }
