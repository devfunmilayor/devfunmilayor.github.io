import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_typography.dart';
import '../../../core/constants/app_spacing.dart';
import '../../../core/utils/launch_utils.dart';
import '../../../widgets/buttons/primary_button.dart';
import '../../../widgets/glass/glass_card.dart';

class BookingOptionCard extends StatelessWidget {
  final String title;
  final String description;
  final String ctaLabel;
  final String url;
  final IconData icon;
  final bool isPrimary;

  const BookingOptionCard({
    super.key,
    required this.title,
    required this.description,
    required this.ctaLabel,
    required this.url,
    required this.icon,
    this.isPrimary = false,
  });

  @override
  Widget build(BuildContext context) {
    return GlassCard(
      hoverable: true,
      accentBorder: isPrimary,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: AppColors.accent.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: AppColors.borderAccent),
            ),
            child: HugeIcon(icon: icon, color: AppColors.accent, size: 22),
          ),
          const SizedBox(height: AppSpacing.lg),
          Text(
            title,
            style: AppTypography.headingS.copyWith(
              color: AppColors.textPrimary,
            ),
          ),
          const SizedBox(height: AppSpacing.sm),
          Text(description, style: AppTypography.bodyMedium),
          const SizedBox(height: AppSpacing.xl),
          PrimaryButton(
            label: ctaLabel,
            icon: HugeIcons.strokeRoundedArrowRight01,
            onTap: () => LaunchUtils.open(url),
            fullWidth: true,
          ),
        ],
      ),
    );
  }
}
