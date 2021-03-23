import 'package:app/util/hexcolor_convert.dart';
import 'package:flutter/material.dart';

class ColorPalette {
  static const Color scaffold = Color(0xFFe7e8e6);
  static const Color postText = Color(0xFF2A292B);
  static LinearGradient drawerGradient = LinearGradient(
    colors: [
      Color(hexColor('#c5796d')),
      Color(hexColor('#dbe6f6')),
    ],
    begin: Alignment.topCenter,
    end: Alignment.bottomRight,
  );
}
