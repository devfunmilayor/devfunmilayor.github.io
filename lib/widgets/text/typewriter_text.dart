import 'dart:async';
import 'package:flutter/material.dart';
import '../../core/constants/app_animations.dart';

enum _TypewriterState { typing, pausing, deleting }

class TypewriterText extends StatefulWidget {
  final List<String> phrases;
  final TextStyle style;
  final Duration charDuration;
  final Duration deleteDuration;
  final Duration pauseDuration;

  const TypewriterText({
    super.key,
    required this.phrases,
    required this.style,
    this.charDuration = AppAnimations.typewriterChar,
    this.deleteDuration = AppAnimations.typewriterDelete,
    this.pauseDuration = AppAnimations.typewriterPause,
  });

  @override
  State<TypewriterText> createState() => _TypewriterTextState();
}

class _TypewriterTextState extends State<TypewriterText> {
  String _current = '';
  int _phraseIndex = 0;
  _TypewriterState _state = _TypewriterState.typing;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _tick();
  }

  void _tick() {
    if (!mounted) return;
    final phrase = widget.phrases[_phraseIndex];

    switch (_state) {
      case _TypewriterState.typing:
        if (_current.length < phrase.length) {
          _timer = Timer(widget.charDuration, () {
            if (!mounted) return;
            setState(() => _current = phrase.substring(0, _current.length + 1));
            _tick();
          });
        } else {
          _state = _TypewriterState.pausing;
          _timer = Timer(widget.pauseDuration, () {
            if (!mounted) return;
            setState(() => _state = _TypewriterState.deleting);
            _tick();
          });
        }

      case _TypewriterState.pausing:
        // handled above
        break;

      case _TypewriterState.deleting:
        if (_current.isNotEmpty) {
          _timer = Timer(widget.deleteDuration, () {
            if (!mounted) return;
            setState(
                () => _current = _current.substring(0, _current.length - 1));
            _tick();
          });
        } else {
          setState(() {
            _phraseIndex = (_phraseIndex + 1) % widget.phrases.length;
            _state = _TypewriterState.typing;
          });
          _tick();
        }
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Text(_current, style: widget.style);
  }
}
