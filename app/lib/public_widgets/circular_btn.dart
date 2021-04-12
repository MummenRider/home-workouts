import 'package:flutter/material.dart';

class CircularButton extends StatelessWidget {
  const CircularButton(
      {Key key, @required this.textLabel, @required this.color})
      : super(key: key);
  final String textLabel;
  final Color color;

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
        vertical: 8,
        horizontal: 12,
      ),
      child: Center(
        child: Text(
          textLabel,
          style: TextStyle(
            fontSize: 18,
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
