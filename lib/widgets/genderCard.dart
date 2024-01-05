import 'package:bmi_calculator/utilities/constant.dart';
import 'package:flutter/material.dart';

class GenderCard extends StatelessWidget {
  final String value;
  final double? width;
  final Color? backgroundColor;
  final double? height;
  final Widget? child;
  final Function()? onTap;
  const GenderCard({
    this.width,
    required this.value,
    this.height,
    this.backgroundColor,
    this.onTap,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: GestureDetector(
        onTap: this.onTap,
        child: Container(
          width: width ?? double.infinity,
          height: height ?? 200,
          decoration: BoxDecoration(
            color: backgroundColor ?? kGreyBlue,
            borderRadius: BorderRadius.all(
              Radius.circular(16),
            ),
          ),
          child: child,
        ),
      ),
    );
  }
}
