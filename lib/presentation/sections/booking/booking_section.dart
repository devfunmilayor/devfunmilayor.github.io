import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import '../../../core/constants/app_spacing.dart';
import '../../../core/constants/app_strings.dart';
import '../../../core/utils/scroll_utils.dart';
import '../../../widgets/animations/fade_slide_in.dart';
import '../../../widgets/layout/responsive_layout.dart';
import '../../../widgets/layout/section_wrapper.dart';
import '../../../widgets/text/section_heading.dart';
import 'booking_option_card.dart';

class BookingSection extends StatelessWidget {
  const BookingSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isDesktop = ResponsiveLayout.isDesktop(context);

    final cards = [
      FadeSlideIn(
        delay: const Duration(milliseconds: 100),
        child: const BookingOptionCard(
          title: 'Calendly',
          description:
              'Book a 30 or 60-minute session. Async scheduling, no back and forth.',
          ctaLabel: 'Book on Calendly',
          url: AppStrings.calendlyUrl,
          icon: HugeIcons.strokeRoundedCalendar01,
          isPrimary: true,
        ),
      ),
      FadeSlideIn(
        delay: const Duration(milliseconds: 200),
        child: const BookingOptionCard(
          title: 'Google Calendar',
          description:
              'Pick a time that works for you. Sends me a calendar invite directly.',
          ctaLabel: AppStrings.scheduleGoogle,
          url: AppStrings.googleMeetUrl,
          icon: HugeIcons.strokeRoundedCalendar03,
        ),
      ),
    ];

    return SectionWrapper(
      sectionKey: ScrollUtils.sectionKeys[AppStrings.sectionBooking],
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FadeSlideIn(
            child: const SectionHeading(
              label: AppStrings.bookingLabel,
              title: AppStrings.bookingTitle,
              subtitle: AppStrings.bookingSubtitle,
            ),
          ),
          if (isDesktop)
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: cards
                  .map((c) => Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(right: AppSpacing.lg),
                          child: c,
                        ),
                      ))
                  .toList(),
            )
          else
            Column(
              children: cards
                  .map((c) => Padding(
                        padding:
                            const EdgeInsets.only(bottom: AppSpacing.lg),
                        child: c,
                      ))
                  .toList(),
            ),
        ],
      ),
    );
  }
}
