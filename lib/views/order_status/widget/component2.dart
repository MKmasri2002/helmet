import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:helmet_customer/generated/assets.dart';
import 'package:helmet_customer/theme/app_size.dart';
import 'package:helmet_customer/views/order_status/order_status_controller.dart';

class Component2 extends StatelessWidget {
  const Component2({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OrderStatusController>(builder: (ctrl) {
      return Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 20),
            child: Row(
              children: [
                const IconForReservationDetailes(imagePath: Assets.motorBike),
                HorizontalDashedLine(color: Colors.grey),
                const IconForReservationDetailes(
                    imagePath: Assets.locationArrived),
                HorizontalDashedLine(color: Colors.grey),
                const IconForReservationDetailes(imagePath: Assets.car),
                HorizontalDashedLine(color: Colors.grey),
                const IconForReservationDetailes(
                    imagePath: Assets.locationCheck),
              ],
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Text(
                  "جايك بالطريق",
                  style: TextStyle(
                      color: Color(0xffC3CCD3), fontSize: 12, height: 1.5),
                ),
                SizedBox(width: AppSize.width * 0.16),
                Text(
                  "وصل",
                  style: TextStyle(
                      color: Color(0xffC3CCD3), fontSize: 12, height: 1.5),
                ),
                SizedBox(width: AppSize.width * 0.16),
                Text(
                  "يتم الغسل",
                  style: TextStyle(
                      color: Color(0xffC3CCD3), fontSize: 12, height: 1.5),
                ),
                SizedBox(width: AppSize.width * 0.19),
                Text(
                  "تمت",
                  style: TextStyle(
                      color: Color(0xffC3CCD3), fontSize: 12, height: 1.5),
                ),
              ],
            ),
          ),
        ],
      );
    });
  }
}

class IconForReservationDetailes extends StatelessWidget {
  final String imagePath;
  const IconForReservationDetailes({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 20, // حجم الـ CircleAvatar نفسه
      // اللون اللي يبين كإطار
      child: Padding(
        padding: const EdgeInsets.all(6), // المسافة تخلي الصورة أصغر من الدائرة
        child: ClipOval(
          child: Image.asset(
            imagePath,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}

class HorizontalDashedLine extends StatelessWidget {
  final double width = AppSize.width * 0.18;
  final double height;
  final Color color;

  HorizontalDashedLine({
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
