import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:helmet_customer/generated/assets.dart';
import 'package:helmet_customer/utils/languages/translation_data.dart';

class PackageCard extends StatelessWidget {
  final Map<String, dynamic> package;
  final VoidCallback? onPressed;

  const PackageCard({super.key, required this.package, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 6.h, horizontal: 12.w),
      child: Container(
        height: 220.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(color: const Color(0xffDBDFE6)),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 6,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Header Row
            Padding(
              padding: EdgeInsets.all(8.0.h),
              child: Row(
                children: [
                  Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 6.w, vertical: 3.h),
                    decoration: BoxDecoration(
                      color: const Color(0xff29C1F2),
                      borderRadius: BorderRadius.circular(6.r),
                    ),
                    child: Text(
                      " ${TranslationData.save.tr} ${package["discount"]}",
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(width: 10.w),
                  Image.asset(Assets.tabby, width: 62.w, height: 21.h),
                  SizedBox(width: 10.w),
                  Image.asset(Assets.tamara, width: 60.w, height: 20.h),
                  const Spacer(),
                  Container(
                    width: 40.w,
                    height: 45.h,
                    decoration: BoxDecoration(
                      color: const Color(0xff07729D),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(10.r),
                        bottomRight: Radius.circular(10.r),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            /// Title & Description
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.w),
              child: Text(
                package["title"],
                style: TextStyle(
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
              child: Text(
                package["description"],
                style: TextStyle(
                  fontSize: 14.sp,
                  color: const Color(0xff8193B3),
                ),
              ),
            ),

            const Spacer(),
            const SizedBox(
              height: 40,
            ),

            /// Bottom Button
            Padding(
              padding: EdgeInsets.all(8.0.h),
              child: SizedBox(
                width: double.infinity,
                height: 50.h,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xff0A6082),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                  ),
                  onPressed: onPressed ?? () {},
                  child: Row(
                    children: [
                      Row(
                        children: [
                          Text(
                            "${package["price"]}",
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          Image.asset(Assets.reyalblack,height: 30,),
                        ],
                      ),
                      const Spacer(),
                      Text(
                        "(${package["unit"]} ${TranslationData.riyalPerWash.tr})",
                        style: TextStyle(
                          fontSize: 14.sp,
                          color: Colors.white70,
                        ),
                      ),
                      const SizedBox(width: 8),
                      const Icon(Icons.arrow_forward_ios,
                          color: Colors.white, size: 18),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
