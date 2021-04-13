import 'package:flutter/material.dart';

class RoundBtnBorder extends StatelessWidget {
  const RoundBtnBorder(
      {Key key,
      @required this.textLabel,
      @required this.bkgcolor,
      this.width,
      this.textColor,
      this.fontSize,
      this.buttonVerticalPadding})
      : super(key: key);
  final String textLabel;
  final Color bkgcolor;
  final Color textColor;
  final double width;
  final double fontSize;
  final double buttonVerticalPadding;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
        border: Border.all(color: bkgcolor, width: 1.5),
      ),
      padding: EdgeInsets.symmetric(
        vertical: buttonVerticalPadding ?? 7,
        horizontal: 12,
      ),
      width: width,
      child: Center(
        child: Text(
          textLabel,
          style: TextStyle(
            fontSize: fontSize,
            color: textColor,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
