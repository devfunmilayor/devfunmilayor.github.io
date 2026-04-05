import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_typography.dart';
import '../../../core/constants/app_spacing.dart';
import '../../../core/constants/app_animations.dart';

class NavLinks extends StatelessWidget {
  final String activeSection;
  final void Function(String section) onLinkTap;

  static const List<Map<String, String>> _links = [
    {'label': 'About', 'key': 'about'},
    {'label': 'Skills', 'key': 'skills'},
    {'label': 'Experience', 'key': 'experience'},
    {'label': 'Portfolio', 'key': 'portfolio'},
    {'label': 'Booking', 'key': 'booking'},
    {'label': 'Contact', 'key': 'contact'},
  ];

  const NavLinks({
    super.key,
    required this.activeSection,
    required this.onLinkTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: _links.map((link) {
        final isActive = activeSection == link['key'];
        return _NavLinkItem(
          label: link['label']!,
          sectionKey: link['key']!,
          isActive: isActive,
          onTap: () => onLinkTap(link['key']!),
        );
      }).toList(),
    );
  }
}

class _NavLinkItem extends StatefulWidget {
  final String label;
  final String sectionKey;
  final bool isActive;
  final VoidCallback onTap;

  const _NavLinkItem({
    required this.label,
    required this.sectionKey,
    required this.isActive,
    required this.onTap,
  });

  @override
  State<_NavLinkItem> createState() => _NavLinkItemState();
}

class _NavLinkItemState extends State<_NavLinkItem> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => Future.microtask(() { if (mounted) setState(() => _hovered = true); }),
      onExit: (_) => Future.microtask(() { if (mounted) setState(() => _hovered = false); }),
      child: GestureDetector(
        onTap: widget.onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                widget.label,
                style: AppTypography.bodySmall.copyWith(
                  color: widget.isActive || _hovered
                      ? AppColors.textPrimary
                      : AppColors.textMuted,
                  fontWeight: widget.isActive
                      ? FontWeight.w600
                      : FontWeight.w400,
                ),
              ),
              const SizedBox(height: 3),
              AnimatedContainer(
                duration: AppAnimations.hoverDuration,
                height: 2,
                width: widget.isActive || _hovered ? 20 : 0,
                decoration: BoxDecoration(
                  color: AppColors.accent,
                  borderRadius: BorderRadius.circular(1),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
