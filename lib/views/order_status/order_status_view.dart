import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:helmet_customer/generated/assets.dart';
import 'package:helmet_customer/theme/app_size.dart';
import 'package:helmet_customer/utils/colors/color1.dart';
import 'package:helmet_customer/utils/languages/translation_data.dart';
import 'package:helmet_customer/utils/tools/tools.dart';
import 'package:helmet_customer/views/booking/booking_view/widget/location/booking_map.dart';
import 'package:helmet_customer/views/booking/booking_view/widget/location/select_location.dart';
import 'package:helmet_customer/views/widget/custom_text.dart';
import 'package:helmet_customer/views/home/home_controller.dart';
import 'package:helmet_customer/views/order_status/order_status_controller.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:helmet_customer/views/order_status/widget/estimated_time_widget.dart';

class OrderStatusView extends StatelessWidget {
  const OrderStatusView({super.key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<OrderStatusController>(
      builder: (ctrl) {
        return Scaffold(
          appBar: AppBar(
            title: Text(TranslationData.reservationDetailes.tr),
            centerTitle: true,
          ),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.all(16),
                  width: AppSize.width,
                  decoration: BoxDecoration(
                    color: Colors.blue[300],
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(16),
                        bottomRight: Radius.circular(16)),
                  ),
                  child: Row(
                    children: [
                      const Text(
                        "جايك بالطريق",
                        style: TextStyle(
                            fontSize: 18, height: 1.5, color: Colors.white),
                      ),
                      SizedBox(
                        width: AppSize.width * 0.4,
                      ),
                      Icon(
                        Icons.car_crash,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "${washDataTripModel.cars[0].brand ?? " "}  ${washDataTripModel.cars[0].model ?? " "}",
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 14, vertical: 30),
                  child: Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.blue,
                        backgroundImage: AssetImage(
                          Assets.motorBike,
                        ),
                      ),
                      HorizontalDashedLine(
                          width: AppSize.width * 0.18, color: Colors.grey),
                      CircleAvatar(
                        backgroundColor: Colors.blue[100],
                        backgroundImage: AssetImage(Assets.locationArrived),
                      ),
                      HorizontalDashedLine(
                          width: AppSize.width * 0.18, color: Colors.grey),
                      CircleAvatar(
                        backgroundImage: AssetImage(Assets.car),
                      ),
                      HorizontalDashedLine(
                          width: AppSize.width * 0.18, color: Colors.grey),
                      CircleAvatar(
                        // backgroundColor: Colors.grey,
                        backgroundImage: AssetImage(Assets.locationCheck),
                      ),
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "وقت الموعد",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.black,
                        ),
                        textAlign: TextAlign.start,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        "20-60 دقيقة",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.blue,
                        ),
                        textAlign: TextAlign.start,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        "(من الممكن وصول البايكر 15 دقيقة قبل او بعد الوقت المحدد)",
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                        ),
                        textAlign: TextAlign.start,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Divider(
                    color: Colors.grey, // لون الخط
                    thickness: 2, // سمك الخط
                    height: 20, // المسافة العمودية قبل وبعد الخط
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      const Text(
                        "رقم الحجز  1238764",
                        style: TextStyle(
                            fontSize: 18, height: 1.5, color: Colors.black),
                      ),
                      const Icon(
                        Icons.copy,
                        color: Color(0xff8193B3),
                      ),
                      SizedBox(
                        width: AppSize.width * 0.3,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Divider(
                    color: Colors.grey, // لون الخط
                    thickness: 2, // سمك الخط
                    height: 20, // المسافة العمودية قبل وبعد الخط
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(16)),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.person_2_outlined),
                            Text("تفاصيل البايكر الخاص بك"),
                          ],
                        ),
                        Divider(
                          color: Colors.grey, // لون الخط
                          thickness: 2, // سمك الخط
                          height: 30, // المسافة العمودية قبل وبعد الخط
                        ),
                        Row(
                          children: [
                            CircleAvatar(
                              backgroundImage: NetworkImage(
                                  washDataTripModel.driverPhoto ?? ""),
                              radius: 30,
                            ),
                            Column(
                              children: [
                                Text(washDataTripModel.driverName ?? ""),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(children: [
                                  Icon(
                                    Icons.star,
                                    color: Colors.grey,
                                  ),
                                  Icon(
                                    Icons.star,
                                    color: Colors.yellow,
                                  ),
                                  Icon(
                                    Icons.star,
                                    color: Colors.yellow,
                                  ),
                                  Icon(
                                    Icons.star,
                                    color: Colors.yellow,
                                  ),
                                  Icon(
                                    Icons.star,
                                    color: Colors.yellow,
                                  ),
                                  Text("4.0"),
                                ]),
                                Text(
                                  "${washDataTripModel.driverPhone ?? ""}",
                                  textAlign: TextAlign.left,
                                ),
                              ],
                            ),
                            SizedBox(
                              width: AppSize.width * 0.3,
                            ),
                            CircleAvatar(
                              backgroundColor: Colors.blue[200],
                              child: IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.phone,
                                    color: Colors.white,
                                  )),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Divider(
                    color: Colors.grey, // لون الخط
                    thickness: 2, // سمك الخط
                    height: 20, // المسافة العمودية قبل وبعد الخط
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text("تفاصيل الحجز"),
                ),

                Padding(
                  padding: const EdgeInsets.all(8),
                  child: ListView.builder(
                    shrinkWrap: true, // مهم جداً عشان داخل Column/ScrollView
                    physics:
                        const NeverScrollableScrollPhysics(), // عشان ScrollView الرئيسي يتعامل مع السحب
                    itemCount: ctrl.washDataTripModel.cars?.length ?? 0,
                    itemBuilder: (context, index) {
                      final car = ctrl.washDataTripModel.cars![index];
                      return Card(
                        color: Colors.white,
                        child: ListTile(
                          leading: car.image != null
                              ? Image.network(
                                  car.image!,
                                  width: 50,
                                  height: 50,
                                  fit: BoxFit.contain,
                                  errorBuilder: (context, error, stackTrace) =>
                                      const Icon(Icons.car_repair,
                                          size: 40, color: Colors.grey),
                                )
                              : const Icon(Icons.directions_car,
                                  size: 40, color: Colors.grey),
                          title: Text(car.brand ?? "Car"),
                          trailing: const CircleAvatar(
                            backgroundColor: Colors.black,
                            radius: 10,
                          ),
                        ),
                      );
                    },
                  ),
                ),
                // const SizedBox(height: 20),

                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: BoxBorder.all(color: Colors.black),
                      borderRadius: BorderRadius.all(Radius.circular(16)),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.date_range,
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text("التاريخ والوقت"),
                            SizedBox(
                              height: 20,
                            ),
                            Text(washDataTripModel.washTimeDate.toString()),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        );
      },
    );
  }
}

class HorizontalDashedLine extends StatelessWidget {
  final double width;
  final double height;
  final Color color;

  const HorizontalDashedLine({
    this.width = 50,
    this.height = 2,
    this.color = Colors.grey,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: CustomPaint(
        painter: _HorizontalDashedLinePainter(color: color, height: height),
      ),
    );
  }
}

class _HorizontalDashedLinePainter extends CustomPainter {
  final Color color;
  final double height;
  _HorizontalDashedLinePainter({required this.color, required this.height});

  @override
  void paint(Canvas canvas, Size size) {
    double dashWidth = 5;
    double dashSpace = 5;
    final paint = Paint()
      ..color = color
      ..strokeWidth = height;

    double startX = 0;
    while (startX < size.width) {
      canvas.drawLine(
        Offset(startX, 0),
        Offset(startX + dashWidth, 0),
        paint,
      );
      startX += dashWidth + dashSpace;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
