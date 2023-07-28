import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:lttimer/src/persistence/hive_data_store.dart';
import 'package:lttimer/src/persistence/settings.dart';
import 'package:lttimer/src/screens/settings_controller.dart';
import 'package:lttimer/src/screens/timer_controller.dart';
import 'package:lttimer/src/screens/timer_screen.dart';

Future<ProviderContainer> createProviderContainer(
    timerController, settings) async {
  return ProviderContainer(
    overrides: [
      dataStoreProvider.overrideWithValue(MockHiveDataStore(settings)),
      timerControllerProvider.overrideWith(() => timerController),
      settingsControllerProvider.overrideWith(() => SettingsController()),
    ],
  );
}

class MockHiveDataStore implements HiveDataStore {
  final Settings s;

  MockHiveDataStore(this.s);

  @override
  Future<void> init() {
    return Future.value();
  }

  @override
  setSettings(Settings settings) {}

  @override
  Settings settings() {
    return s;
  }
}

class TestWidget extends StatelessWidget {
  const TestWidget({required this.container, super.key});

  final ProviderContainer container;

  @override
  Widget build(BuildContext context) {
    return UncontrolledProviderScope(
      container: container,
      child: const MaterialApp(
        home: TimerScreen(),
      ),
    );
  }
}

void main() {
  testGoldens('Lightning talkセッションの初期表示', (WidgetTester tester) async {
    await loadAppFonts();
    const size6 = Size(375, 667);

    final settings = Settings(
        sessionMode: TimerType.lightning,
        sessionTime: const Duration(minutes: 2),
        longSessionTime: const Duration(minutes: 40),
        isContinuous: true,
        intervalTime: const Duration(minutes: 1),
        bell1: const Duration(seconds: 10),
        bell2: const Duration(seconds: 30),
        bell3: const Duration(seconds: 100),
        longModeBell1: Duration.zero,
        longModeBell2: Duration.zero,
        longModeBell3: Duration.zero,
        isDarkMode: true,
        showCongratsAnimation: true,
        congratsDanmakuComments: '');

    final controller = TimerController();
    final container = await createProviderContainer(controller, settings);
    await tester.pumpWidgetBuilder(
        TestWidget(
          container: container,
        ),
        surfaceSize: size6);
    await screenMatchesGolden(tester, 'golden_lightning_initial');
  });

  testGoldens('Lightning talkセッションの30秒後', (WidgetTester tester) async {
    await loadAppFonts();
    const size6 = Size(375, 667);

    final settings = Settings(
        sessionMode: TimerType.lightning,
        sessionTime: const Duration(minutes: 2),
        longSessionTime: const Duration(minutes: 40),
        isContinuous: true,
        intervalTime: const Duration(minutes: 1),
        bell1: const Duration(seconds: 10),
        bell2: const Duration(seconds: 30),
        bell3: const Duration(seconds: 150), // セッション時間を超えているので表示されない
        longModeBell1: Duration.zero,
        longModeBell2: Duration.zero,
        longModeBell3: Duration.zero,
        isDarkMode: true,
        showCongratsAnimation: true,
        congratsDanmakuComments: '');

    final controller = TimerController();
    final container = await createProviderContainer(controller, settings);
    await tester.pumpWidgetBuilder(
        TestWidget(
          container: container,
        ),
        surfaceSize: size6);
    controller.elapse(const Duration(seconds: 30));
    await screenMatchesGolden(tester, 'golden_lightning_in_30sec');
  });

  testGoldens('Long セッションの初期表示', (WidgetTester tester) async {
    await loadAppFonts();
    const size6 = Size(375, 667);

    final settings = Settings(
        sessionMode: TimerType.long,
        sessionTime: const Duration(minutes: 2),
        longSessionTime: const Duration(minutes: 40),
        isContinuous: true,
        intervalTime: const Duration(minutes: 1),
        bell1: Duration.zero,
        bell2: Duration.zero,
        bell3: Duration.zero,
        longModeBell1: const Duration(minutes: 10),
        longModeBell2: const Duration(minutes: 20),
        longModeBell3: const Duration(minutes: 30),
        isDarkMode: true,
        showCongratsAnimation: true,
        congratsDanmakuComments: '');

    final controller = TimerController();
    final container = await createProviderContainer(controller, settings);
    await tester.pumpWidgetBuilder(
        TestWidget(
          container: container,
        ),
        surfaceSize: size6);
    await screenMatchesGolden(tester, 'golden_long_initial');
  });

  testGoldens('Long セッションの10分5秒後', (WidgetTester tester) async {
    await loadAppFonts();
    const size6 = Size(375, 667);

    final settings = Settings(
        sessionMode: TimerType.long,
        sessionTime: const Duration(minutes: 2),
        longSessionTime: const Duration(minutes: 40),
        isContinuous: true,
        intervalTime: const Duration(minutes: 1),
        bell1: Duration.zero,
        bell2: Duration.zero,
        bell3: Duration.zero,
        longModeBell1: const Duration(minutes: 10),
        longModeBell2: const Duration(minutes: 20),
        longModeBell3: const Duration(minutes: 30),
        isDarkMode: true,
        showCongratsAnimation: true,
        congratsDanmakuComments: '');

    final controller = TimerController();
    final container = await createProviderContainer(controller, settings);
    await tester.pumpWidgetBuilder(
        TestWidget(
          container: container,
        ),
        surfaceSize: size6);
    controller.elapse(const Duration(minutes: 10, seconds: 5));
    await screenMatchesGolden(tester, 'golden_long_in_10min');
  });
}
