import 'package:bmi_calculator/utilities/constant.dart';
import 'package:flutter/material.dart';

class CalCulateButton extends StatefulWidget {
  final Function()? onTap;
  final String title;
  const CalCulateButton({Key? key, this.onTap, required this.title})
      : super(key: key);

  @override
  State<CalCulateButton> createState() => _CalCulateButtonState();
}

class _CalCulateButtonState extends State<CalCulateButton> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: widget.onTap,
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: kPink,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10),
            ),
          ),
          child: Center(
            child: Text(
              widget.title,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
