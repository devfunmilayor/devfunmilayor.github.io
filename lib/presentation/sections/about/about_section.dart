import 'package:devfunmi/core/constants/app_colors.dart';
import 'package:devfunmi/core/constants/app_spacing.dart';
import 'package:devfunmi/core/constants/app_strings.dart';
import 'package:devfunmi/core/constants/app_typography.dart';
import 'package:devfunmi/core/utils/scroll_utils.dart';
import 'package:devfunmi/widgets/animations/fade_slide_in.dart';
import 'package:devfunmi/widgets/chips/tag_chip.dart';
import 'package:devfunmi/widgets/glass/glass_card.dart';
import 'package:devfunmi/widgets/layout/section_wrapper.dart';
import 'package:devfunmi/widgets/text/section_heading.dart';
import 'package:flutter/material.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SectionWrapper(
      sectionKey: ScrollUtils.sectionKeys[AppStrings.sectionAbout],
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FadeSlideIn(
            child: const SectionHeading(
              label: AppStrings.aboutLabel,
              title: AppStrings.aboutTitle,
            ),
          ),

          // Bio
          FadeSlideIn(
            delay: const Duration(milliseconds: 100),
            child: const Text(
              AppStrings.bio,
              style: AppTypography.bodyLarge,
            ),
          ),

          const SizedBox(height: AppSpacing.xxl),

          // Stats
          FadeSlideIn(
            delay: const Duration(milliseconds: 200),
            child: const _StatsRow(),
          ),

          const SizedBox(height: AppSpacing.xl),

          // Focus areas
          FadeSlideIn(
            delay: const Duration(milliseconds: 300),
            child: const _FocusAreas(),
          ),

          const SizedBox(height: AppSpacing.xl),

          // Availability
          FadeSlideIn(
            delay: const Duration(milliseconds: 400),
            child: const _AvailabilityBadge(),
          ),
        ],
      ),
    );
  }
}

// ── Stats ──────────────────────────────────────────────────────────────────

class _StatsRow extends StatelessWidget {
  const _StatsRow();

  static const _stats = [
    _Stat(value: '6+', label: 'Years Experience'),
    _Stat(value: '10+', label: 'Apps Shipped'),
    _Stat(value: '3M+', label: 'Users Served'),
    _Stat(value: '3', label: 'Industries'),
  ];

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: AppSpacing.md,
      runSpacing: AppSpacing.md,
      children: _stats.map((s) => _StatCard(stat: s)).toList(),
    );
  }
}

class _Stat {
  final String value;
  final String label;
  const _Stat({required this.value, required this.label});
}

class _StatCard extends StatelessWidget {
  final _Stat stat;
  const _StatCard({required this.stat});

  @override
  Widget build(BuildContext context) {
    return GlassCard(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.lg,
        vertical: AppSpacing.md,
      ),
      borderRadius: 12,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            stat.value,
            style: AppTypography.displaySmall.copyWith(
              color: AppColors.accent,
              fontWeight: FontWeight.w800,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            stat.label,
            style: AppTypography.label.copyWith(
              color: AppColors.textMuted,
              letterSpacing: 0.8,
            ),
          ),
        ],
      ),
    );
  }
}

// ── Focus Areas ────────────────────────────────────────────────────────────

class _FocusAreas extends StatelessWidget {
  const _FocusAreas();

  static const _tags = [
    'Flutter',
    'Go',
    'Swift',
    'Kotlin',
    'gRPC',
    'REST',
    'CI/CD',
    'Clean Architecture',
    'TDD',
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'CORE FOCUS',
          style: AppTypography.label.copyWith(color: AppColors.textMuted),
        ),
        const SizedBox(height: AppSpacing.sm),
        Wrap(
          spacing: AppSpacing.sm,
          runSpacing: AppSpacing.sm,
          children: _tags.map((t) => TagChip(label: t)).toList(),
        ),
      ],
    );
  }
}

// ── Availability Badge ─────────────────────────────────────────────────────

class _AvailabilityBadge extends StatelessWidget {
  const _AvailabilityBadge();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 8,
          height: 8,
          decoration: BoxDecoration(
            color: AppColors.accent,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: AppColors.accent.withValues(alpha: 0.5),
                blurRadius: 6,
                spreadRadius: 1,
              ),
            ],
          ),
        ),
        const SizedBox(width: AppSpacing.sm),
        Text(
          AppStrings.availability,
          style: AppTypography.bodySmall.copyWith(
            color: AppColors.accent,
          ),
        ),
      ],
    );
  }
}
