import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:helmet_customer/theme/app_colors.dart';
import 'package:helmet_customer/theme/app_size.dart';

class IconForReservationDetailes extends StatelessWidget {
  final String imagePath;
  final Color? color;
  final Color? seconedColor;
  const IconForReservationDetailes(
      {super.key, required this.imagePath, this.color, this.seconedColor});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 20, // حجم الـ CircleAvatar نفسه
      // اللون اللي يبين كإطار
      backgroundColor: color ?? AppColors.primary.withValues(alpha: 0.2),
      child: Padding(
        padding: const EdgeInsets.all(6), // المسافة تخلي الصورة أصغر من الدائرة
        child: ClipOval(
          child: SvgPicture.asset(
            imagePath,
            fit: BoxFit.cover, // يحافظ على نسب الصورة ويملأ الـ Container
            width: 100, // اختياري: عرض محدد
            height: 100,
            color: seconedColor ?? AppColors.primary,
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
  final bool isLine;

  HorizontalDashedLine({
    this.height = 2,
    this.color = Colors.grey,
    super.key,
    required this.isLine,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: CustomPaint(
        painter: _HorizontalDashedLinePainter(
            color: color, height: height, isLine: isLine),
      ),
    );
  }
}

class _HorizontalDashedLinePainter extends CustomPainter {
  final Color color;
  final double height;
  final bool isLine;
  _HorizontalDashedLinePainter(
      {required this.isLine, required this.color, required this.height});

  @override
  void paint(Canvas canvas, Size size) {
    double dashWidth = 5;

    double dashSpace;
    if (isLine) {
      dashSpace = 0;
    } else {
      dashSpace = 5;
    }
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
