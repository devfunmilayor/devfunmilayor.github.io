import 'package:flutter/material.dart';
import 'core/router/app_router.dart';
import 'core/theme/app_theme.dart';

class DevFunmiApp extends StatelessWidget {
  const DevFunmiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'dev.funmi',
      theme: AppTheme.dark,
      routerConfig: appRouter,
      debugShowCheckedModeBanner: false,
      builder: (context, child) => DefaultTextStyle(
        style: DefaultTextStyle.of(context).style,
        textAlign: TextAlign.justify,
        child: child!,
      ),
    );
  }
}
