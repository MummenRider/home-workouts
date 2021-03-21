int hexColor(String hexColor) {
  String color = '0xFF' + hexColor;
  color = color.replaceAll('#', '');
  return int.parse(color);
}
