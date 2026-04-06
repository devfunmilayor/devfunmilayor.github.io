import 'package:devfunmi/core/constants/app_colors.dart';
import 'package:devfunmi/core/constants/app_strings.dart';
import 'package:devfunmi/core/utils/scroll_utils.dart';
import 'package:devfunmi/presentation/sections/about/about_section.dart';
import 'package:devfunmi/presentation/sections/booking/booking_section.dart';
import 'package:devfunmi/presentation/sections/contact/contact_section.dart';
import 'package:devfunmi/presentation/sections/experience/experience_section.dart';
import 'package:devfunmi/presentation/sections/footer/footer_section.dart';
import 'package:devfunmi/presentation/sections/hero/hero_section.dart';
import 'package:devfunmi/presentation/sections/nav/mobile_drawer.dart';
import 'package:devfunmi/presentation/sections/nav/nav_bar.dart';
import 'package:devfunmi/presentation/sections/portfolio/portfolio_section.dart';
import 'package:devfunmi/presentation/sections/skills/skills_section.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  final String? initialSection;

  const HomePage({super.key, this.initialSection});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScrollController _scrollController = ScrollController();
  String _activeSection = AppStrings.sectionHero;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_updateActiveSection);
    ScrollUtils.registerController(_scrollController);

    if (widget.initialSection != null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        ScrollUtils.scrollTo(widget.initialSection!);
      });
    }
  }

  @override
  void dispose() {
    _scrollController.removeListener(_updateActiveSection);
    _scrollController.dispose();
    super.dispose();
  }

  void _updateActiveSection() {
    for (final entry in ScrollUtils.sectionKeys.entries) {
      final ctx = entry.value.currentContext;
      if (ctx == null) continue;
      final box = ctx.findRenderObject() as RenderBox?;
      if (box == null) continue;
      final offset = box.localToGlobal(Offset.zero);
      if (offset.dy <= 120 && offset.dy + box.size.height > 120) {
        if (_activeSection != entry.key) {
          setState(() => _activeSection = entry.key);
        }
        break;
      }
    }
  }

  void _onNavTap(String section) {
    ScrollUtils.scrollTo(section);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      endDrawer: MobileDrawer(
        activeSection: _activeSection,
        onLinkTap: _onNavTap,
      ),
      body: Stack(
        children: [
          // Scrollable content
          CustomScrollView(
            controller: _scrollController,
            slivers: [
              SliverList(
                delegate: SliverChildListDelegate([
                  const HeroSection(),
                  const AboutSection(),
                  const SkillsSection(),
                  const ExperienceSection(),
                  const PortfolioSection(),
                  const BookingSection(),
                  const ContactSection(),
                  const FooterSection(),
                ]),
              ),
            ],
          ),

          // Fixed NavBar overlay
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: NavBar(
              scrollController: _scrollController,
              activeSection: _activeSection,
              onNavTap: _onNavTap,
            ),
          ),
        ],
      ),
    );
  }
}
