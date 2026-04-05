import 'package:flutter/material.dart';
import '../../../core/constants/app_spacing.dart';
import '../../../core/constants/app_strings.dart';
import '../../../widgets/chips/stat_chip.dart';

class HeroStatChips extends StatelessWidget {
  const HeroStatChips({super.key});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: AppSpacing.sm,
      runSpacing: AppSpacing.sm,
      children: const [
        StatChip(value: AppStrings.yearsExperience, label: 'Years Experience'),
        StatChip(value: AppStrings.liveApps, label: 'Live Apps'),
        StatChip(value: AppStrings.uptime, label: 'Uptime SLA'),
        StatChip(value: AppStrings.latencyReduced, label: 'Latency Reduced'),
      ],
    );
  }
}
