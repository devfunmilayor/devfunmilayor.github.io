import 'package:devfunmi/core/constants/app_colors.dart';
import 'package:devfunmi/core/constants/app_spacing.dart';
import 'package:devfunmi/core/constants/app_typography.dart';
import 'package:devfunmi/data/models/skill_category_model.dart';
import 'package:devfunmi/widgets/chips/tag_chip.dart';
import 'package:devfunmi/widgets/glass/glass_card.dart';
import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';

class SkillCategoryGroup extends StatelessWidget {
  final SkillCategoryModel data;

  const SkillCategoryGroup({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return GlassCard(
      hoverable: true,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 32,
                height: 32,
                decoration: BoxDecoration(
                  color: AppColors.accent.withValues(alpha: 0.08),
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: AppColors.borderAccent),
                ),
                child: HugeIcon(
                  icon: data.icon,
                  color: AppColors.accent,
                  size: 16,
                ),
              ),
              const SizedBox(width: AppSpacing.sm),
              Text(
                data.category,
                style: AppTypography.headingS.copyWith(
                  color: AppColors.textPrimary,
                ),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.md),
          Wrap(
            spacing: AppSpacing.sm,
            runSpacing: AppSpacing.sm,
            children: data.skills
                .map((s) => TagChip(label: s.label, hoverable: true))
                .toList(),
          ),
        ],
      ),
    );
  }
}
