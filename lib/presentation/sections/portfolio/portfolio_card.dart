import 'dart:math' as math;
import 'package:devfunmi/core/constants/app_animations.dart';
import 'package:devfunmi/core/constants/app_colors.dart';
import 'package:devfunmi/core/constants/app_spacing.dart';
import 'package:devfunmi/core/constants/app_typography.dart';
import 'package:devfunmi/data/models/portfolio_model.dart';
import 'package:devfunmi/widgets/badges/app_store_type.dart';
import 'package:devfunmi/widgets/badges/store_badge.dart';
import 'package:devfunmi/widgets/chips/tag_chip.dart';
import 'package:devfunmi/widgets/glass/glass_card.dart';
import 'package:devfunmi/widgets/layout/responsive_layout.dart';
import 'package:flutter/material.dart';
import 'portfolio_card_back.dart';

class PortfolioCard extends StatefulWidget {
  final PortfolioModel data;

  const PortfolioCard({super.key, required this.data});

  @override
  State<PortfolioCard> createState() => _PortfolioCardState();
}

class _PortfolioCardState extends State<PortfolioCard>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  bool _showBack = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: AppAnimations.flipDuration,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _flip() {
    if (_controller.isAnimating) return;
    if (_showBack) {
      _controller.reverse().then((_) {
        if (mounted) setState(() => _showBack = false);
      });
    } else {
      setState(() => _showBack = true);
      _controller.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveLayout.isMobile(context);

    return MouseRegion(
      onEnter: isMobile ? null : (_) => Future.microtask(_flip),
      onExit: isMobile ? null : (_) => Future.microtask(_flip),
      child: GestureDetector(
        onTap: isMobile ? _flip : null,
        child: AnimatedBuilder(
          animation: _controller,
          builder: (context, _) {
            final angle = _controller.value * math.pi;
            final isFront = angle <= math.pi / 2;

            return Transform(
              alignment: Alignment.center,
              transform: Matrix4.identity()
                ..setEntry(3, 2, 0.001)
                ..rotateY(angle),
              child: isFront
                  ? _buildFront()
                  : Transform(
                      alignment: Alignment.center,
                      transform: Matrix4.identity()..rotateY(math.pi),
                      child: PortfolioCardBack(
                        data: widget.data,
                        onFlip: _flip,
                      ),
                    ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildFront() {
    final previewTags = widget.data.tags.take(3).toList();
    final extraCount = widget.data.tags.length - previewTags.length;

    return GlassCard(
      hoverable: true,
      onTap: ResponsiveLayout.isMobile(context) ? _flip : null,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // App name
          Text(
            widget.data.appName,
            style: AppTypography.mono.copyWith(
              color: AppColors.accent,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: AppSpacing.xs),

          // Company
          Text(
            widget.data.company,
            style: AppTypography.bodySmall.copyWith(color: AppColors.textMuted),
          ),
          Text(widget.data.period, style: AppTypography.monoSmall),
          const SizedBox(height: AppSpacing.md),

          // Description
          Text(
            widget.data.description,
            style: AppTypography.bodySmall.copyWith(
              color: AppColors.textSecondary,
            ),
            maxLines: 4,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: AppSpacing.md),

          // Tags preview
          Wrap(
            spacing: AppSpacing.xs,
            runSpacing: AppSpacing.xs,
            children: [
              ...previewTags.map((t) => TagChip(label: t)),
              if (extraCount > 0) TagChip(label: '+$extraCount more'),
            ],
          ),
          const SizedBox(height: AppSpacing.md),

          // Store badges
          Row(
            children: [
              if (widget.data.iosUrl != null)
                Padding(
                  padding: const EdgeInsets.only(right: AppSpacing.sm),
                  child: StoreBadge(
                    type: AppStoreType.ios,
                    url: widget.data.iosUrl!,
                  ),
                ),
              if (widget.data.androidUrl != null)
                StoreBadge(
                  type: AppStoreType.android,
                  url: widget.data.androidUrl!,
                ),
            ],
          ),

          // Flip hint
          const SizedBox(height: AppSpacing.sm),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                'flip for details',
                style: AppTypography.monoSmall.copyWith(
                  color: AppColors.textMuted.withValues(alpha: 0.6),
                ),
              ),
              const SizedBox(width: AppSpacing.xs),
              Icon(
                Icons.flip,
                size: 12,
                color: AppColors.textMuted.withValues(alpha: 0.6),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
