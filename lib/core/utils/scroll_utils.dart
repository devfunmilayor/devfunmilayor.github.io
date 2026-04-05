import 'package:flutter/material.dart';
import '../constants/app_strings.dart';

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

  static void scrollTo(String section) {
    final context = sectionKeys[section]?.currentContext;
    if (context == null) return;
    Scrollable.ensureVisible(
      context,
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
