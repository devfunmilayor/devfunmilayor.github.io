import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_typography.dart';
import '../../../core/constants/app_spacing.dart';
import '../../../core/constants/app_strings.dart';
import '../../../core/utils/scroll_utils.dart';
import '../../../widgets/buttons/icon_link_button.dart';
import '../../../widgets/layout/responsive_layout.dart';
import '../../../widgets/layout/section_wrapper.dart';

class FooterSection extends StatelessWidget {
  const FooterSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveLayout.isMobile(context);

    return Container(
      decoration: const BoxDecoration(
        border: Border(top: BorderSide(color: AppColors.border)),
      ),
      child: SectionWrapper(
        sectionKey: ScrollUtils.sectionKeys[AppStrings.sectionFooter],
        paddingV: AppSpacing.xl,
        child: isMobile
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  _Logo(),
                  const SizedBox(height: AppSpacing.lg),
                  _SocialLinks(),
                  const SizedBox(height: AppSpacing.lg),
                  _Copyright(),
                ],
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _Copyright(),
                  _SocialLinks(),
                  _Logo(),
                ],
              ),
      ),
    );
  }
}

class _Logo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(children: [
        TextSpan(
          text: 'Dev.',
          style: AppTypography.bodyMedium.copyWith(
            color: AppColors.textMuted,
            fontFamily: 'JetBrainsMono',
          ),
        ),
        TextSpan(
          text: 'Funmi',
          style: AppTypography.bodyMedium.copyWith(
            color: AppColors.accent,
            fontFamily: 'JetBrainsMono',
          ),
        ),
      ]),
    );
  }
}

class _Copyright extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppStrings.footerCopyright,
          style: AppTypography.bodySmall,
        ),
      ],
    );
  }
}

class _SocialLinks extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
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
          tooltip: 'Twitter',
        ),
      ],
    );
  }
}
