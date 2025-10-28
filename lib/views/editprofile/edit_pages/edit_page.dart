import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:helmet_customer/utils/languages/translation_data.dart';
import 'package:helmet_customer/views/editprofile/edit_controller.dart';
import 'package:helmet_customer/views/editprofile/widget/date_field.dart';
import 'package:helmet_customer/views/editprofile/widget/gender_sellector.dart';
import 'package:helmet_customer/views/editprofile/widget/name_field.dart';
import 'package:helmet_customer/views/editprofile/widget/update_button.dart';
import 'package:helmet_customer/views/profile/controller/profile_screen_controller.dart';


class EditProfilePage extends StatelessWidget {
  const EditProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(EditController());

    return// Directionality(
     // textDirection: TextDirection.rtl,
      /*child:*/ Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
              backgroundColor: Colors.white,
              title: Text(TranslationData.editAccount.tr),
              centerTitle: true,
              toolbarHeight: 72,
              titleTextStyle: const TextStyle(
                fontFamily: 'IBM Plex Sans Arabic',
                fontWeight: FontWeight.w500,
                fontStyle: FontStyle.normal,
                fontSize: 16,
                height: 1.5,
                letterSpacing: 0,
                color: Color(0xff121212),
              ),

              leading: IconButton(
                onPressed: () {
                  Get.find<ProfileScreenController>().update();
                  Get.back();
                },
                icon: Icon(Icons.arrow_back_ios, color: Colors.black, size: 16),
              ),
            ),
        body: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                                const SizedBox(height: 10),

                NameFields(controller: controller),
                const SizedBox(height: 30),
                DateField(controller: controller),
                const SizedBox(height: 40),
                GenderSelector(controller: controller),
                const SizedBox(height: 45),
                UpdateButton(controller: controller),
              ],
            ),
          ),
        ),
    //  ),
    );
  }
}
