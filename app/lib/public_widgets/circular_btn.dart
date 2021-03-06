import 'package:flutter/material.dart';

class CircularButton extends StatelessWidget {
  const CircularButton(
      {Key key,
      @required this.textLabel,
      @required this.color,
      this.width,
      this.textSize})
      : super(key: key);
  final String textLabel;
  final Color color;
  final double width;
  final double textSize;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
      ),
      padding: EdgeInsets.symmetric(
        vertical: 7,
        horizontal: 12,
      ),
      width: width,
      child: Center(
        child: Text(
          textLabel,
          style: TextStyle(
            fontSize: textSize ?? 18,
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
