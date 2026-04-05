import 'dart:async';
import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_typography.dart';
import '../../../core/constants/app_spacing.dart';
import '../../../core/constants/app_animations.dart';
import '../../../widgets/glass/glass_card.dart';
import '../../../widgets/animations/blinking_cursor.dart';

class HeroTerminal extends StatefulWidget {
  const HeroTerminal({super.key});

  @override
  State<HeroTerminal> createState() => _HeroTerminalState();
}

class _HeroTerminalState extends State<HeroTerminal> {
  static const List<String> _lines = [
    r'$ flutter doctor',
    r'[✓] Flutter (Channel stable, 3.x)',
    r'[✓] Dart SDK 3.x',
    r'',
    r'$ cat dev_funmi.json',
    r'{',
    r'  "name": "Emmanuel Olufunmilayo",',
    r'  "role": "Lead Flutter Engineer",',
    r'  "stack": ["Flutter", "Kotlin", "Swift", "Go"],',
    r'  "apps_shipped": 10,',
    r'  "uptime": "99.9%",',
    r'  "open_to_work": true',
    r'}',
    r'',
    r'$ flutter build web --release',
    r'  Building... ████████████ 100%',
    r'  ✓ Compiled. Ready to ship.',
  ];

  final List<String> _visibleLines = [];
  int _lineIndex = 0;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _scheduleNext();
  }

  void _scheduleNext() {
    if (_lineIndex >= _lines.length) return;
    _timer = Timer(AppAnimations.terminalLine, () {
      if (!mounted) return;
      setState(() => _visibleLines.add(_lines[_lineIndex++]));
      _scheduleNext();
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  Color _lineColor(String line) {
    if (line.startsWith(r'$')) return AppColors.accent;
    if (line.startsWith('[✓]')) return AppColors.success;
    if (line.startsWith('  ✓')) return AppColors.success;
    if (line.startsWith('  Building')) return AppColors.textSecondary;
    if (line.startsWith('{') || line.startsWith('}')) {
      return AppColors.textMuted;
    }
    return AppColors.textMuted;
  }

  @override
  Widget build(BuildContext context) {
    return GlassCard(
      padding: EdgeInsets.zero,
      borderRadius: 16,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Terminal header bar
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: AppSpacing.md,
              vertical: AppSpacing.sm + 2,
            ),
            decoration: const BoxDecoration(
              border: Border(bottom: BorderSide(color: AppColors.border)),
            ),
            child: Row(
              children: [
                _dot(const Color(0xFFFF5F57)),
                const SizedBox(width: 6),
                _dot(const Color(0xFFFFBD2E)),
                const SizedBox(width: 6),
                _dot(const Color(0xFF28C840)),
                const SizedBox(width: AppSpacing.md),
                Text(
                  'terminal',
                  style: AppTypography.monoSmall.copyWith(
                    color: AppColors.textMuted,
                  ),
                ),
              ],
            ),
          ),

          // Terminal content
          Padding(
            padding: const EdgeInsets.all(AppSpacing.md),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ..._visibleLines.map(
                  (line) => Padding(
                    padding: const EdgeInsets.only(bottom: 2),
                    child: Text(
                      line,
                      style: AppTypography.mono.copyWith(
                        color: _lineColor(line),
                        fontSize: 12,
                      ),
                    ),
                  ),
                ),
                if (_lineIndex < _lines.length || _visibleLines.isEmpty)
                  const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        r'$ ',
                        style: TextStyle(
                          fontFamily: 'JetBrainsMono',
                          fontSize: 12,
                          color: AppColors.accent,
                        ),
                      ),
                      BlinkingCursor(),
                    ],
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _dot(Color color) => Container(
        width: 12,
        height: 12,
        decoration: BoxDecoration(color: color, shape: BoxShape.circle),
      );
}
