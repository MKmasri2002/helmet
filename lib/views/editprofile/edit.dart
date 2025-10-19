import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:helmet_customer/views/editprofile/edit_controller.dart';

class editpage extends StatefulWidget {
  @override
  State<editpage> createState() => _editpageState();
}

class _editpageState extends State<editpage> {
  @override
  Widget build(BuildContext context) {
    double pageWidth = MediaQuery.of(context).size.width;
    double pageHeight = MediaQuery.of(context).size.height;
    return GetBuilder<EditController>(
      builder: (ctrl) {
        return Directionality(
          textDirection: TextDirection.rtl,
          child: Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              backgroundColor: Colors.white,
              title: Text("تعديل الحساب"),
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
                  Get.back();
                },
                icon: Icon(Icons.arrow_back_ios, color: Colors.black, size: 16),
              ),
            ),
            body: SafeArea(
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Container(
                  width: pageWidth,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
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
                                  initialValue: "Ahmad",
                                  textAlign: TextAlign.left,
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
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "إسم العائلة",
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
                                  initialValue: "khaled",
                                  textAlign: TextAlign.left,
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
                      SizedBox(height: 40),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "تاريخ الميلاد",
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
                            width: 340,
                            child: TextFormField(
                              keyboardType: TextInputType.datetime,
                              initialValue: "30-5-1998",
                              textAlign: TextAlign.center,
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
                      SizedBox(height: 40),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "النوع",
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
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              InkWell(
                                onTap: () {
                                  ctrl.changeginder("ذكر");
                                },
                                child: Container(
                                  height: 65,
                                  width: 165,
                                  decoration: BoxDecoration(
                                    color: Color(0xffF0FAFF),
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                      color: ctrl.selectedGender == 'ذكر'
                                          ? Colors.blue
                                          : Color(0xffF0FAFF),
                                      width: 2,
                                    ),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      // Image.asset(
                                      //   "assets/images/mail.PNG",
                                      //   height: 50,
                                      //   width: 50,
                                      // ),
                                      SizedBox(width: 5),
                                      Text(
                                        'ذكر',
                                        style: TextStyle(
                                          fontFamily: 'IBM Plex Sans Arabic',
                                          fontWeight: FontWeight.w500,
                                          fontStyle: FontStyle.normal,
                                          fontSize: 16,
                                          height: 0.25,
                                          letterSpacing: 0,
                                          color: Color(0xff121212),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(width: 15),
                              InkWell(
                                onTap: () {
                                  ctrl.changeginder("أنثى");
                                },
                                child: Container(
                                  height: 65,
                                  width: 165,
                                  decoration: BoxDecoration(
                                    color: Color(0xffF0FAFF),
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                      color: ctrl.selectedGender == 'أنثى'
                                          ? Colors.blue
                                          : Color(0xffF0FAFF),
                                      width: 2,
                                    ),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      // Image.asset(
                                      //   "assets/images/femail.PNG",
                                      //   height: 50,
                                      //   width: 50,
                                      // ),
                                      SizedBox(width: 5),
                                      Text(
                                        'أنثى',
                                        style: TextStyle(
                                          fontFamily: 'IBM Plex Sans Arabic',
                                          fontWeight: FontWeight.w500,
                                          fontStyle: FontStyle.normal,
                                          fontSize: 16,
                                          height: 0.25,
                                          letterSpacing: 0,
                                          color: Color(0xff121212),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 30),
                      SizedBox(
                        height: 55,
                        width: 350,
                        child: ElevatedButton(
                          onPressed: () {},
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
                              fontStyle: FontStyle.normal,
                              fontSize: 18,
                              height: 0.25,
                              letterSpacing: 0,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 30),
                      InkWell(
                        onTap: () {},
                        child: Text(
                          "حذف الحساب",
                          style: TextStyle(
                            fontFamily: 'IBM Plex Sans Arabic',
                            fontWeight: FontWeight.w500,
                            fontStyle: FontStyle.normal,
                            fontSize: 16,
                            height: 0.25,
                            letterSpacing: 0,
                            color: Colors.red,
                          ),
                        ),
                      ),
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
