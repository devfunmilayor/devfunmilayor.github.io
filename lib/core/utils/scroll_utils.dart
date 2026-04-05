import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
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
    final ctx = sectionKeys[section]?.currentContext;
    if (ctx == null || _controller == null) return;
    final renderObject = ctx.findRenderObject();
    if (renderObject == null) return;

    // Use RenderAbstractViewport.getOffsetToReveal for accurate sliver offsets.
    // This is what Scrollable.ensureVisible uses internally, but we call
    // animateTo ourselves so we use our own controller.
    final viewport = RenderAbstractViewport.maybeOf(renderObject);
    if (viewport == null) return;

    final revealOffset =
        viewport.getOffsetToReveal(renderObject, 0.0).offset;
    final target = (revealOffset - AppSpacing.navHeight)
        .clamp(0.0, _controller!.position.maxScrollExtent);

    _controller!.animateTo(
      target,
      duration: const Duration(milliseconds: 600),
      curve: Curves.easeInOutCubic,
    );
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
