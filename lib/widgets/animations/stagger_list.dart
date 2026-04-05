import 'package:flutter/material.dart';
import '../../core/constants/app_animations.dart';
import 'fade_slide_in.dart';

class StaggerList extends StatelessWidget {
  final List<Widget> children;
  final Duration staggerDelay;
  final Duration initialDelay;
  final CrossAxisAlignment crossAxisAlignment;

  const StaggerList({
    super.key,
    required this.children,
    this.staggerDelay = AppAnimations.staggerDelay,
    this.initialDelay = Duration.zero,
    this.crossAxisAlignment = CrossAxisAlignment.start,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: crossAxisAlignment,
      children: children.indexed.map((entry) {
        final (index, child) = entry;
        return FadeSlideIn(
          delay: initialDelay + (staggerDelay * index),
          child: child,
        );
      }).toList(),
    );
  }
}
