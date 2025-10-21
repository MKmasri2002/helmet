import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PackagesPage extends StatelessWidget {
  const PackagesPage({super.key});

  // 🔹 قائمة الباقات الثابتة
  static const List<Map<String, dynamic>> packages = [
    {
      "title": "الباقة الفضية",
      "description": "غسلتين أسبوعيًا لمدة شهر",
      "price": "50",
      "unit": "25",
      "discount": "10%",
    },
    {
      "title": "الباقة الذهبية",
      "description": "خمس غسلات أسبوعيًا لمدة شهر",
      "price": "100",
      "unit": "20",
      "discount": "20%",
    },
  ];

  @override
  Widget build(BuildContext context) {
    final screen = MediaQuery.of(context).size;

    return ScreenUtilInit(
      designSize: const Size(400, 850),
      builder: (context, child) {
        return Directionality(
          textDirection: TextDirection.rtl,
          child: Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              backgroundColor: Colors.white,
              elevation: 0,
              centerTitle: true,
              title: Text(
                "الباقات",
                style: TextStyle(
                  fontFamily: 'IBM Plex Sans Arabic',
                  fontWeight: FontWeight.w500,
                  fontSize: 18.sp,
                  color: Colors.black,
                ),
              ),
              leading: IconButton(
                padding: EdgeInsets.all(20.h),
                onPressed: () => Get.back(),
                icon: Icon(Icons.arrow_back_ios, color: Colors.black, size: 18.sp),
              ),
              toolbarHeight: 60.h,
            ),
            body: LayoutBuilder(
              builder: (context, constraints) {
                final width = constraints.maxWidth;
                final crossAxisCount = width > 700
                    ? 2 // شاشتين أو أكثر (تابلت)
                    : 1; // شاشة موبايل

                return GridView.builder(
                  padding: EdgeInsets.all(16.w),
                  itemCount: packages.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: crossAxisCount,
                    crossAxisSpacing: 12.w,
                    mainAxisSpacing: 12.h,
                    childAspectRatio: width > 700 ? 1.3 : 0.85,
                  ),
                  itemBuilder: (context, index) {
                    final package = packages[index];
                    return _buildPackageCard(context, package, screen);
                  },
                );
              },
            ),
          ),
        );
      },
    );
  }

  Widget _buildPackageCard(
      BuildContext context, Map<String, dynamic> package, Size screen) {
    return Container(
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: const Color(0xffDBDFE6)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 🟦 الخصم والعلامة الجانبية
          Row(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 3.h),
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
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 8.h),
          Expanded(
            child: Text(
              package["description"],
              style: TextStyle(
                fontSize: 14.sp,
                color: const Color(0xff8193B3),
              ),
            ),
          ),
          SizedBox(height: 12.h),
          // ✅ الزر السفلي
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 50.h,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xff0A6082),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.r),
                ),
              ),
              onPressed: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "${package["price"]} ريال",
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(width: 8.w),
                  Text(
                    "(${package["unit"]} ريال لكل غسلة)",
                    style: TextStyle(
                      fontSize: 13.sp,
                      color: Colors.white70,
                    ),
                  ),
                  const Spacer(),
                  Icon(Icons.arrow_forward_ios, color: Colors.white, size: 18.sp),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
