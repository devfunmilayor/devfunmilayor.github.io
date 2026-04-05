import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_spacing.dart';
import '../../core/constants/app_animations.dart';

class GlassCard extends StatefulWidget {
  final Widget child;
  final EdgeInsetsGeometry? padding;
  final double borderRadius;
  final bool hoverable;
  final VoidCallback? onTap;
  final Color? borderColor;
  final bool accentBorder;

  const GlassCard({
    super.key,
    required this.child,
    this.padding,
    this.borderRadius = 16,
    this.hoverable = false,
    this.onTap,
    this.borderColor,
    this.accentBorder = false,
  });

  @override
  State<GlassCard> createState() => _GlassCardState();
}

class _GlassCardState extends State<GlassCard> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    final isHoveredActive = _hovered && widget.hoverable;

    return MouseRegion(
      cursor: widget.onTap != null
          ? SystemMouseCursors.click
          : MouseCursor.defer,
      onEnter: (_) {
        if (widget.hoverable) {
          Future.microtask(() { if (mounted) setState(() => _hovered = true); });
        }
      },
      onExit: (_) {
        if (widget.hoverable) {
          Future.microtask(() { if (mounted) setState(() => _hovered = false); });
        }
      },
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: AppAnimations.hoverDuration,
          padding:
              widget.padding ?? const EdgeInsets.all(AppSpacing.lg),
          decoration: BoxDecoration(
            color: isHoveredActive
                ? AppColors.surfaceHover
                : AppColors.surface,
            borderRadius: BorderRadius.circular(widget.borderRadius),
            border: Border.all(
              color: widget.accentBorder
                  ? AppColors.borderAccent
                  : isHoveredActive
                      ? AppColors.borderHover
                      : widget.borderColor ?? AppColors.border,
            ),
            boxShadow: isHoveredActive
                ? [
                    BoxShadow(
                      color: AppColors.accent.withValues(alpha: 0.08),
                      blurRadius: 24,
                      spreadRadius: 0,
                    ),
                  ]
                : widget.accentBorder
                    ? [
                        BoxShadow(
                          color: AppColors.accent.withValues(alpha: 0.06),
                          blurRadius: 16,
                          spreadRadius: 0,
                        ),
                      ]
                    : [],
          ),
          child: widget.child,
        ),
      ),
    );
  }
}
