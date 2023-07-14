import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lttimer/i18n/translations.g.dart';
import 'package:lttimer/src/screens/settings_controller.dart';

import 'app_router.dart';

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final goRouter = ref.watch(goRouterProvider);
    Translations.of(context);

    final isDarkMode = ref
        .watch(settingsControllerProvider.select((value) => value.isDarkMode));

    return MaterialApp.router(
      scrollBehavior: _MyCustomScrollBehavior(),
      locale: LocaleSettings.currentLocale.flutterLocale,
      routerConfig: goRouter,
      restorationScopeId: 'app',
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      themeMode: isDarkMode ? ThemeMode.dark : ThemeMode.light,
      supportedLocales: AppLocaleUtils.supportedLocales,
      // theme: ThemeData.dark().copyWith(scaffoldBackgroundColor: Colors.black),
      theme: _customLightThemeData,
      darkTheme: _customDarkThemeData,
    );
  }
}

class _MyCustomScrollBehavior extends MaterialScrollBehavior {
  // Override behavior methods and getters like dragDevices
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
      };
}

final _customDarkThemeData = ThemeData.from(
    colorScheme: const ColorScheme.dark().copyWith(
  // Start Button
  secondary: Colors.green[900],
  // Stop Button
  error: Colors.red[900],
  // Cancel Button
  surface: Colors.grey[900],
  // 時計の長い針部分
  tertiary: Colors.white,
)).copyWith();

final _customLightThemeData = ThemeData.from(
    colorScheme: const ColorScheme.light().copyWith(
  // Start Button
  secondary: const Color.fromRGBO(181, 230, 167, 1),
  // Stop Button
  error: const Color.fromRGBO(255, 101, 107, 1),
  // Cancel Button
  surface: Colors.grey[300],
  // 時計の長い針部分
  tertiary: const Color.fromARGB(255, 27, 27, 27),
  background: const Color.fromRGBO(242, 242, 247, 1),
)).copyWith(
    appBarTheme: const AppBarTheme(
        centerTitle: true,
        elevation: 0,
        color: Color.fromRGBO(242, 242, 247, 1),
        foregroundColor: Color.fromARGB(255, 27, 27, 27)));
