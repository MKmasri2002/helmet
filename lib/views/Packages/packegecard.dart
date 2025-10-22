import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:helmet_customer/generated/assets.dart';

class PackageCard extends StatelessWidget {
  final Map<String, dynamic> package;

  const PackageCard({super.key, required this.package});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 12.h),
      child: Container(
        padding: EdgeInsets.all(12.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          border: Border.all(color: const Color(0xffDBDFE6)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min, // 🔹 الكرت يتمدد حسب المحتوى فقط
          children: [
            /// Header Row
            Row(
              children: [
                Container(
                  padding: EdgeInsets.all(3.h),
                  decoration: BoxDecoration(
                    color: const Color(0xff29C1F2),
                    borderRadius: BorderRadius.circular(6.r),
                  ),
                  child: Text(
                    "وفر ${package["discount"]}",
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

            SizedBox(height: 20.h),

            Text(
              package["title"],
              style: TextStyle(
                fontSize: 15.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 8.h),

            Text(
              package["description"],
              style: TextStyle(
                fontSize: 14.sp,
                color: const Color(0xff8193B3),
              ),
            ),
            SizedBox(height: 12.h),

            Container(
              width: double.infinity,
              height: 55.h,
              decoration: BoxDecoration(
                color: const Color(0xff0A6082),
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.w),
                child: Row(
                  children: [
                    Text(
                      package["price"],
                      style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(width: 10.w),
                    Text(
                      "(${package["unit"]} ريال لكل غسلة)",
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: Colors.white,
                      ),
                    ),
                    const Spacer(),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.white,
                        size: 18.sp,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
