import 'package:flutter/material.dart';
import '../../../core/constants/app_spacing.dart';
import '../../../core/constants/app_strings.dart';
import '../../../core/utils/scroll_utils.dart';
import '../../../data/content/portfolio_data.dart';
import '../../../widgets/animations/fade_slide_in.dart';
import '../../../widgets/layout/adaptive_grid.dart';
import '../../../widgets/layout/section_wrapper.dart';
import '../../../widgets/text/section_heading.dart';
import 'portfolio_card.dart';

class PortfolioSection extends StatelessWidget {
  const PortfolioSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SectionWrapper(
      sectionKey: ScrollUtils.sectionKeys[AppStrings.sectionPortfolio],
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FadeSlideIn(
            child: const SectionHeading(
              label: AppStrings.portfolioLabel,
              title: AppStrings.portfolioTitle,
              subtitle:
                  'Mobile apps shipped to production — tap or hover any card for details.',
            ),
          ),
          AdaptiveGrid(
            mobileColumns: 1,
            tabletColumns: 2,
            desktopColumns: 3,
            spacing: AppSpacing.lg,
            children: PortfolioData.all.indexed.map((entry) {
              final (index, project) = entry;
              return FadeSlideIn(
                delay: Duration(milliseconds: index * 80),
                child: PortfolioCard(data: project),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
