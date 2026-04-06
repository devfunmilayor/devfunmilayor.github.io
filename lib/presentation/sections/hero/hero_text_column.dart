import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_typography.dart';
import '../../../core/constants/app_spacing.dart';
import '../../../core/constants/app_strings.dart';
import '../../../core/utils/cv_download_utils.dart';
import '../../../core/utils/scroll_utils.dart';
import '../../../widgets/animations/fade_slide_in.dart';
import '../../../widgets/buttons/primary_button.dart';
import '../../../widgets/buttons/ghost_button.dart';
import '../../../widgets/buttons/icon_link_button.dart';
import '../../../widgets/chips/status_pill.dart';
import '../../../widgets/text/typewriter_text.dart';
import '../../../widgets/layout/responsive_layout.dart';
import 'hero_stat_chips.dart';

class HeroTextColumn extends StatelessWidget {
  const HeroTextColumn({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveLayout.isMobile(context);
    final nameStyle = isMobile
        ? AppTypography.displaySmall
        : AppTypography.displayLarge;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Availability badge
        FadeSlideIn(
          delay: const Duration(milliseconds: 0),
          child: const StatusPill(),
        ),
        const SizedBox(height: AppSpacing.lg),

        // Name
        FadeSlideIn(
          delay: const Duration(milliseconds: 200),
          child: Text(
            AppStrings.name,
            style: nameStyle.copyWith(color: AppColors.textPrimary),
          ),
        ),
        const SizedBox(height: AppSpacing.sm),

        // Typewriter role
        FadeSlideIn(
          delay: const Duration(milliseconds: 300),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              TypewriterText(
                phrases: AppStrings.roles,
                style: (isMobile
                        ? AppTypography.headingS
                        : AppTypography.headingL)
                    .copyWith(color: AppColors.accent),
              ),
            ],
          ),
        ),
        const SizedBox(height: AppSpacing.lg),

        // Tagline
        FadeSlideIn(
          delay: const Duration(milliseconds: 400),
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 480),
            child: Text(
              AppStrings.tagline,
              style: AppTypography.bodyLarge,
              textAlign: TextAlign.justify,
            ),
          ),
        ),
        const SizedBox(height: AppSpacing.xl),

        // CTA buttons
        FadeSlideIn(
          delay: const Duration(milliseconds: 600),
          child: Wrap(
            spacing: AppSpacing.md,
            runSpacing: AppSpacing.md,
            children: [
              PrimaryButton(
                label: AppStrings.viewWork,
                icon: HugeIcons.strokeRoundedArrowRight01,
                onTap: () =>
                    ScrollUtils.scrollTo(AppStrings.sectionPortfolio),
              ),
              GhostButton(
                label: AppStrings.downloadCV,
                icon: HugeIcons.strokeRoundedDownload01,
                onTap: downloadCV,
              ),
            ],
          ),
        ),
        const SizedBox(height: AppSpacing.xl),

        // Social links
        FadeSlideIn(
          delay: const Duration(milliseconds: 700),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconLinkButton(
                icon: HugeIcons.strokeRoundedCode,
                url: AppStrings.githubUrl,
                tooltip: 'GitHub',
              ),
              const SizedBox(width: AppSpacing.sm),
              IconLinkButton(
                icon: HugeIcons.strokeRoundedLink01,
                url: AppStrings.linkedinUrl,
                tooltip: 'LinkedIn',
              ),
              const SizedBox(width: AppSpacing.sm),
              IconLinkButton(
                icon: HugeIcons.strokeRoundedAt,
                url: AppStrings.twitterUrl,
                tooltip: 'Twitter / X',
              ),
            ],
          ),
        ),
        const SizedBox(height: AppSpacing.xxl),

        // Stat chips
        FadeSlideIn(
          delay: const Duration(milliseconds: 800),
          child: const HeroStatChips(),
        ),
      ],
    );
  }
}
