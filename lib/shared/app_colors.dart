import 'package:flutter/material.dart';

class AppColors {
  static const Color primary = Color(0xFF0033A0);
  static const Color secondary = Color(0xFF333333);
  static const Color grey = Color(0xFFF0F0F0);
  static const Color greyBackground = Color(0xFFD9D9D9);
  static const Color pink = Color(0xFFF8D3D3);
  static const Color pink2 = Color(0xFFF4C2C2);
  static List<BoxShadow> primaryShadow = [
    BoxShadow(
      color: secondary.withOpacity(0.2),
      blurRadius: 4,
      offset: const Offset(
        0,
        1,
      ),
      spreadRadius: 1,
    ),
  ];
}
