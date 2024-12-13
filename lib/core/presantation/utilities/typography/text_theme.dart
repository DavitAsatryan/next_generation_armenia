import 'package:flutter/material.dart';

extension AppTextTheme on TextTheme {
  TextStyle get textSmall => const TextStyle(
        fontSize: 14,
        color: Color(0xFFF8F8F8),
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.normal,
      );
  TextStyle get textRegular => const TextStyle(
        fontSize: 14,
        color: Color(0xFF194866),
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.normal,
      );
  TextStyle get textLarge => const TextStyle(
        fontSize: 32,
        color: Color(0xFF194866),
        fontWeight: FontWeight.w700,
        fontStyle: FontStyle.normal,
      );
}
