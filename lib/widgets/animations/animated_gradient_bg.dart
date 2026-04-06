import 'package:devfunmi/core/constants/app_animations.dart';
import 'package:devfunmi/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class AnimatedGradientBg extends StatefulWidget {
  final Widget child;

  const AnimatedGradientBg({super.key, required this.child});

  @override
  State<AnimatedGradientBg> createState() => _AnimatedGradientBgState();
}

class _AnimatedGradientBgState extends State<AnimatedGradientBg>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: AppAnimations.meshCycleDuration,
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (_, child) {
        return Container(
          decoration: BoxDecoration(
            gradient: RadialGradient(
              center: Alignment.lerp(
                    const Alignment(-0.8, -0.6),
                    const Alignment(0.4, 0.2),
                    _controller.value,
                  ) ??
                  Alignment.topLeft,
              radius: 1.2,
              colors: [
                AppColors.accent.withValues(alpha: 0.06),
                AppColors.secondary.withValues(alpha: 0.04),
                AppColors.background,
              ],
              stops: const [0.0, 0.4, 1.0],
            ),
          ),
          child: child,
        );
      },
      child: widget.child,
    );
  }
}
