import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_spacing.dart';
import '../../core/constants/app_typography.dart';
import '../../core/utils/pwa_install_service.dart';

class PwaInstallButton extends StatelessWidget {
  final PwaInstallService service;

  /// [compact] = icon-only button for the desktop nav bar.
  /// [compact] = false shows label + icon for the mobile drawer.
  final bool compact;

  const PwaInstallButton({
    super.key,
    required this.service,
    this.compact = false,
  });

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: service,
      builder: (context, _) {
        if (!service.showInstallOption) return const SizedBox.shrink();

        return compact
            ? _CompactButton(service: service)
            : _FullButton(service: service);
      },
    );
  }
}

// ── Desktop nav — icon-only ────────────────────────────────────────────────

class _CompactButton extends StatefulWidget {
  final PwaInstallService service;
  const _CompactButton({required this.service});

  @override
  State<_CompactButton> createState() => _CompactButtonState();
}

class _CompactButtonState extends State<_CompactButton> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: 'Install app',
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        onEnter: (_) =>
            Future.microtask(() { if (mounted) setState(() => _hovered = true); }),
        onExit: (_) =>
            Future.microtask(() { if (mounted) setState(() => _hovered = false); }),
        child: GestureDetector(
          onTap: () => _handleTap(context),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 150),
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: _hovered ? AppColors.surface : Colors.transparent,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: _hovered ? AppColors.accent : AppColors.border,
              ),
            ),
            child: HugeIcon(
              icon: HugeIcons.strokeRoundedDownload01,
              color: _hovered ? AppColors.accent : AppColors.textMuted,
              size: 18,
            ),
          ),
        ),
      ),
    );
  }

  void _handleTap(BuildContext context) {
    if (widget.service.isIOS) {
      _showIOSSheet(context);
    } else {
      widget.service.install();
    }
  }
}

// ── Mobile drawer — label + icon ───────────────────────────────────────────

class _FullButton extends StatelessWidget {
  final PwaInstallService service;
  const _FullButton({required this.service});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (service.isIOS) {
          Navigator.of(context).pop();
          // Delay until drawer close animation finishes before showing sheet.
          // Sheet is shown via the root navigator so no stale context risk.
          final rootContext = context;
          WidgetsBinding.instance.addPostFrameCallback((_) {
            Future.delayed(const Duration(milliseconds: 300), () {
              if (rootContext.mounted) _showIOSSheet(rootContext);
            });
          });
        } else {
          Navigator.of(context).pop();
          service.install();
        }
      },
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.xl,
          vertical: AppSpacing.md,
        ),
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: AppColors.border),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            HugeIcon(
              icon: HugeIcons.strokeRoundedDownload01,
              color: AppColors.textMuted,
              size: 18,
            ),
            const SizedBox(width: AppSpacing.sm),
            Text(
              'Install App',
              style: AppTypography.bodyMedium.copyWith(
                color: AppColors.textMuted,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ── iOS instruction sheet ──────────────────────────────────────────────────

void _showIOSSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    backgroundColor: AppColors.surface,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder: (_) => const _IOSInstallSheet(),
  );
}

class _IOSInstallSheet extends StatelessWidget {
  const _IOSInstallSheet();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(
        AppSpacing.xl,
        AppSpacing.lg,
        AppSpacing.xl,
        AppSpacing.xxl,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Handle bar
          Center(
            child: Container(
              width: 36,
              height: 4,
              decoration: BoxDecoration(
                color: AppColors.border,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ),
          const SizedBox(height: AppSpacing.lg),

          // Title
          Row(
            children: [
              HugeIcon(
                icon: HugeIcons.strokeRoundedSmartPhone01,
                color: AppColors.accent,
                size: 22,
              ),
              const SizedBox(width: AppSpacing.sm),
              Text(
                'Install this app',
                style: AppTypography.headingS.copyWith(
                  color: AppColors.textPrimary,
                ),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.lg),

          // Steps
          _Step(
            number: '1',
            icon: HugeIcons.strokeRoundedArrowRight01,
            text: 'Tap the Share button ( ↑ ) in Safari\'s toolbar',
          ),
          const SizedBox(height: AppSpacing.md),
          _Step(
            number: '2',
            icon: HugeIcons.strokeRoundedArrowRight01,
            text: 'Scroll down and tap "Add to Home Screen"',
          ),
          const SizedBox(height: AppSpacing.md),
          _Step(
            number: '3',
            icon: HugeIcons.strokeRoundedTick01,
            text: 'Tap Add — the app launches like a native app',
          ),
        ],
      ),
    );
  }
}

class _Step extends StatelessWidget {
  final String number;
  final IconData icon;
  final String text;

  const _Step({
    required this.number,
    required this.icon,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 24,
          height: 24,
          decoration: BoxDecoration(
            color: AppColors.accent.withValues(alpha: 0.1),
            shape: BoxShape.circle,
            border: Border.all(color: AppColors.borderAccent),
          ),
          child: Center(
            child: Text(
              number,
              style: AppTypography.monoSmall.copyWith(
                color: AppColors.accent,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
        const SizedBox(width: AppSpacing.md),
        Expanded(
          child: Text(
            text,
            style: AppTypography.bodyMedium.copyWith(
              color: AppColors.textSecondary,
            ),
          ),
        ),
      ],
    );
  }
}
