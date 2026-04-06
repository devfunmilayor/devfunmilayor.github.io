import 'package:devfunmi/core/constants/app_colors.dart';
import 'package:devfunmi/core/constants/app_spacing.dart';
import 'package:devfunmi/core/constants/app_strings.dart';
import 'package:devfunmi/core/constants/app_typography.dart';
import 'package:devfunmi/core/utils/scroll_utils.dart';
import 'package:devfunmi/widgets/animations/fade_slide_in.dart';
import 'package:devfunmi/widgets/chips/status_pill.dart';
import 'package:devfunmi/widgets/glass/glass_card.dart';
import 'package:devfunmi/widgets/layout/responsive_layout.dart';
import 'package:devfunmi/widgets/layout/section_wrapper.dart';
import 'package:devfunmi/widgets/text/section_heading.dart';
import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';

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
          const SizedBox(height: AppSpacing.lg),
          ResponsiveLayout(
            desktop: const _DesktopLayout(),
            mobile: const _MobileLayout(),
          ),
        ],
      ),
    );
  }
}

// ── Desktop ────────────────────────────────────────────────────────────────

class _DesktopLayout extends StatelessWidget {
  const _DesktopLayout();

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Left — bio + meta
        Expanded(
          flex: 5,
          child: FadeSlideIn(
            delay: const Duration(milliseconds: 100),
            child: const _LeftPanel(),
          ),
        ),
        const SizedBox(width: AppSpacing.xxl),
        // Right — stats + pillars
        Expanded(
          flex: 4,
          child: FadeSlideIn(
            delay: const Duration(milliseconds: 200),
            child: const _RightPanel(),
          ),
        ),
      ],
    );
  }
}

// ── Mobile ─────────────────────────────────────────────────────────────────

class _MobileLayout extends StatelessWidget {
  const _MobileLayout();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FadeSlideIn(
          delay: const Duration(milliseconds: 100),
          child: const _BioBlock(),
        ),
        const SizedBox(height: AppSpacing.xl),
        FadeSlideIn(
          delay: const Duration(milliseconds: 150),
          child: const _MetaBlock(),
        ),
        const SizedBox(height: AppSpacing.xl),
        FadeSlideIn(
          delay: const Duration(milliseconds: 200),
          child: const _StatsGrid(),
        ),
        const SizedBox(height: AppSpacing.xl),
        FadeSlideIn(
          delay: const Duration(milliseconds: 250),
          child: const _WhatIDoSection(),
        ),
      ],
    );
  }
}

// ── Left Panel ─────────────────────────────────────────────────────────────

class _LeftPanel extends StatelessWidget {
  const _LeftPanel();

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _BioBlock(),
        SizedBox(height: AppSpacing.xl),
        _MetaBlock(),
      ],
    );
  }
}

// ── Right Panel ────────────────────────────────────────────────────────────

class _RightPanel extends StatelessWidget {
  const _RightPanel();

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _StatsGrid(),
        SizedBox(height: AppSpacing.xl),
        _WhatIDoSection(),
      ],
    );
  }
}

// ── Bio Block ──────────────────────────────────────────────────────────────

class _BioBlock extends StatelessWidget {
  const _BioBlock();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Highlighted opening line
        Text(
          'I build mobile products end to end.',
          style: AppTypography.headingL.copyWith(
            color: AppColors.textPrimary,
            height: 1.4,
          ),
        ),
        const SizedBox(height: AppSpacing.md),
        // Bio body
        Text(
          'Over six years building production apps and the backends that power them. '
          'I work across Flutter, native iOS/Swift, and Android/Kotlin for the mobile layer, '
          'and Go for backend services: gRPC, REST and event-driven systems.\n\n'
          "I've shipped apps serving millions of users across banking, crypto, and enterprise. "
          'At TruePath Vision I lead mobile architecture for a cross-platform biometric SDK '
          'with on-device ML and native iOS/Android integrations. I cover the full stack: '
          'system design, native platform channels, Go microservices, CI/CD, and App Store releases.',
          style: AppTypography.bodyLarge,
        ),
      ],
    );
  }
}

// ── Meta Block (currently / location / availability) ──────────────────────

class _MetaBlock extends StatelessWidget {
  const _MetaBlock();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Currently at
        _MetaRow(
          icon: HugeIcons.strokeRoundedBriefcase01,
          label: 'Currently',
          value: 'Lead Engineer · TruePath Vision',
          valueColor: AppColors.accent,
        ),
        const SizedBox(height: AppSpacing.md),
        // Location
        _MetaRow(
          icon: HugeIcons.strokeRoundedLocation01,
          label: 'Based in',
          value: 'Lagos, Nigeria · WAT (UTC+1)',
        ),
        const SizedBox(height: AppSpacing.md),
        // Availability
        const StatusPill(),
      ],
    );
  }
}

