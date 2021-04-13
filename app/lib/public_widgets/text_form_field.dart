import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TemplateFormField extends StatelessWidget {
  TemplateFormField({
    Key key,
    @required this.controller,
    this.icon,
    this.iconSize,
    this.textSize,
    this.inputType,
    this.inputFormatters,
    this.hintText,
  });

  final TextEditingController controller;
  final double iconSize;
  final IconData icon;
  final double textSize;
  final String hintText;
  final TextInputType inputType;
  final TextInputFormatter inputFormatters;
  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: inputType ?? TextInputType.text,
      controller: controller,
      decoration: InputDecoration(
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.teal),
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.transparent),
          //  when the TextFormField in unfocused
        ),
        prefixIcon: Icon(
          icon,
          color: Colors.teal,
          size: iconSize ?? 18,
        ),
        hintText: hintText ?? '',
      ),
      textAlign: TextAlign.start,
      style: TextStyle(
        fontSize: textSize ?? 20,
        fontWeight: FontWeight.w300,
      ),
    );
  }
}
