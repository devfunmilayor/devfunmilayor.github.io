import 'package:flutter/material.dart';
import '../constants/app_breakpoints.dart';
import '../constants/app_spacing.dart';

abstract class ResponsiveUtils {
  static T value<T>(
    BuildContext context, {
    required T mobile,
    T? tablet,
    required T desktop,
  }) {
    if (AppBreakpoints.isDesktop(context)) return desktop;
    if (AppBreakpoints.isTablet(context)) return tablet ?? desktop;
    return mobile;
  }

  static double horizontalPadding(BuildContext context) {
    return value(
      context,
      mobile: AppSpacing.pagePadMobile,
      tablet: AppSpacing.pagePadTablet,
      desktop: AppSpacing.pagePadDesktop,
    );
  }

  static double sectionPaddingV(BuildContext context) {
    return value(
      context,
      mobile: AppSpacing.sectionPaddingVMobile,
      desktop: AppSpacing.sectionPaddingV,
    );
  }
}
