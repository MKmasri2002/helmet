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
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 30),
        child: Row(
          children: [
            const CircleAvatar(
              backgroundColor: Colors.blue,
              backgroundImage: AssetImage(
                Assets.motorBike,
              ),
            ),
            HorizontalDashedLine(
                width: AppSize.width * 0.18, color: Colors.grey),
            CircleAvatar(
              backgroundColor: Colors.blue[100],
              backgroundImage: const AssetImage(Assets.locationArrived),
            ),
            HorizontalDashedLine(
                width: AppSize.width * 0.18, color: Colors.grey),
            const CircleAvatar(
              backgroundImage: AssetImage(Assets.car),
            ),
            HorizontalDashedLine(
                width: AppSize.width * 0.18, color: Colors.grey),
            const CircleAvatar(
              // backgroundColor: Colors.grey,
              backgroundImage: AssetImage(Assets.locationCheck),
            ),
          ],
        ),
      );
    });
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
