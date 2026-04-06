import 'package:flutter/material.dart';
import 'app_colors.dart';

abstract class AppTypography {
  static const String _urbanist = 'Urbanist';
  static const String _mono = 'JetBrainsMono';

  // ── Display ──────────────────────────────────────────────────────────────

  static const TextStyle displayLarge = TextStyle(
    fontFamily: _urbanist,
    fontSize: 48,
    fontWeight: FontWeight.w800,
    color: AppColors.textPrimary,
    height: 1.1,
    letterSpacing: -1.5,
  );

  static const TextStyle displayMedium = TextStyle(
    fontFamily: _urbanist,
    fontSize: 34,
    fontWeight: FontWeight.w700,
    color: AppColors.textPrimary,
    height: 1.2,
    letterSpacing: -1.0,
  );

  static const TextStyle displaySmall = TextStyle(
    fontFamily: _urbanist,
    fontSize: 24,
    fontWeight: FontWeight.w700,
    color: AppColors.textPrimary,
    height: 1.3,
    letterSpacing: -0.5,
  );

  // ── Headings ─────────────────────────────────────────────────────────────

  static const TextStyle headingL = TextStyle(
    fontFamily: _urbanist,
    fontSize: 21,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
    height: 1.3,
  );

  static const TextStyle headingM = TextStyle(
    fontFamily: _urbanist,
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
    height: 1.4,
  );

  static const TextStyle headingS = TextStyle(
    fontFamily: _urbanist,
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
    height: 1.4,
  );

  // ── Body ─────────────────────────────────────────────────────────────────

  static const TextStyle bodyLarge = TextStyle(
    fontFamily: _urbanist,
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: AppColors.textMuted,
    height: 1.7,
  );

  static const TextStyle bodyMedium = TextStyle(
    fontFamily: _urbanist,
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: AppColors.textMuted,
    height: 1.6,
  );

  static const TextStyle bodySmall = TextStyle(
    fontFamily: _urbanist,
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: AppColors.textMuted,
    height: 1.5,
  );

  // ── Labels ───────────────────────────────────────────────────────────────

  static const TextStyle label = TextStyle(
    fontFamily: _urbanist,
    fontSize: 12,
    fontWeight: FontWeight.w600,
    color: AppColors.textMuted,
    letterSpacing: 1.5,
  );

  static const TextStyle labelM = TextStyle(
    fontFamily: _urbanist,
    fontSize: 12,
    fontWeight: FontWeight.w500,
    color: AppColors.textMuted,
    letterSpacing: 0.5,
  );

  // ── Mono (JetBrainsMono — bundled) ───────────────────────────────────────

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
