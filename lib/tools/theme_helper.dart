import 'package:flutter/material.dart';
import 'package:v2exf/tools/color_helper.dart';

extension ThemeDataHelper on ThemeData {
  MaterialColor get matericlPrimaryColor {
    final color = ColorHelper.fromHex('1DA1F2');
    var hexCode = (((color.alpha << 24) & 0xFF000000) |
        ((color.red << 16) & 0x00FF0000) |
        ((color.green << 8) & 0x0000FF00) |
        (color.blue & 0x000000FF));
    return MaterialColor(hexCode, <int, Color>{
      50: color,
      100: color,
      200: color,
      300: color,
      400: color,
      500: color,
      600: color,
      700: color,
      800: color,
      900: color,
    });
  }
}
