import 'package:flutter/material.dart';
import '../../../core/constants/app_spacing.dart';
import '../../../core/constants/app_strings.dart';
import '../../../core/utils/scroll_utils.dart';
import '../../../widgets/animations/animated_gradient_bg.dart';
import '../../../widgets/layout/responsive_layout.dart';
import '../../../widgets/layout/section_wrapper.dart';
import 'hero_text_column.dart';
import 'hero_terminal.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isDesktop = ResponsiveLayout.isDesktop(context);

    return AnimatedGradientBg(
      child: SectionWrapper(
        sectionKey: ScrollUtils.sectionKeys[AppStrings.sectionHero],
        paddingV: AppSpacing.xxxl + AppSpacing.navHeight,
        child: isDesktop
            ? const Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(flex: 5, child: HeroTextColumn()),
                  SizedBox(width: AppSpacing.xxxl),
                  Expanded(flex: 4, child: HeroTerminal()),
                ],
              )
            : const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  HeroTextColumn(),
                  SizedBox(height: AppSpacing.xxl),
                  HeroTerminal(),
                ],
              ),
      ),
    );
  }
}
