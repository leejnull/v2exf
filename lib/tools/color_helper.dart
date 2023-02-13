import 'package:flutter/material.dart';
import 'package:v2exf/service/logger/index.dart';

extension ColorsHelper on Colors {
  static MaterialColor get materialWhite {
    return const MaterialColor(
      0xFFFFFFFF,
      <int, Color>{
        50: Color(0xFFFFFFFF),
        100: Color(0xFFFFFFFF),
        200: Color(0xFFFFFFFF),
        300: Color(0xFFFFFFFF),
        400: Color(0xFFFFFFFF),
        500: Color(0xFFFFFFFF),
        600: Color(0xFFFFFFFF),
        700: Color(0xFFFFFFFF),
        800: Color(0xFFFFFFFF),
        9000: Color(0xFFFFFFFF),
      },
    );
  }
}

extension ColorHelper on Color {
  static Color fromHex(String hex, {int alpha = 255}) {
    hex = hex.toLowerCase();
    String hexString = '';
    if (hex.startsWith('0x')) {
      hexString = hex.substring(2);
    } else if (hex.startsWith('#')) {
      hexString = hex.substring(1);
    } else {
      hexString = hex;
    }
    if (hexString.length != 6) {
      if (hexString.length != 8) {
        return ColorsHelper.materialWhite;
      }
      String alphaVal = hexString.substring(0, 2);
      alpha = int.parse(alphaVal, radix: 16);
      hexString = hexString.substring(2);
    }
    int hexVal = int.parse(hexString, radix: 16);
    try {
      return Color.fromARGB(
          alpha, hexVal >> 16, (hexVal & 0x00FF00) >> 8, hexVal & 0x0000FF);
    } catch (e) {
      return ColorsHelper.materialWhite;
    }
  }
}
