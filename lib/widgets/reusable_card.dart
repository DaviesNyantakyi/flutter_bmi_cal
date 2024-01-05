import 'package:bmi_calculator/utilities/constant.dart';
import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  final double? width;
  final Color? backgroundColor;
  final double? height;
  final Widget? child;
  final double radius;
  final Function()? onTap;
  const ReusableCard({
    this.width,
    this.height,
    this.backgroundColor,
    this.radius = 0,
    this.onTap,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: this.onTap,
      child: Container(
        width: width ?? double.infinity,
        height: height ?? 200,
        decoration: BoxDecoration(
          color: backgroundColor ?? kGreyBlue,
          borderRadius: BorderRadius.all(
            Radius.circular(this.radius),
          ),
        ),
        child: child,
      ),
    );
  }
}
