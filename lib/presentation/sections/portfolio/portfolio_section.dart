import 'package:devfunmi/core/constants/app_spacing.dart';
import 'package:devfunmi/core/constants/app_strings.dart';
import 'package:devfunmi/core/utils/scroll_utils.dart';
import 'package:devfunmi/data/content/portfolio_data.dart';
import 'package:devfunmi/widgets/animations/fade_slide_in.dart';
import 'package:devfunmi/widgets/layout/adaptive_grid.dart';
import 'package:devfunmi/widgets/layout/section_wrapper.dart';
import 'package:devfunmi/widgets/text/section_heading.dart';
import 'package:flutter/material.dart';
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
                  'Mobile apps shipped to production. Tap or hover any card for details.',
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
