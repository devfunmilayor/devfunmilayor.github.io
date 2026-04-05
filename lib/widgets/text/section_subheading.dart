import 'package:flutter/material.dart';
import '../../core/constants/app_typography.dart';
import '../../core/constants/app_spacing.dart';

class SectionSubheading extends StatelessWidget {
  final String text;
  final EdgeInsetsGeometry? padding;

  const SectionSubheading({
    super.key,
    required this.text,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? const EdgeInsets.only(bottom: AppSpacing.xl),
      child: Text(text, style: AppTypography.bodyLarge),
    );
  }
}
