import 'package:devfunmi/core/constants/app_colors.dart';
import 'package:devfunmi/core/constants/app_spacing.dart';
import 'package:devfunmi/core/constants/app_strings.dart';
import 'package:devfunmi/core/constants/app_typography.dart';
import 'package:devfunmi/core/utils/cv_download_stub.dart';
import 'package:devfunmi/widgets/animations/stagger_list.dart';
import 'package:devfunmi/widgets/buttons/icon_link_button.dart';
import 'package:devfunmi/widgets/buttons/primary_button.dart';
import 'package:flutter/material.dart';

class MobileDrawer extends StatelessWidget {
  final String activeSection;
  final void Function(String section) onLinkTap;

  static const List<Map<String, String>> _links = [
    {'label': 'About', 'key': 'about'},
    {'label': 'Skills', 'key': 'skills'},
    {'label': 'Experience', 'key': 'experience'},
    {'label': 'Portfolio', 'key': 'portfolio'},
    {'label': 'Booking', 'key': 'booking'},
    {'label': 'Contact', 'key': 'contact'},
  ];

  const MobileDrawer({
    super.key,
    required this.activeSection,
    required this.onLinkTap,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColors.background,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.xl),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RichText(
                    text: TextSpan(children: [
                      TextSpan(
                        text: 'Dev.',
                        style: AppTypography.headingM.copyWith(
                          color: AppColors.textPrimary,
                          fontFamily: 'JetBrainsMono',
                        ),
                      ),
                      TextSpan(
                        text: 'Funmi',
                        style: AppTypography.headingM.copyWith(
                          color: AppColors.accent,
                          fontFamily: 'JetBrainsMono',
                        ),
                      ),
                    ]),
                  ),
                  IconButton(
                    icon: const Icon(
                      Icons.close,
                      color: AppColors.textMuted,
                    ),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                ],
              ),
              const SizedBox(height: AppSpacing.xxl),

              // Nav links
              StaggerList(
                children: _links.map((link) {
                  final isActive = activeSection == link['key'];
                  return _MobileNavItem(
                    label: link['label']!,
                    isActive: isActive,
                    onTap: () {
                      Navigator.of(context).pop();
                      onLinkTap(link['key']!);
                    },
                  );
                }).toList(),
              ),

              const Spacer(),

              // Social links
              Row(
                children: [
                  IconLinkButton(
                    icon: Icons.code,
                    url: AppStrings.githubUrl,
                    tooltip: 'GitHub',
                  ),
                  const SizedBox(width: AppSpacing.sm),
                  IconLinkButton(
                    icon: Icons.link,
                    url: AppStrings.linkedinUrl,
                    tooltip: 'LinkedIn',
                  ),
                ],
              ),
              const SizedBox(height: AppSpacing.lg),

              // CV download
              PrimaryButton(
                label: AppStrings.downloadCV,
                icon: Icons.download,
                onTap: downloadCV,
                fullWidth: true,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _MobileNavItem extends StatelessWidget {
  final String label;
  final bool isActive;
  final VoidCallback onTap;

  const _MobileNavItem({
    required this.label,
    required this.isActive,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: AppSpacing.md),
        child: Row(
          children: [
            if (isActive)
              Container(
                width: 3,
                height: 20,
                margin: const EdgeInsets.only(right: AppSpacing.sm),
                decoration: BoxDecoration(
                  color: AppColors.accent,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            Text(
              label,
              style: AppTypography.headingS.copyWith(
                color: isActive
                    ? AppColors.textPrimary
                    : AppColors.textMuted,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
