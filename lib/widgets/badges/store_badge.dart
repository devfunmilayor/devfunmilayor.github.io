import 'package:devfunmi/core/constants/app_animations.dart';
import 'package:devfunmi/core/constants/app_colors.dart';
import 'package:devfunmi/core/constants/app_spacing.dart';
import 'package:devfunmi/core/constants/app_typography.dart';
import 'package:devfunmi/core/utils/launch_utils.dart';
import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'app_store_type.dart';

class StoreBadge extends StatefulWidget {
  final AppStoreType type;
  final String url;

  const StoreBadge({super.key, required this.type, required this.url});

  @override
  State<StoreBadge> createState() => _StoreBadgeState();
}

class _StoreBadgeState extends State<StoreBadge> {
  bool _hovered = false;

  String get _label =>
      widget.type == AppStoreType.ios ? 'App Store' : 'Play Store';

  IconData get _icon =>
      widget.type == AppStoreType.ios ? HugeIcons.strokeRoundedApple : HugeIcons.strokeRoundedAndroid;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => Future.microtask(() { if (mounted) setState(() => _hovered = true); }),
      onExit: (_) => Future.microtask(() { if (mounted) setState(() => _hovered = false); }),
      child: GestureDetector(
        onTap: () => LaunchUtils.open(widget.url),
        child: AnimatedContainer(
          duration: AppAnimations.hoverDuration,
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.md,
            vertical: AppSpacing.sm,
          ),
          decoration: BoxDecoration(
            color: _hovered ? AppColors.surfaceHover : AppColors.surface,
            borderRadius: BorderRadius.circular(6),
            border: Border.all(
              color: _hovered ? AppColors.borderHover : AppColors.border,
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              HugeIcon(
                icon: _icon,
                color: _hovered
                    ? AppColors.textPrimary
                    : AppColors.textSecondary,
                size: 16,
              ),
              const SizedBox(width: AppSpacing.xs),
              Text(
                _label,
                style: AppTypography.bodySmall.copyWith(
                  color: _hovered
                      ? AppColors.textPrimary
                      : AppColors.textSecondary,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
