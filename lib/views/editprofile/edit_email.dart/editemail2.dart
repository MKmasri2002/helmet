// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get/get_state_manager/src/simple/get_state.dart';
// import 'package:helmet_customer/views/editprofile/edit_controller.dart';

// class Editemail2 extends StatelessWidget {
//   const Editemail2({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return GetBuilder<EditController>(
//       builder: (ctrl) {
//         return Directionality(
//           textDirection: TextDirection.rtl,
//           child: Scaffold(
//             appBar: AppBar(
//               backgroundColor: Colors.white,
//               leading: IconButton(
//                 icon: Icon(Icons.arrow_back_ios, color: Colors.black),
//                 onPressed: () => Get.back(),
//               ),
//             ),
//             body: Padding(
//               padding: const EdgeInsets.all(20),
//               child: Column(
//                 children: [
//                   Text("التحقق من البريد الإلكتروني"),
//                   SizedBox(height: 20),
//                   Text("يرجى التحقق من البريد الجديد: ${ctrl.emailController.text}"),
//                   SizedBox(height: 40),

//                   // 👇 مربع إدخال الكود (يمكنك تعديله حسب التصميم)
//                   TextFormField(
//                     maxLength: 6,
//                     keyboardType: TextInputType.number,
//                     decoration: InputDecoration(
//                       hintText: "أدخل الكود هنا",
//                       border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
//                     ),
//                     onChanged: (value) async {
//                       if (value.length == 6) {
//                         // تحقق من البريد بعد إدخال الكود
//                         await ctrl.checkEmailVerification();
//                       }
//                     },
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         );
//       },
//     );
//   }
// }
