import 'package:devfunmi/presentation/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final GoRouter appRouter = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        final section = state.uri.queryParameters['section'];
        return HomePage(initialSection: section);
      },
    ),
  ],
);
