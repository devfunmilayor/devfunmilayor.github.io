import 'package:devfunmi/core/constants/app_colors.dart';
import 'package:devfunmi/core/constants/app_spacing.dart';
import 'package:devfunmi/core/constants/app_typography.dart';
import 'package:devfunmi/data/models/portfolio_model.dart';
import 'package:devfunmi/widgets/badges/app_store_type.dart';
import 'package:devfunmi/widgets/badges/store_badge.dart';
import 'package:devfunmi/widgets/chips/tag_chip.dart';
import 'package:devfunmi/widgets/glass/glass_card.dart';
import 'package:flutter/material.dart';

class PortfolioCardBack extends StatelessWidget {
  final PortfolioModel data;
  final VoidCallback onFlip;

  const PortfolioCardBack({
    super.key,
    required this.data,
    required this.onFlip,
  });

  @override
  Widget build(BuildContext context) {
    return GlassCard(
      accentBorder: true,
      onTap: onFlip,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                data.appName,
                style: AppTypography.mono.copyWith(
                  color: AppColors.accent,
                  fontSize: 16,
                ),
              ),
              Icon(
                Icons.flip,
                color: AppColors.textMuted,
                size: 16,
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.md),

          // Tech stack
          Text(
            'Tech Stack',
            style: AppTypography.label.copyWith(
              color: AppColors.textMuted,
            ),
          ),
          const SizedBox(height: AppSpacing.sm),
          Wrap(
            spacing: AppSpacing.xs,
            runSpacing: AppSpacing.xs,
            children: data.tags.map((t) => TagChip(label: t)).toList(),
          ),
          const SizedBox(height: AppSpacing.lg),

          // Highlights
          Text(
            'Key Achievements',
            style: AppTypography.label.copyWith(
              color: AppColors.textMuted,
            ),
          ),
          const SizedBox(height: AppSpacing.sm),
          ...data.highlights.map(
            (h) => Padding(
              padding: const EdgeInsets.only(bottom: AppSpacing.sm),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('→ ', style: AppTypography.mono),
                  Expanded(
                    child: Text(
                      h,
                      style: AppTypography.bodySmall.copyWith(
                        color: AppColors.textSecondary,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const Spacer(),
          const SizedBox(height: AppSpacing.md),

          // Store badges
          Row(
            children: [
              if (data.iosUrl != null)
                Padding(
                  padding: const EdgeInsets.only(right: AppSpacing.sm),
                  child: StoreBadge(
                    type: AppStoreType.ios,
                    url: data.iosUrl!,
                  ),
                ),
              if (data.androidUrl != null)
                StoreBadge(
                  type: AppStoreType.android,
                  url: data.androidUrl!,
                ),
            ],
          ),
        ],
      ),
    );
  }
}
