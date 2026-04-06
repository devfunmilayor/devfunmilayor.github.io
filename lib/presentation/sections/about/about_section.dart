import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_spacing.dart';
import '../../../core/constants/app_strings.dart';
import '../../../core/constants/app_typography.dart';
import '../../../core/utils/scroll_utils.dart';
import '../../../widgets/animations/fade_slide_in.dart';
import '../../../widgets/layout/responsive_layout.dart';
import '../../../widgets/layout/section_wrapper.dart';
import '../../../widgets/text/section_heading.dart';

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
            child: const ResponsiveLayout(
              mobile: _MobileLayout(),
              desktop: _DesktopLayout(),
            ),
          ),
        ],
      ),
    );
  }
}

// ─── Layouts ────────────────────────────────────────────────────────────────

class _DesktopLayout extends StatelessWidget {
  const _DesktopLayout();

  @override
  Widget build(BuildContext context) {
    return const Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(flex: 5, child: _BioColumn()),
        SizedBox(width: AppSpacing.xxl),
        Expanded(flex: 4, child: _SideColumn()),
      ],
    );
  }
}

class _MobileLayout extends StatelessWidget {
  const _MobileLayout();

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _BioColumn(),
        SizedBox(height: AppSpacing.xl),
        _SideColumn(),
      ],
    );
  }
}

// ─── Bio column ─────────────────────────────────────────────────────────────

class _BioColumn extends StatelessWidget {
  const _BioColumn();

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _HighlightedBio(),
        SizedBox(height: AppSpacing.xl),
        _AvailabilityBadge(),
      ],
    );
  }
}

class _HighlightedBio extends StatelessWidget {
  const _HighlightedBio();

  @override
  Widget build(BuildContext context) {
    final base = AppTypography.bodyLarge;
    final highlight = base.copyWith(
      color: AppColors.textPrimary,
      fontWeight: FontWeight.w500,
    );

    return RichText(
      text: TextSpan(
        style: base,
        children: [
          const TextSpan(
              text:
                  'Over six years building production mobile apps and the backends that power them. '
                  'I work across '),
          TextSpan(text: 'Flutter', style: highlight),
          const TextSpan(text: ', '),
          TextSpan(text: 'native iOS/Swift', style: highlight),
          const TextSpan(text: ', and '),
          TextSpan(text: 'Android/Kotlin', style: highlight),
          const TextSpan(text: ' for the mobile layer, and '),
          TextSpan(text: 'Go', style: highlight),
          const TextSpan(
              text:
                  ' for backend services: gRPC, REST, and event-driven systems.\n\n'),
          const TextSpan(text: "I've shipped apps serving "),
          TextSpan(text: 'millions of users', style: highlight),
          const TextSpan(
              text:
                  ' in banking, crypto, and enterprise. At TruePath Vision I lead mobile architecture '
                  'for a cross-platform '),
          TextSpan(text: 'biometric SDK', style: highlight),
          const TextSpan(
              text:
                  ' with native iOS and Android integrations. I own the full stack: '
                  'system design, native platform channels, '),
          TextSpan(text: 'Go microservices', style: highlight),
          const TextSpan(
              text: ', CI/CD, and App Store releases.\n\n'),
          const TextSpan(text: 'Currently expanding into '),
          TextSpan(text: 'Platform Engineering', style: highlight),
          const TextSpan(text: ' — studying '),
          TextSpan(text: 'Backstage', style: highlight),
          const TextSpan(text: ', '),
          TextSpan(text: 'Internal Developer Platforms', style: highlight),
          const TextSpan(
              text:
                  ', and golden path tooling to understand how infrastructure '
                  'teams scale developer experience at org level.'),
        ],
      ),
    );
  }
}

class _AvailabilityBadge extends StatefulWidget {
  const _AvailabilityBadge();

  @override
  State<_AvailabilityBadge> createState() => _AvailabilityBadgeState();
}

class _AvailabilityBadgeState extends State<_AvailabilityBadge>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _pulse;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat(reverse: true);
    _pulse = Tween<double>(begin: 0.3, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.md,
        vertical: AppSpacing.sm,
      ),
      decoration: BoxDecoration(
        color: AppColors.accent.withValues(alpha: 0.08),
        borderRadius: BorderRadius.circular(100),
        border: Border.all(color: AppColors.borderAccent),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          AnimatedBuilder(
            animation: _pulse,
            builder: (context, _) => Opacity(
              opacity: _pulse.value,
              child: Container(
                width: 8,
                height: 8,
                decoration: const BoxDecoration(
                  color: AppColors.accent,
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ),
          const SizedBox(width: AppSpacing.sm),
          Text(
            AppStrings.availability,
            style: AppTypography.bodySmall.copyWith(color: AppColors.accent),
          ),
        ],
      ),
    );
  }
}

// ─── Side column ────────────────────────────────────────────────────────────

class _SideColumn extends StatelessWidget {
  const _SideColumn();

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
                child: _StatCard(
                    value: AppStrings.yearsExperience,
                    label: 'Years building')),
            SizedBox(width: AppSpacing.md),
            Expanded(
                child:
                    _StatCard(value: AppStrings.liveApps, label: 'Apps shipped')),
          ],
        ),
        SizedBox(height: AppSpacing.md),
        Row(
          children: [
            Expanded(
                child: _StatCard(
                    value: AppStrings.uptime, label: 'Uptime sustained')),
            SizedBox(width: AppSpacing.md),
            Expanded(
                child: _StatCard(
                    value: AppStrings.latencyReduced,
                    label: 'Latency reduced')),
          ],
        ),
        SizedBox(height: AppSpacing.xl),
        _FocusList(),
      ],
    );
  }
}

class _StatCard extends StatelessWidget {
  final String value;
  final String label;

  const _StatCard({required this.value, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            value,
            style: AppTypography.displaySmall.copyWith(color: AppColors.accent),
          ),
          const SizedBox(height: AppSpacing.xs),
          Text(label, style: AppTypography.bodySmall),
        ],
      ),
    );
  }
}

class _FocusList extends StatelessWidget {
  const _FocusList();

  static const _items = [
    'Full-stack mobile ownership',
    'Flutter + Go architecture',
    'Native iOS & Android integration',
    'CI/CD & App Store releases',
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: _items
          .map(
            (item) => Padding(
              padding: const EdgeInsets.only(bottom: AppSpacing.sm),
              child: Row(
                children: [
                  Container(
                    width: 6,
                    height: 6,
                    decoration: const BoxDecoration(
                      color: AppColors.accent,
                      shape: BoxShape.circle,
                    ),
                  ),
                  const SizedBox(width: AppSpacing.sm),
                  Text(
                    item,
                    style: AppTypography.bodyMedium
                        .copyWith(color: AppColors.textSecondary),
                  ),
                ],
              ),
            ),
          )
          .toList(),
    );
  }
}
