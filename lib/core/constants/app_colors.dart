import 'package:flutter/material.dart';

abstract class AppColors {
  // Backgrounds
  static const Color background = Color(0xFF0A0A0F);
  static const Color surface = Color(0x0AFFFFFF); // 4% white
  static const Color surfaceHover = Color(0x14FFFFFF); // 8% white
  static const Color navBlur = Color(0xCC0A0A0F); // 80% background

  // Brand
  static const Color accent = Color(0xFF00FFB2); // electric mint
  static const Color secondary = Color(0xFF7B61FF); // soft violet

  // Text
  static const Color textPrimary = Color(0xFFF0F0F0);
  static const Color textSecondary = Color(0xFFB0B0C0);
  static const Color textMuted = Color(0xFF6B7280);
  static const Color textAccent = accent;

  // Borders
  static const Color border = Color(0x1AFFFFFF); // 10% white
  static const Color borderHover = Color(0x33FFFFFF); // 20% white
  static const Color borderAccent = Color(0x4D00FFB2); // 30% accent

  // Status
  static const Color success = Color(0xFF00FFB2);
  static const Color error = Color(0xFFFF4D4D);
  static const Color warning = Color(0xFFFFB800);

  // Timeline
  static const Color timelineLine = Color(0x1AFFFFFF);
}
