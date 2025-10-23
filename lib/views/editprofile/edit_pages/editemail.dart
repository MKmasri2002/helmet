import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:helmet_customer/utils/validation/validations_metod.dart';
import 'package:helmet_customer/views/editprofile/edit_controller.dart';

class Editemail extends StatelessWidget {
  Editemail({super.key});
  final _formKey = GlobalKey<FormState>();

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
              leading: Padding(
                padding: const EdgeInsets.all(20),
                child: IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: Icon(
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
                    SizedBox(height: 20),
                    Text(
                      "تحديث البريد الالكتروني",
                      style: TextStyle(
                        fontFamily: 'IBM Plex Sans Arabic',
                        fontWeight: FontWeight.w500,
                        fontStyle: FontStyle.normal,
                        fontSize: 18,
                        height: 1.5,
                        color: Color(0xff121212),
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      "يرجى ادخال البريد الالكتروني الجديد",
                      style: TextStyle(
                        fontFamily: 'IBM Plex Sans Arabic',
                        fontSize: 15,
                        height: 1.5,
                        color: Color(0xff8193B3),
                      ),
                    ),
                    SizedBox(height: 40),
                    Text(
                      "البريد الالكتروني",
                      style: TextStyle(
                        fontFamily: 'IBM Plex Sans Arabic',
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                        height: 0.25,
                        color: Color(0xff121212),
                      ),
                      textAlign: TextAlign.right,
                    ),
                    SizedBox(height: 20),
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
                          hintStyle: TextStyle(
                            fontSize: 15,
                            color: Color(0xff8193B3),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              color: Color(0xff29C1F2),
                              width: 1.0,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              color: Color(0xff29C1F2),
                              width: 1.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 25),
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
                          "تحديث",
                          style: TextStyle(
                            fontFamily: 'IBM Plex Sans Arabic',
                            fontWeight: FontWeight.w500,
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    ElevatedButton(
  onPressed: () async {
    try {
      await FirebaseAuth.instance.signOut();
      Get.offAllNamed('/login'); // بدّلها بالـ route تبعك
    } catch (e) {
      Get.snackbar("خطأ", "فشل تسجيل الخروج: $e");
    }
  },
  child: Text("تسجيل الخروج"),
)

                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
