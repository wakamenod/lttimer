import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// ignore:depend_on_referenced_packages
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:lttimer/src/audio/audio_manager.dart';
import 'package:lttimer/src/persistence/hive_data_store.dart';
import 'i18n/translations.g.dart';
import 'src/app_bootstrap.dart';

Future<void> main() async {
  LicenseRegistry.addLicense(() async* {
    final zenkakuGothicNew = await rootBundle.loadString('assets/fonts/zentaku_gothic_new/OFL.txt');
    yield LicenseEntryWithLineBreaks(['zenkaku_gothic_new'],  zenkakuGothicNew);
    final robotoMono = await rootBundle.loadString('assets/fonts/roboto_mono/LICENSE.txt');
    yield LicenseEntryWithLineBreaks(['roboto_mono'],  robotoMono);
  });

  WidgetsFlutterBinding.ensureInitialized();
  // turn off the # in the URLs on the web
  usePathUrlStrategy();
  // init hive
  final dataStore = HiveDataStore();
  await dataStore.init();
  // init audio
  final audioManager = AudioManager();
  await audioManager.init();
  // create an app bootstrap instance
  final appBootstrap = AppBootstrap();
  // create a container configured with providers
  final container =
      await appBootstrap.createProviderContainer(dataStore, audioManager);
  // use the container above to create the root widget
  final root = appBootstrap.createRootWidget(container: container);
  // Localization
  LocaleSettings.useDeviceLocale();
  // start the app
  runApp(root);
}
