import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:helmet_customer/generated/assets.dart';
import 'package:helmet_customer/theme/app_colors.dart';
import 'package:helmet_customer/theme/app_size.dart';
import 'package:helmet_customer/views/order_status/order_status_controller.dart';

class Component2 extends StatelessWidget {
  const Component2({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OrderStatusController>(builder: (ctrl) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14),
              child: Row(
                children: [
                  const IconForReservationDetailes(
                      imagePath: SvgAssets.motorbikeSvg),
                  HorizontalDashedLine(color: Colors.grey),
                  const IconForReservationDetailes(
                      imagePath: SvgAssets.locationArrived),
                  HorizontalDashedLine(color: Colors.grey),
                  const IconForReservationDetailes(imagePath: SvgAssets.car),
                  HorizontalDashedLine(color: Colors.grey),
                  const IconForReservationDetailes(
                      imagePath: SvgAssets.locationCheck),
                ],
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4.0),
              child: Row(
                children: [
                  const Text12(
                    text: "جايك بالطريق",
                  ),
                  SizedBox(width: AppSize.width * 0.16),
                  const Text12(
                    text: "وصل",
                  ),
                  SizedBox(width: AppSize.width * 0.19),
                  const Text12(
                    text: "يتم الغسل",
                  ),
                  SizedBox(width: AppSize.width * 0.19),
                  const Text12(
                    text: "تمت",
                  ),
                ],
              ),
            ),
          ],
        ),
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
      backgroundColor: AppColors.primary.withValues(alpha: 0.2),
      child: Padding(
        padding: const EdgeInsets.all(6), // المسافة تخلي الصورة أصغر من الدائرة
        child: ClipOval(
          child: SvgPicture.asset(
            imagePath,
            fit: BoxFit.cover, // يحافظ على نسب الصورة ويملأ الـ Container
            width: 100, // اختياري: عرض محدد
            height: 100,
            color: AppColors.primary,
            // اختياري: ارتفاع محدد
          ),
        ),
      ),
    );
  }
}

class Text12 extends StatelessWidget {
  final String text;
  const Text12({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        fontFamily: 'IBMPlexSansArabic',
        fontWeight: FontWeight.w600,
        fontSize: 12,
        height: 1.5,
        letterSpacing: 0,
        color: Color(0xffC3CCD3),
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
