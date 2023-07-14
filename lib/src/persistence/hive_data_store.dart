import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:lttimer/src/persistence/settings.dart';

import 'duration_adapter.dart';

class HiveDataStore {
  static const boxName = 'settings';
  static const keyName = 'settingsKey';

  Future<void> init() async {
    await Hive.initFlutter();
    Hive.registerAdapter<Settings>(SettingsAdapter());
    Hive.registerAdapter<TimerType>(TimerTypeAdapter());
    Hive.registerAdapter<Duration>(DurationAdapter());
    await Hive.openBox<Settings>(boxName);
  }

  setSettings(Settings settings) {
    final box = Hive.box<Settings>(boxName);
    box.put(keyName, settings);
  }

  Settings settings() {
    final box = Hive.box<Settings>(boxName);
    final settings = box.get(keyName);
    return settings ?? Settings.defaults();
  }
}

final dataStoreProvider = Provider<HiveDataStore>((ref) {
  throw UnimplementedError();
});
