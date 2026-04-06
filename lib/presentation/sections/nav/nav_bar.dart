import 'package:devfunmi/core/constants/app_animations.dart';
import 'package:devfunmi/core/constants/app_colors.dart';
import 'package:devfunmi/core/constants/app_spacing.dart';
import 'package:devfunmi/core/constants/app_strings.dart';
import 'package:devfunmi/core/utils/cv_download_stub.dart';
import 'package:devfunmi/widgets/buttons/ghost_button.dart';
import 'package:devfunmi/widgets/layout/responsive_layout.dart';
import 'package:flutter/material.dart';
import 'nav_logo.dart';
import 'nav_links.dart';

class NavBar extends StatefulWidget {
  final ScrollController scrollController;
  final String activeSection;
  final void Function(String section) onNavTap;

  const NavBar({
    super.key,
    required this.scrollController,
    required this.activeSection,
    required this.onNavTap,
  });

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  bool _isScrolled = false;

  @override
  void initState() {
    super.initState();
    widget.scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    widget.scrollController.removeListener(_onScroll);
    super.dispose();
  }

  void _onScroll() {
    final scrolled = widget.scrollController.offset > 80;
    if (scrolled != _isScrolled) {
      setState(() => _isScrolled = scrolled);
    }
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveLayout.isMobile(context);
    final hPad = isMobile
        ? AppSpacing.pagePadMobile
        : AppSpacing.pagePadDesktop;

    return AnimatedContainer(
      duration: AppAnimations.navBlurDuration,
      height: AppSpacing.navHeight,
      padding: EdgeInsets.symmetric(horizontal: hPad),
      decoration: BoxDecoration(
        color: _isScrolled ? AppColors.navBlur : Colors.transparent,
        border: _isScrolled
            ? const Border(
                bottom: BorderSide(color: AppColors.border),
              )
            : null,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: AppSpacing.maxWidth),
          child: Row(
            children: [
              const NavLogo(),
              const Spacer(),
              if (!isMobile) ...[
                NavLinks(
                  activeSection: widget.activeSection,
                  onLinkTap: widget.onNavTap,
                ),
                const SizedBox(width: AppSpacing.lg),
                GhostButton(
                  label: AppStrings.navDownloadCV,
                  icon: Icons.download,
                  onTap: downloadCV,
                ),
              ] else ...[
                Builder(
                  builder: (context) => IconButton(
                    icon: const Icon(
                      Icons.menu,
                      color: AppColors.textPrimary,
                    ),
                    onPressed: () => Scaffold.of(context).openEndDrawer(),
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
