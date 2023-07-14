import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'screens/settings_screen.dart';
import 'screens/timer_screen.dart';

enum AppRoute {
  timer(path: '/timer'),
  settings(path: '/settings');

  const AppRoute({required this.path});

  final String path;
}

final goRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: AppRoute.timer.path,
    debugLogDiagnostics: true,
    routes: [
      GoRoute(
          path: AppRoute.timer.path,
          name: AppRoute.timer.name,
          builder: (context, state) => const TimerScreen()),
      GoRoute(
        path: AppRoute.settings.path,
        name: AppRoute.settings.name,
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: const SettingsScreen(),
          transitionsBuilder: _slideTransitionBuilder,
        ),
      ),
    ],
  );
});

Widget _slideTransitionBuilder(
        BuildContext context,
        Animation<double> animation,
        Animation<double> secondaryAnimation,
        Widget child) =>
    SlideTransition(
      position: animation.drive(
          Tween(begin: const Offset(1.0, 0.0), end: Offset.zero)
              .chain(CurveTween(curve: Curves.ease))),
      child: child,
    );
