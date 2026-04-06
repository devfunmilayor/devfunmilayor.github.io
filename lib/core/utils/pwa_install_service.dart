import 'dart:async';
import 'dart:js_interop';

import 'package:flutter/foundation.dart';
import 'package:web/web.dart' as web;

@JS('isPWAInstallable')
external bool _isPWAInstallable();

@JS('triggerPWAInstall')
external JSPromise<JSString> _triggerPWAInstall();

class PwaInstallService extends ChangeNotifier {
  bool _canInstall = false;
  bool _isIOS = false;
  bool _isAlreadyInstalled = false;
  Timer? _pollTimer;

  PwaInstallService() {
    if (kIsWeb) _init();
  }

  bool get canInstall => _canInstall;
  bool get isIOS => _isIOS;

  /// True when an install button should be shown.
  bool get showInstallOption => (_canInstall || _isIOS) && !_isAlreadyInstalled;

  void _init() {
    final ua = web.window.navigator.userAgent.toLowerCase();
    _isIOS = ua.contains('iphone') || ua.contains('ipad') || ua.contains('ipod');
    _isAlreadyInstalled =
        web.window.matchMedia('(display-mode: standalone)').matches;

    if (_isAlreadyInstalled) return;

    _canInstall = _isPWAInstallable();
    if (!_canInstall) _startPolling();
  }

  void _startPolling() {
    _pollTimer = Timer.periodic(const Duration(seconds: 2), (_) {
      if (_isAlreadyInstalled) {
        _pollTimer?.cancel();
        return;
      }
      final available = _isPWAInstallable();
      if (available != _canInstall) {
        _canInstall = available;
        notifyListeners();
      }
      if (_canInstall) _pollTimer?.cancel();
    });
  }

  Future<bool> install() async {
    if (!_canInstall) return false;
    final outcome = (await _triggerPWAInstall().toDart).toDart;
    _canInstall = false;
    notifyListeners();
    return outcome == 'accepted';
  }

  @override
  void dispose() {
    _pollTimer?.cancel();
    super.dispose();
  }
}