class _MetaRow extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final Color? valueColor;

  const _MetaRow({
    required this.icon,
    required this.label,
    required this.value,
    this.valueColor,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        HugeIcon(icon: icon, size: 16, color: AppColors.textMuted),
        const SizedBox(width: AppSpacing.sm),
        Text(
          '$label  ',
          style: AppTypography.label.copyWith(
            color: AppColors.textMuted,
            letterSpacing: 0.5,
          ),
        ),
        Text(
          value,
          style: AppTypography.bodySmall.copyWith(
            color: valueColor ?? AppColors.textSecondary,
          ),
        ),
      ],
    );
  }
}

// ── Stats Grid (2×2) ───────────────────────────────────────────────────────

class _StatsGrid extends StatelessWidget {
  const _StatsGrid();

  static const _stats = [
    _Stat('6+', 'Years Experience'),
    _Stat('10+', 'Apps Shipped'),
    _Stat('99.9%', 'Uptime Record'),
    _Stat('3', 'Industries'),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'BY THE NUMBERS',
          style: AppTypography.label.copyWith(color: AppColors.textMuted),
        ),
        const SizedBox(height: AppSpacing.md),
        Row(
          children: [
            Expanded(child: _StatCard(_stats[0])),
            const SizedBox(width: AppSpacing.md),
            Expanded(child: _StatCard(_stats[1])),
          ],
        ),
        const SizedBox(height: AppSpacing.md),
        Row(
          children: [
            Expanded(child: _StatCard(_stats[2])),
            const SizedBox(width: AppSpacing.md),
            Expanded(child: _StatCard(_stats[3])),
          ],
        ),
      ],
    );
  }
}

class _Stat {
  final String value;
  final String label;
  const _Stat(this.value, this.label);
}

class _StatCard extends StatelessWidget {
  final _Stat stat;
  const _StatCard(this.stat);

  @override
  Widget build(BuildContext context) {
    return GlassCard(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.md,
        vertical: AppSpacing.md,
      ),
      borderRadius: 12,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            stat.value,
            style: AppTypography.displaySmall.copyWith(
              color: AppColors.accent,
              fontWeight: FontWeight.w800,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            stat.label,
            style: AppTypography.label.copyWith(
              color: AppColors.textMuted,
              letterSpacing: 0.5,
            ),
          ),
        ],
      ),
    );
  }
}

// ── What I Do ─────────────────────────────────────────────────────────────

class _WhatIDoSection extends StatelessWidget {
  const _WhatIDoSection();

  static const _pillars = [
    _Pillar(
      icon: HugeIcons.strokeRoundedSmartPhone01,
      title: 'Mobile Engineering',
      tags: 'Flutter · Swift · Kotlin',
    ),
    _Pillar(
      icon: HugeIcons.strokeRoundedServerStack01,
      title: 'Backend Systems',
      tags: 'Go · gRPC · REST · Events',
    ),
    _Pillar(
      icon: HugeIcons.strokeRoundedBuilding04,
      title: 'Architecture & DevOps',
      tags: 'Clean Arch · TDD · CI/CD',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'WHAT I DO',
          style: AppTypography.label.copyWith(color: AppColors.textMuted),
        ),
        const SizedBox(height: AppSpacing.md),
        ..._pillars.map(
          (p) => Padding(
            padding: const EdgeInsets.only(bottom: AppSpacing.sm),
            child: _PillarCard(pillar: p),
          ),
        ),
      ],
    );
  }
}

class _Pillar {
  final IconData icon;
  final String title;
  final String tags;
  const _Pillar({required this.icon, required this.title, required this.tags});
}

class _PillarCard extends StatelessWidget {
  final _Pillar pillar;
  const _PillarCard({required this.pillar});

  @override
  Widget build(BuildContext context) {
    return GlassCard(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.md,
        vertical: AppSpacing.sm + 4,
      ),
      borderRadius: 10,
      child: Row(
        children: [
          Container(
            width: 36,
            height: 36,
            decoration: BoxDecoration(
              color: AppColors.accent.withValues(alpha: 0.08),
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: AppColors.borderAccent),
            ),
            child: HugeIcon(icon: pillar.icon, size: 18, color: AppColors.accent),
          ),
          const SizedBox(width: AppSpacing.md),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  pillar.title,
                  style: AppTypography.headingS.copyWith(
                    color: AppColors.textPrimary,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  pillar.tags,
                  style: AppTypography.monoSmall,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
