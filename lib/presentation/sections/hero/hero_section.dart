import 'package:flutter/material.dart';
import '../../../core/constants/app_spacing.dart';
import '../../../core/constants/app_strings.dart';
import '../../../core/utils/scroll_utils.dart';
import '../../../widgets/animations/animated_gradient_bg.dart';
import '../../../widgets/layout/section_wrapper.dart';
import 'hero_text_column.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedGradientBg(
      child: SectionWrapper(
        sectionKey: ScrollUtils.sectionKeys[AppStrings.sectionHero],
        paddingV: AppSpacing.xxxl + AppSpacing.navHeight,
        child: const HeroTextColumn(),
      ),
    );
  }
}
