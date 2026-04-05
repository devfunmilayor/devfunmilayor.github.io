import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_animations.dart';
import '../../core/utils/launch_utils.dart';

class IconLinkButton extends StatefulWidget {
  final IconData icon;
  final String url;
  final String? tooltip;
  final double size;

  const IconLinkButton({
    super.key,
    required this.icon,
    required this.url,
    this.tooltip,
    this.size = 20,
  });

  @override
  State<IconLinkButton> createState() => _IconLinkButtonState();
}

class _IconLinkButtonState extends State<IconLinkButton> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    final btn = MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: GestureDetector(
        onTap: () => LaunchUtils.open(widget.url),
        child: AnimatedContainer(
          duration: AppAnimations.hoverDuration,
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: _hovered ? AppColors.surface : Colors.transparent,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: _hovered ? AppColors.borderHover : AppColors.border,
            ),
          ),
          child: Icon(
            widget.icon,
            color: _hovered ? AppColors.textPrimary : AppColors.textMuted,
            size: widget.size,
          ),
        ),
      ),
    );

    if (widget.tooltip != null) {
      return Tooltip(message: widget.tooltip!, child: btn);
    }
    return btn;
  }
}
