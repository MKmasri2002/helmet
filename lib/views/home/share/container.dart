import 'package:flutter/material.dart';

class mycontainer extends StatelessWidget {
  final double? height;
  final double? width;
  final double borderRadius;
  final Color backgroundColor;
  final EdgeInsetsGeometry padding;
  final Widget? child;
  final bool bottomShadow;
  final double shadowHeight;
  final Color shadowColor;
  final double shadowBlurRadius;
  final Color? borderColor;

  const mycontainer({
    super.key,
    this.height,
    this.width,
    this.borderRadius = 20.0,
    this.backgroundColor = Colors.white,
    this.padding = const EdgeInsets.all(8.0),
    this.child,
    this.bottomShadow = false,
    this.shadowHeight = 4.0,
    this.shadowColor = Colors.black26,
    this.shadowBlurRadius = 6.0,
    this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      padding: padding,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(borderRadius),
        boxShadow: bottomShadow
            ? [
                BoxShadow(
                  color: shadowColor,
                  blurRadius: shadowBlurRadius,
                  offset: Offset(0, shadowHeight), 
                ),
              ]
            : null,
        border: Border.all(color: borderColor ?? backgroundColor, width: 1),
      ),
      child: child,
    );
  }
}
