import 'package:devfunmi/core/constants/app_animations.dart';
import 'package:devfunmi/core/constants/app_colors.dart';
import 'package:devfunmi/core/constants/app_spacing.dart';
import 'package:devfunmi/core/constants/app_typography.dart';
import 'package:devfunmi/data/models/experience_model.dart';
import 'package:devfunmi/widgets/chips/tag_chip.dart';
import 'package:devfunmi/widgets/glass/glass_card.dart';
import 'package:flutter/material.dart';

class ExperienceNode extends StatefulWidget {
  final ExperienceModel data;
  final bool isLast;

  const ExperienceNode({
    super.key,
    required this.data,
    this.isLast = false,
  });

  @override
  State<ExperienceNode> createState() => _ExperienceNodeState();
}

class _ExperienceNodeState extends State<ExperienceNode>
    with SingleTickerProviderStateMixin {
  AnimationController? _pulseController;
  Animation<double>? _pulseAnim;

  @override
  void initState() {
    super.initState();
    if (widget.data.isCurrent) {
      _pulseController = AnimationController(
        vsync: this,
        duration: AppAnimations.dotPulseDuration,
      )..repeat(reverse: true);
      _pulseAnim = Tween<double>(begin: 0.4, end: 1.0).animate(
        CurvedAnimation(parent: _pulseController!, curve: Curves.easeInOut),
      );
    }
  }

  @override
  void dispose() {
    _pulseController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: AppSpacing.lg),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Timeline column
          SizedBox(
            width: 24,
            child: Column(
              children: [
                // Dot
                widget.data.isCurrent && _pulseAnim != null
                    ? AnimatedBuilder(
                        animation: _pulseAnim!,
                        builder: (context, _) => Container(
                          width: 14,
                          height: 14,
                          decoration: BoxDecoration(
                            color: AppColors.accent,
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color: AppColors.accent
                                    .withValues(alpha: _pulseAnim!.value),
                                blurRadius: 12,
                                spreadRadius: 2,
                              ),
                            ],
                          ),
                        ),
                      )
                    : Container(
                        width: 10,
                        height: 10,
                        decoration: BoxDecoration(
                          color: AppColors.border,
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: AppColors.borderHover,
                          ),
                        ),
                      ),
                // Line
                if (!widget.isLast)
                  Padding(
                    padding: const EdgeInsets.only(top: 4),
                    child: Container(
                      width: 1,
                      height: 160,
                      color: AppColors.timelineLine,
                    ),
                  ),
              ],
            ),
          ),
          const SizedBox(width: AppSpacing.md),

          // Content
          Expanded(
            child: GlassCard(
              hoverable: true,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Company + period
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          widget.data.company,
                          style: AppTypography.headingS.copyWith(
                            color: AppColors.textPrimary,
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: AppSpacing.sm,
                          vertical: 2,
                        ),
                        decoration: BoxDecoration(
                          color: widget.data.isCurrent
                              ? AppColors.accent.withValues(alpha: 0.1)
                              : AppColors.surface,
                          borderRadius: BorderRadius.circular(4),
                          border: Border.all(
                            color: widget.data.isCurrent
                                ? AppColors.borderAccent
                                : AppColors.border,
                          ),
                        ),
                        child: Text(
                          widget.data.period,
                          style: AppTypography.monoSmall.copyWith(
                            color: widget.data.isCurrent
                                ? AppColors.accent
                                : AppColors.textMuted,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: AppSpacing.xs),

                  // Role
                  Text(
                    widget.data.role,
                    style: AppTypography.bodyMedium.copyWith(
                      color: AppColors.accent,
                      fontWeight: FontWeight.w500,
                    ),
                  ),

                  // Location
                  Text(
                    widget.data.location,
                    style: AppTypography.bodySmall,
                  ),
                  const SizedBox(height: AppSpacing.md),

                  // Highlights
                  ...widget.data.highlights.map(
                    (h) => Padding(
                      padding: const EdgeInsets.only(bottom: AppSpacing.sm),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(top: 4),
                            child: Icon(
                              Icons.check,
                              color: AppColors.accent,
                              size: 14,
                            ),
                          ),
                          const SizedBox(width: AppSpacing.sm),
                          Expanded(
                            child: Text(
                              h,
                              style: AppTypography.bodySmall.copyWith(
                                color: AppColors.textSecondary,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  // Tech tags
                  if (widget.data.tags.isNotEmpty) ...[
                    const SizedBox(height: AppSpacing.md),
                    Wrap(
                      spacing: AppSpacing.sm,
                      runSpacing: AppSpacing.sm,
                      children: widget.data.tags
                          .map((t) => TagChip(label: t, hoverable: true))
                          .toList(),
                    ),
                  ],
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
