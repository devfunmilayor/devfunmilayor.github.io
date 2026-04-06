import 'package:flutter/material.dart';
import '../constants/app_strings.dart';
import '../constants/app_spacing.dart';

abstract class ScrollUtils {
  static final Map<String, GlobalKey> sectionKeys = {
    AppStrings.sectionHero: GlobalKey(),
    AppStrings.sectionAbout: GlobalKey(),
    AppStrings.sectionSkills: GlobalKey(),
    AppStrings.sectionExperience: GlobalKey(),
    AppStrings.sectionPortfolio: GlobalKey(),
    AppStrings.sectionBooking: GlobalKey(),
    AppStrings.sectionContact: GlobalKey(),
    AppStrings.sectionFooter: GlobalKey(),
  };

  static ScrollController? _controller;

  static void registerController(ScrollController controller) {
    _controller = controller;
  }

  static void scrollTo(String section) {
    // Use addPostFrameCallback so layout is guaranteed complete before we
    // read render object positions — critical for sections below the fold.
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final ctx = sectionKeys[section]?.currentContext;
      if (ctx == null || _controller == null) return;

      final box = ctx.findRenderObject() as RenderBox?;
      if (box == null) return;

      // localToGlobal gives the widget's current Y on screen.
      // Adding the current scroll offset gives its absolute position in the
      // document, then subtract nav height so it isn't hidden behind the bar.
      final screenY = box.localToGlobal(Offset.zero).dy;
      final target = (_controller!.offset + screenY - AppSpacing.navHeight)
          .clamp(0.0, double.maxFinite);

      _controller!.animateTo(
        target,
        duration: const Duration(milliseconds: 600),
        curve: Curves.easeInOutCubic,
      );
    });
  }

  static String activeSection(double scrollOffset) {
    for (final entry in sectionKeys.entries) {
      final ctx = entry.value.currentContext;
      if (ctx == null) continue;
      final box = ctx.findRenderObject() as RenderBox?;
      if (box == null) continue;
      final offset = box.localToGlobal(Offset.zero);
      if (offset.dy <= 120 && offset.dy + box.size.height > 120) {
        return entry.key;
      }
    }
    return AppStrings.sectionHero;
  }
}
