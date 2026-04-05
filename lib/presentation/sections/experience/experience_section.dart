import 'package:flutter/material.dart';
import '../../../core/constants/app_strings.dart';
import '../../../core/utils/scroll_utils.dart';
import '../../../data/content/experience_data.dart';
import '../../../widgets/animations/fade_slide_in.dart';
import '../../../widgets/layout/section_wrapper.dart';
import '../../../widgets/text/section_heading.dart';
import 'experience_node.dart';

class ExperienceSection extends StatelessWidget {
  const ExperienceSection({super.key});

  @override
  Widget build(BuildContext context) {
    final experiences = ExperienceData.all;

    return SectionWrapper(
      sectionKey: ScrollUtils.sectionKeys[AppStrings.sectionExperience],
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FadeSlideIn(
            child: const SectionHeading(
              label: AppStrings.experienceLabel,
              title: AppStrings.experienceTitle,
            ),
          ),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: experiences.length,
            itemBuilder: (_, index) => FadeSlideIn(
              delay: Duration(milliseconds: index * 100),
              child: ExperienceNode(
                data: experiences[index],
                isLast: index == experiences.length - 1,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
