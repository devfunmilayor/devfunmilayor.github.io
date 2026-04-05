import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_typography.dart';
import '../../../core/constants/app_spacing.dart';
import '../../../core/constants/app_strings.dart';
import '../../../core/utils/scroll_utils.dart';
import '../../../widgets/animations/fade_slide_in.dart';
import '../../../widgets/glass/glass_card.dart';
import '../../../widgets/layout/responsive_layout.dart';
import '../../../widgets/layout/section_wrapper.dart';
import '../../../widgets/text/section_heading.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isDesktop = ResponsiveLayout.isDesktop(context);

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
          isDesktop
              ? Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 3,
                      child: FadeSlideIn(
                        delay: const Duration(milliseconds: 100),
                        child: const _BioText(),
                      ),
                    ),
                    const SizedBox(width: AppSpacing.xxl),
                    Expanded(
                      flex: 2,
                      child: FadeSlideIn(
                        delay: const Duration(milliseconds: 200),
                        child: const _QuickFacts(),
                      ),
                    ),
                  ],
                )
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FadeSlideIn(
                      delay: const Duration(milliseconds: 100),
                      child: const _BioText(),
                    ),
                    const SizedBox(height: AppSpacing.xl),
                    FadeSlideIn(
                      delay: const Duration(milliseconds: 200),
                      child: const _QuickFacts(),
                    ),
                  ],
                ),
        ],
      ),
    );
  }
}

class _BioText extends StatelessWidget {
  const _BioText();

  @override
  Widget build(BuildContext context) {
    return const Text(
      AppStrings.bio,
      style: AppTypography.bodyLarge,
    );
  }
}

class _QuickFacts extends StatelessWidget {
  const _QuickFacts();

  static const List<Map<String, String>> _facts = [
    {'icon': '📍', 'label': 'Location', 'value': 'Lagos, Nigeria'},
    {'icon': '💼', 'label': 'Experience', 'value': '6+ Years'},
    {'icon': '🕐', 'label': 'Timezone', 'value': 'WAT (UTC+1)'},
    {'icon': '✅', 'label': 'Status', 'value': 'Open to opportunities'},
    {'icon': '🎯', 'label': 'Focus', 'value': 'Flutter · Go · iOS · Android'},
  ];

  @override
  Widget build(BuildContext context) {
    return GlassCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Quick Facts',
            style: AppTypography.headingS.copyWith(
              color: AppColors.textPrimary,
            ),
          ),
          const SizedBox(height: AppSpacing.lg),
          ..._facts.map(
            (f) => Padding(
              padding: const EdgeInsets.only(bottom: AppSpacing.md),
              child: Row(
                children: [
                  Text(f['icon']!, style: const TextStyle(fontSize: 16)),
                  const SizedBox(width: AppSpacing.sm),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        f['label']!,
                        style: AppTypography.label.copyWith(
                          color: AppColors.textMuted,
                        ),
                      ),
                      Text(
                        f['value']!,
                        style: AppTypography.bodySmall.copyWith(
                          color: AppColors.textPrimary,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
