import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart'; // 👈 استدعاء المكتبة
import 'package:helmet_customer/views/editprofile/edit_controller.dart';
import 'package:helmet_customer/views/editprofile/widget/date_field.dart';
import 'package:helmet_customer/views/editprofile/widget/delet_account.dart';
import 'package:helmet_customer/views/editprofile/widget/gender_sellector.dart';
import 'package:helmet_customer/views/editprofile/widget/name_field.dart';
import 'package:helmet_customer/views/editprofile/widget/update_button.dart';

class EditPage extends StatefulWidget {
  const EditPage({super.key});

  @override
  State<EditPage> createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<EditController>(
      builder: (ctrl) {
        return Directionality(
          textDirection: TextDirection.rtl,
          child: Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              backgroundColor: Colors.white,
              title: const Text("تعديل الحساب"),
              centerTitle: true,
              toolbarHeight: 72.h, // 👈 متكيفة
              titleTextStyle: TextStyle(
                fontFamily: 'IBM Plex Sans Arabic',
                fontWeight: FontWeight.w500,
                fontSize: 16.sp, // 👈 متكيف
                color: const Color(0xff121212),
              ),
              leading: IconButton(
                onPressed: () => Get.back(),
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: Colors.black,
                  size: 16.w, // 👈 متكيف
                ),
              ),
            ),
            body: SafeArea(
              child: Padding(
                padding: EdgeInsets.all(20.w), // 👈 متكيف
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(height: 20.h),
                      const NameFields(),
                      SizedBox(height: 40.h),
                      const DateField(),
                      SizedBox(height: 40.h),
                      const GenderSelector(),
                      SizedBox(height: 30.h),
                      const UpdateButton(),
                      SizedBox(height: 30.h),
                      const DeleteAccountText(),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
