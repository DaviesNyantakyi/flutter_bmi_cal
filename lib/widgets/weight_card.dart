import 'package:bmi_calculator/widgets/reusable_card.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class WeightCard extends StatefulWidget {
  final String title;
  final String value;
  final Function()? minButton;
  final Function()? plusButton;
  const WeightCard({
    Key? key,
    required this.title,
    required this.value,
    this.minButton,
    this.plusButton,
  }) : super(key: key);

  @override
  State<WeightCard> createState() => _WeightCardState();
}

class _WeightCardState extends State<WeightCard> {
  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: ReusableCard(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              widget.title,
              style: TextStyle(fontSize: 14),
            ),
            Text(
              widget.value,
              style: TextStyle(fontSize: 48),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FloatingActionButton(
                  backgroundColor: Colors.blueGrey,
                  onPressed: widget.minButton,
                  child: Icon(FontAwesomeIcons.minus),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(100),
                    ),
                  ),
                ),
                SizedBox(width: 14),
                FloatingActionButton(
                  backgroundColor: Colors.blueGrey,
                  onPressed: widget.plusButton,
                  child: Icon(FontAwesomeIcons.plus),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(100),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
