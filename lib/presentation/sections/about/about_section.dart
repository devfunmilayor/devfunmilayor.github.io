import 'package:devfunmi/core/constants/app_strings.dart';
import 'package:devfunmi/core/constants/app_typography.dart';
import 'package:devfunmi/core/utils/scroll_utils.dart';
import 'package:devfunmi/widgets/animations/fade_slide_in.dart';
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
          FadeSlideIn(
            delay: const Duration(milliseconds: 100),
            child: const Text(
              AppStrings.bio,
              style: AppTypography.bodyLarge,
            ),
          ),
        ],
      ),
    );
  }
}
