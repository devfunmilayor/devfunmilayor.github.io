import 'package:flutter/material.dart';

abstract class AppAnimations {
  // Entrances
  static const Duration entranceDuration = Duration(milliseconds: 600);
  static const Curve entranceCurve = Curves.easeOut;
  static const Duration staggerDelay = Duration(milliseconds: 80);

  // Interactions
  static const Duration hoverDuration = Duration(milliseconds: 200);
  static const Duration flipDuration = Duration(milliseconds: 400);
  static const Duration navBlurDuration = Duration(milliseconds: 300);

  // Hero terminal / typewriter
  static const Duration typewriterChar = Duration(milliseconds: 80);
  static const Duration typewriterDelete = Duration(milliseconds: 40);
  static const Duration typewriterPause = Duration(seconds: 2);
  static const Duration terminalLine = Duration(milliseconds: 400);

  // Cursor
  static const Duration cursorBlink = Duration(milliseconds: 530);

  // Background gradient
  static const Duration meshCycleDuration = Duration(seconds: 8);

  // Timeline dot pulse
  static const Duration dotPulseDuration = Duration(milliseconds: 1500);
}
