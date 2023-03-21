import 'package:flutter/material.dart';

TextStyle style(double size, [bold = true]) {
  return TextStyle(
      fontSize: size,
      fontWeight: bold ? FontWeight.bold : FontWeight.w100,
      fontFamily: 'Square');
}
