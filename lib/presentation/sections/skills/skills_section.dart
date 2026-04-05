import 'package:flutter/material.dart';
import '../../../core/constants/app_spacing.dart';
import '../../../core/constants/app_strings.dart';
import '../../../core/utils/scroll_utils.dart';
import '../../../data/content/skills_data.dart';
import '../../../widgets/animations/fade_slide_in.dart';
import '../../../widgets/layout/adaptive_grid.dart';
import '../../../widgets/layout/section_wrapper.dart';
import '../../../widgets/text/section_heading.dart';
import 'skill_category_group.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SectionWrapper(
      sectionKey: ScrollUtils.sectionKeys[AppStrings.sectionSkills],
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FadeSlideIn(
            child: const SectionHeading(
              label: AppStrings.skillsLabel,
              title: AppStrings.skillsTitle,
            ),
          ),
          AdaptiveGrid(
            mobileColumns: 1,
            tabletColumns: 2,
            desktopColumns: 3,
            spacing: AppSpacing.lg,
            children: SkillsData.all.indexed.map((entry) {
              final (index, category) = entry;
              return FadeSlideIn(
                delay: Duration(milliseconds: index * 80),
                child: SkillCategoryGroup(data: category),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
