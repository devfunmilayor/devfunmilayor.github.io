import 'package:flutter/material.dart';
import 'app.dart';
import 'core/di/injection.dart';
import 'core/utils/pwa_install_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
  getIt.registerLazySingleton<PwaInstallService>(() => PwaInstallService());
  runApp(const DevFunmiApp());
}
