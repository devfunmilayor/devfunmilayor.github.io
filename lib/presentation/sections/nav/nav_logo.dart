import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_typography.dart';
import '../../../core/constants/app_strings.dart';
import '../../../core/utils/scroll_utils.dart';

class NavLogo extends StatefulWidget {
  const NavLogo({super.key});

  @override
  State<NavLogo> createState() => _NavLogoState();
}

class _NavLogoState extends State<NavLogo> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => Future.microtask(() { if (mounted) setState(() => _hovered = true); }),
      onExit: (_) => Future.microtask(() { if (mounted) setState(() => _hovered = false); }),
      child: GestureDetector(
        onTap: () => ScrollUtils.scrollTo(AppStrings.sectionHero),
        child: RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: 'Dev.',
                style: AppTypography.headingM.copyWith(
                  color: _hovered
                      ? AppColors.accent
                      : AppColors.textPrimary,
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
            ],
          ),
        ),
      ),
    );
  }
}
