import 'package:flutter/material.dart';

extension ColorExtension on String {
  toColor() {
    var hexColor = replaceAll("#", "");
    hexColor = "ff" + hexColor;
    /*if (hexColor.length == 6) {

    }*/
    return Color(int.parse("0x$hexColor"));
   /* if (hexColor.length == 8) {

    }*/
  }
}