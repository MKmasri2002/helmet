
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../generated/assets.dart';
import '../colors/color1.dart';


void notLoggedInDialog(){
  Get.dialog(
      Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20,right: 20,top: 150,bottom: 150),
            child: Container(
              // width: MediaQuery.of(context).size.width*0.8,
              // height: MediaQuery.of(context).size.height*0.5,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.white
                ),
                child: Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Scaffold(
                    backgroundColor: Colors.white,
                    body: Center(
                      child: Column(
                        children: [
                          const SizedBox(height: 110,),
                          Text("You are not login yet, are you want to login now?".tr,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: 'IBMPlexSansArabic',
                              color: textColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 25,
                            ),
                          ),
                          const SizedBox(height: 25,),

                          Padding(
                            padding: const EdgeInsets.only(left: 20,right: 20),
                            child: Row(
                              children: [
                                GestureDetector(
                                    onTap:(){
                                      Get.back();
                                    },
                                    child: Image.asset(Assets.imagesRejectIcon,width: 100,height: 100,)),

                                const Spacer(),

                                GestureDetector(
                                    onTap:(){
                                    },
                                    child: Image.asset(Assets.imagesAcceptIcon,width: 100,height: 100,)),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                )
            ),
          ),

          Positioned(
              top:75,
              left:0,
              right:0,
              child:Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: Colors.white,
                        border: Border.all(color: Colors.black87,width: 2)
                    ),
                    width: 150,
                    height: 150,
                    child: Center(child: Image.asset(Assets.imagesHarageLogo,width: 100,height: 100,)),
                  ),
                ],
              )
          ),
        ],
      )
  );
}