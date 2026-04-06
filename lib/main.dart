import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app.dart';
import 'core/di/injection.dart';
import 'core/utils/pwa_install_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Use the bundled Urbanist-Variable.ttf instead of fetching from CDN.
  // Runtime fetching causes async font-load events that trigger layout
  // changes mid-hover, permanently breaking Flutter's mouse tracker
  // debug assertions (_debugDuringDeviceUpdate gets stuck true).
  GoogleFonts.config.allowRuntimeFetching = false;
  await configureDependencies();
  getIt.registerLazySingleton<PwaInstallService>(() => PwaInstallService());
  runApp(const DevFunmiApp());
}
