import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_typography.dart';
import '../../core/constants/app_spacing.dart';
import '../../core/constants/app_animations.dart';

class TagChip extends StatefulWidget {
  final String label;
  final bool hoverable;

  const TagChip({super.key, required this.label, this.hoverable = false});

  @override
  State<TagChip> createState() => _TagChipState();
}

class _TagChipState extends State<TagChip> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) {
        if (widget.hoverable) Future.microtask(() { if (mounted) setState(() => _hovered = true); });
      },
      onExit: (_) {
        if (widget.hoverable) Future.microtask(() { if (mounted) setState(() => _hovered = false); });
      },
      child: AnimatedContainer(
        duration: AppAnimations.hoverDuration,
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.sm + 2,
          vertical: AppSpacing.xs,
        ),
        decoration: BoxDecoration(
          color: _hovered
              ? AppColors.accent.withValues(alpha: 0.1)
              : AppColors.surface,
          borderRadius: BorderRadius.circular(6),
          border: Border.all(
            color: _hovered ? AppColors.borderAccent : AppColors.border,
          ),
        ),
        child: Text(
          widget.label,
          style: AppTypography.monoSmall.copyWith(
            color: _hovered ? AppColors.accent : AppColors.textSecondary,
          ),
        ),
      ),
    );
  }
}
