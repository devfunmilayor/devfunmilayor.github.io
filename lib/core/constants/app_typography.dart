import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_colors.dart';

abstract class AppTypography {
  static const String _mono = 'JetBrainsMono';

  // ── Display ──────────────────────────────────────────────────────────────

  static TextStyle get displayLarge => GoogleFonts.urbanist(
        fontSize: 48,
        fontWeight: FontWeight.w800,
        color: AppColors.textPrimary,
        height: 1.1,
        letterSpacing: -1.5,
      );

  static TextStyle get displayMedium => GoogleFonts.urbanist(
        fontSize: 34,
        fontWeight: FontWeight.w700,
        color: AppColors.textPrimary,
        height: 1.2,
        letterSpacing: -1.0,
      );

  static TextStyle get displaySmall => GoogleFonts.urbanist(
        fontSize: 24,
        fontWeight: FontWeight.w700,
        color: AppColors.textPrimary,
        height: 1.3,
        letterSpacing: -0.5,
      );

  // ── Headings ─────────────────────────────────────────────────────────────

  static TextStyle get headingL => GoogleFonts.urbanist(
        fontSize: 21,
        fontWeight: FontWeight.w600,
        color: AppColors.textPrimary,
        height: 1.3,
      );

  static TextStyle get headingM => GoogleFonts.urbanist(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: AppColors.textPrimary,
        height: 1.4,
      );

  static TextStyle get headingS => GoogleFonts.urbanist(
        fontSize: 14,
        fontWeight: FontWeight.w600,
        color: AppColors.textPrimary,
        height: 1.4,
      );

  // ── Body ─────────────────────────────────────────────────────────────────

  static TextStyle get bodyLarge => GoogleFonts.urbanist(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: AppColors.textMuted,
        height: 1.7,
      );

  static TextStyle get bodyMedium => GoogleFonts.urbanist(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        color: AppColors.textMuted,
        height: 1.6,
      );

  static TextStyle get bodySmall => GoogleFonts.urbanist(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        color: AppColors.textMuted,
        height: 1.5,
      );

  // ── Labels ───────────────────────────────────────────────────────────────

  static TextStyle get label => GoogleFonts.urbanist(
        fontSize: 12,
        fontWeight: FontWeight.w600,
        color: AppColors.textMuted,
        letterSpacing: 1.5,
      );

  static TextStyle get labelM => GoogleFonts.urbanist(
        fontSize: 12,
        fontWeight: FontWeight.w500,
        color: AppColors.textMuted,
        letterSpacing: 0.5,
      );

  // ── Mono (JetBrainsMono — bundled, stays const) ──────────────────────────

  static const TextStyle mono = TextStyle(
    fontFamily: _mono,
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: AppColors.accent,
    height: 1.6,
  );

  static const TextStyle monoLarge = TextStyle(
    fontFamily: _mono,
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: AppColors.accent,
    height: 1.6,
  );

  static const TextStyle monoSmall = TextStyle(
    fontFamily: _mono,
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: AppColors.textMuted,
    height: 1.5,
  );
}
