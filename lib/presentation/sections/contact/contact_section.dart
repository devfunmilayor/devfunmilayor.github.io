import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_typography.dart';
import '../../../core/constants/app_spacing.dart';
import '../../../core/constants/app_strings.dart';
import '../../../core/utils/scroll_utils.dart';
import '../../../core/utils/launch_utils.dart';
import '../../../widgets/animations/fade_slide_in.dart';
import '../../../widgets/glass/glass_card.dart';
import '../../../widgets/layout/responsive_layout.dart';
import '../../../widgets/layout/section_wrapper.dart';
import '../../../widgets/text/section_heading.dart';
import 'contact_form.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isDesktop = ResponsiveLayout.isDesktop(context);

    return SectionWrapper(
      sectionKey: ScrollUtils.sectionKeys[AppStrings.sectionContact],
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FadeSlideIn(
            child: const SectionHeading(
              label: AppStrings.contactLabel,
              title: AppStrings.contactTitle,
              subtitle: AppStrings.contactSubtitle,
            ),
          ),
          if (isDesktop)
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 2,
                  child: FadeSlideIn(
                    delay: const Duration(milliseconds: 100),
                    child: const _ContactInfo(),
                  ),
                ),
                const SizedBox(width: AppSpacing.xxl),
                const Expanded(
                  flex: 3,
                  child: FadeSlideIn(
                    delay: Duration(milliseconds: 200),
                    child: ContactForm(),
                  ),
                ),
              ],
            )
          else
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FadeSlideIn(
                  delay: const Duration(milliseconds: 100),
                  child: const _ContactInfo(),
                ),
                const SizedBox(height: AppSpacing.xxl),
                const FadeSlideIn(
                  delay: Duration(milliseconds: 200),
                  child: ContactForm(),
                ),
              ],
            ),
        ],
      ),
    );
  }
}

class _ContactInfo extends StatelessWidget {
  const _ContactInfo();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Let's build\nsomething great.",
          style: AppTypography.displaySmall.copyWith(
            color: AppColors.textPrimary,
          ),
        ),
        const SizedBox(height: AppSpacing.md),
        Text(
          'Open to senior roles, collaborations, and technical conversations.',
          style: AppTypography.bodyLarge,
        ),
        const SizedBox(height: AppSpacing.xl),
        _ContactItem(
          icon: Icons.email_outlined,
          label: AppStrings.email,
          onTap: () => LaunchUtils.email(AppStrings.email),
        ),
        const SizedBox(height: AppSpacing.sm),
        _ContactItem(
          icon: Icons.code,
          label: 'github.com/devfunmi',
          onTap: () => LaunchUtils.open(AppStrings.githubUrl),
        ),
        const SizedBox(height: AppSpacing.sm),
        _ContactItem(
          icon: Icons.link,
          label: 'linkedin.com/in/devfunmi',
          onTap: () => LaunchUtils.open(AppStrings.linkedinUrl),
        ),
      ],
    );
  }
}

class _ContactItem extends StatefulWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const _ContactItem({
    required this.icon,
    required this.label,
    required this.onTap,
  });

  @override
  State<_ContactItem> createState() => _ContactItemState();
}

class _ContactItemState extends State<_ContactItem> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => Future.microtask(() { if (mounted) setState(() => _hovered = true); }),
      onExit: (_) => Future.microtask(() { if (mounted) setState(() => _hovered = false); }),
      child: GestureDetector(
        onTap: widget.onTap,
        child: GlassCard(
          hoverable: true,
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.md,
            vertical: AppSpacing.sm + 2,
          ),
          child: Row(
            children: [
              Icon(
                widget.icon,
                color: _hovered ? AppColors.accent : AppColors.textMuted,
                size: 18,
              ),
              const SizedBox(width: AppSpacing.sm),
              Text(
                widget.label,
                style: AppTypography.bodySmall.copyWith(
                  color: _hovered
                      ? AppColors.textPrimary
                      : AppColors.textMuted,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
