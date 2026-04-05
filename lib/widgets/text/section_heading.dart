import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_typography.dart';
import '../../core/constants/app_spacing.dart';
import '../layout/responsive_layout.dart';

class SectionHeading extends StatelessWidget {
  final String label;
  final String title;
  final String? subtitle;

  const SectionHeading({
    super.key,
    required this.label,
    required this.title,
    this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveLayout.isMobile(context);
    final titleStyle = (isMobile
            ? AppTypography.displaySmall
            : AppTypography.displayMedium)
        .copyWith(color: AppColors.textPrimary);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label.toUpperCase(),
          style: AppTypography.label.copyWith(
            color: AppColors.accent,
            letterSpacing: 2,
          ),
        ),
        const SizedBox(height: AppSpacing.sm),
        Text(title, style: titleStyle),
        if (subtitle != null) ...[
          const SizedBox(height: AppSpacing.md),
          Text(subtitle!, style: AppTypography.bodyLarge),
        ],
        const SizedBox(height: AppSpacing.xxl),
      ],
    );
  }
}
