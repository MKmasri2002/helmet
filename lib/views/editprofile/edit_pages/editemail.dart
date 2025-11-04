import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:helmet_customer/utils/languages/translation_data.dart';
import 'package:helmet_customer/utils/validation/validations_metod.dart';
import 'package:helmet_customer/views/editprofile/edit_controller.dart';

class Editemail extends StatelessWidget {
  Editemail({super.key});
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<EditController>(
      builder: (ctrl) {
       // return Directionality(
        //  textDirection: TextDirection.rtl,
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              backgroundColor: Colors.white,
              leading: Padding(
                padding: const EdgeInsets.all(20),
                child: IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: const Icon(
                    Icons.arrow_back_ios,
                    color: Colors.black,
                    size: 16,
                  ),
                ),
              ),
            ),
            body: Padding(
              padding: const EdgeInsets.all(20),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const SizedBox(height: 20),
                    Text(
                      TranslationData.updateEmailAddress.tr,
                      textAlign: TextAlign.start,
                      style: const TextStyle(
                        fontFamily: 'IBM Plex Sans Arabic',
                        fontWeight: FontWeight.w500,
                        fontStyle: FontStyle.normal,
                        fontSize: 18,
                        height: 1.5,
                        color: Color(0xff121212),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                     TranslationData.pleaseenterthenewemailaddress.tr,
                      textAlign: TextAlign.start,
                      style: const TextStyle(
                        fontFamily: 'IBM Plex Sans Arabic',
                        fontSize: 15,
                        height: 1.5,
                        color: Color(0xff8193B3),
                      ),
                    ),
                    const SizedBox(height: 40),
                    Text(
                     TranslationData.Email.tr,
                      textAlign: TextAlign.start,
                      style: const TextStyle(
                        fontFamily: 'IBM Plex Sans Arabic',
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                        height: 0.25,
                        color: Color(0xff121212),
                      ),
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      width: 340,
                      child: TextFormField(
                        validator: ValidationsMetod.validateEmail,
                        controller: ctrl.emailController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          hintText: "user@gmail.com",
                          hintStyle: const TextStyle(
                            fontSize: 15,
                            color: Color(0xff8193B3),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                              color: Color(0xff29C1F2),
                              width: 1.0,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                              color: Color(0xff29C1F2),
                              width: 1.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 25),
                    SizedBox(
                      height: 50,
                      width: 330,
                      child: ElevatedButton(
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                               await ctrl.confirmEmail();
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          backgroundColor: const Color.fromARGB(
                            255,
                            74,
                            197,
                            237,
                          ),
                        ),
                        child: Text(
                          TranslationData.update.tr,
                          style: const TextStyle(
                            fontFamily: 'IBM Plex Sans Arabic',
                            fontWeight: FontWeight.w500,
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                   

                  ],
                ),
              ),
            ),
        );
      },
    );
  }
}
