import 'package:flutter/material.dart';

class TemplateListTile extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color iconColor;
  final double iconSize;
  final double textSize;
  TemplateListTile(
      {this.icon, this.text, this.iconColor, this.iconSize, this.textSize});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 15.0),
      child: Row(
        children: <Widget>[
          Icon(
            icon,
            color: iconColor ?? Colors.black,
            size: iconSize ?? 20,
          ),
          SizedBox(
            width: 15.0,
          ),
          Text(
            "$text",
            style: TextStyle(
              fontSize: textSize ?? 16.0,
              fontWeight: FontWeight.w300,
            ),
          ),
        ],
      ),
    );
  }
}
