import 'package:flutter/material.dart';
import 'package:helmet_customer/views/editprofile/edit_controller.dart';

class NameFields extends StatelessWidget {
  final EditController controller;

  const NameFields({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(width: 7,),
          Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                              const  Text(
                                  "الإسم الاول",
                                  style: TextStyle(
                                    fontFamily: 'IBM Plex Sans Arabic',
                                    fontWeight: FontWeight.w500,
                                    fontStyle: FontStyle.normal,
                                    fontSize: 14,
                                    height: 0.25,
                                    letterSpacing: 0,
                                    color: Color(0xff121212),
                                  ),
                                  textAlign: TextAlign.right,
                                ),
                                SizedBox(height: 20),
                                SizedBox(
                                  width: 155,
                                  child: TextFormField(
                                    controller: controller.firstNameController,
                                    textAlign: TextAlign.right,
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.grey,
                                    ),
                                    decoration: InputDecoration(
                                      contentPadding: EdgeInsets.symmetric(
                                        vertical: 15,
                                        horizontal: 12,
                                      ),
                                      hintStyle: TextStyle(fontSize: 14),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(8),
                                        borderSide: BorderSide(
                                          color: Colors.grey,
                                          width: 1.0,
                                        ),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(8),
                                        borderSide: BorderSide(
                                          color: Colors.grey,
                                          width: 1.0,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(width: 10),
          
          const SizedBox(width: 7),
          // اسم العائلة
         Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                              const  Text(
                                  "الاسم الثاني",
                                  style: TextStyle(
                                    fontFamily: 'IBM Plex Sans Arabic',
                                    fontWeight: FontWeight.w500,
                                    fontStyle: FontStyle.normal,
                                    fontSize: 14,
                                    height: 0.25,
                                    letterSpacing: 0,
                                    color: Color(0xff121212),
                                  ),
                                  textAlign: TextAlign.right,
                                ),
                                SizedBox(height: 20),
                                SizedBox(
                                  width: 155,
                                  child: TextFormField(
                                    textAlign: TextAlign.right,
                                   controller: controller.lastNameController,
      
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.grey,
                                    ),
                                    decoration: InputDecoration(
                                      contentPadding: EdgeInsets.symmetric(
                                        vertical: 15,
                                        horizontal: 12,
                                      ),
                                      hintStyle: TextStyle(fontSize: 14),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(8),
                                        borderSide: BorderSide(
                                          color: Colors.grey,
                                          width: 1.0,
                                        ),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(8),
                                        borderSide: BorderSide(
                                          color: Colors.grey,
                                          width: 1.0,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
        ],
      ),
    );
  }
}
