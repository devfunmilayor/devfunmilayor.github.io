import 'package:flutter/material.dart';
import '../../core/constants/app_spacing.dart';
import '../layout/responsive_layout.dart';

class SectionWrapper extends StatelessWidget {
  final Widget child;
  final Color? backgroundColor;
  final double? paddingV;
  final GlobalKey? sectionKey;

  const SectionWrapper({
    super.key,
    required this.child,
    this.backgroundColor,
    this.paddingV,
    this.sectionKey,
  });

  @override
  Widget build(BuildContext context) {
    final isDesktop = ResponsiveLayout.isDesktop(context);
    final isMobile = ResponsiveLayout.isMobile(context);

    final hPad = isMobile
        ? AppSpacing.pagePadMobile
        : isDesktop
            ? AppSpacing.pagePadDesktop
            : AppSpacing.pagePadTablet;

    final vPad = paddingV ??
        (isMobile
            ? AppSpacing.sectionPaddingVMobile
            : AppSpacing.sectionPaddingV);

    return Container(
      key: sectionKey,
      width: double.infinity,
      color: backgroundColor,
      padding: EdgeInsets.symmetric(horizontal: hPad, vertical: vPad),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: AppSpacing.maxWidth),
          child: child,
        ),
      ),
    );
  }
}
