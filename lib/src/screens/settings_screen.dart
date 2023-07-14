import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:lttimer/i18n/translations.g.dart';
import 'package:lttimer/src/audio/audio_manager.dart';
import 'package:lttimer/src/screens/settings_controller.dart';
import 'package:lttimer/src/screens/timer_controller.dart';
import 'package:lttimer/src/ui/session_time_picker.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:settings_ui/settings_ui.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final settings = ref.watch(settingsControllerProvider);
    final controller = ref.watch(settingsControllerProvider.notifier);

    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(t.settings.abbBar),
          leading: IconButton(
              icon: Icon(Icons.arrow_back,
                  color: Theme.of(context).appBarTheme.foregroundColor),
              onPressed: () {
                ref.read(timerControllerProvider.notifier).reset();
                context.pop();
              }),
        ),
        body: SettingsList(
          platform: DevicePlatform.iOS,
          sections: [
            SettingsSection(
                title: Text(t.settings.basicsSection.title),
                tiles: [
                  SettingsTile.switchTile(
                    title: Text(t.settings.basicsSection.longSessionMode),
                    initialValue: controller.isLongSession,
                    onToggle: (bool value) {
                      ref
                          .read(settingsControllerProvider.notifier)
                          .onSetSessionMode(value);
                    },
                  ),
                  SettingsTile(
                    title: Text(t.settings.basicsSection.sessionTime),
                    trailing: Text(controller.selectedSessionTimeLabel),
                    onPressed: (context) {
                      _showDialog(
                        context,
                        SessionTimeCupertinoPicker(
                          initialIndex:
                              controller.indexOfSelectedSessionMinutes,
                          onSelectedItemChanged: controller.onSetSessionMinutes,
                          pickerItems: controller.selectableSessionTimes,
                        ),
                      );
                    },
                  ),
                ]),
            SettingsSection(
              title: Text(t.settings.continuousSection.title),
              tiles: [
                SettingsTile.switchTile(
                  title: Text(t.settings.continuousSection.autoRestart),
                  initialValue: settings.isContinuous,
                  onToggle: (bool value) {
                    ref
                        .read(settingsControllerProvider.notifier)
                        .onSetIsContinuous(value);
                  },
                ),
                if (settings.isContinuous)
                  SettingsTile(
                    title: Text(t.settings.continuousSection.interval),
                    trailing: Text(
                        t.settings.sec(sec: settings.intervalTime.inSeconds)),
                    onPressed: (context) {
                      _showDialog(
                        context,
                        SessionTimeCupertinoPicker(
                          initialIndex: controller.indexOfInterval,
                          onSelectedItemChanged: controller.onSetInterval,
                          pickerItems: controller.selectableIntervals,
                        ),
                      );
                    },
                  ),
              ],
            ),
            SettingsSection(
              title: Text(t.settings.bellSection.title),
              tiles: [
                SettingsTile(
                  title: Text(t.settings.bellSection.bell1),
                  trailing: Text(controller.bell1Text),
                  onPressed: (context) {
                    _showDialog(
                        context,
                        CupertinoTimerPicker(
                            initialTimerDuration: controller.bell1,
                            mode: CupertinoTimerPickerMode.ms,
                            onTimerDurationChanged: controller.onSetBell1),
                        onReset: controller.onResetBell1);
                  },
                ),
                SettingsTile(
                  title: Text(t.settings.bellSection.bell2),
                  trailing: Text(controller.bell2Text),
                  onPressed: (context) {
                    _showDialog(
                        context,
                        CupertinoTimerPicker(
                            initialTimerDuration: controller.bell2,
                            mode: CupertinoTimerPickerMode.ms,
                            onTimerDurationChanged: controller.onSetBell2),
                        onReset: controller.onResetBell2);
                  },
                ),
                SettingsTile(
                  title: Text(t.settings.bellSection.bell3),
                  trailing: Text(controller.bell3Text),
                  onPressed: (context) {
                    _showDialog(
                        context,
                        CupertinoTimerPicker(
                            initialTimerDuration: controller.bell3,
                            mode: CupertinoTimerPickerMode.ms,
                            onTimerDurationChanged: controller.onSetBell3),
                        onReset: controller.onResetBell3);
                  },
                ),
                SettingsTile(
                  title: Text(t.settings.bellSection.soundTest),
                  onPressed: (context) {
                    ref.read(audioManagerProvider).playBell();
                  },
                )
              ],
            ),
            SettingsSection(
                title: Text(t.settings.animationSection.title),
                tiles: [
                  SettingsTile.switchTile(
                    title: Text(t.settings.animationSection.show),
                    onToggle: controller.onSetShowCongratsAnimation,
                    initialValue: settings.showCongratsAnimation,
                  ),
                  SettingsTile(
                    title: Text(t.settings.bellSection.soundTest),
                    onPressed: (context) {
                      ref.read(audioManagerProvider).playClapping();
                    },
                  )
                ]),
            SettingsSection(title: Text(t.settings.themeSection.title), tiles: [
              SettingsTile.switchTile(
                title: Text(t.settings.themeSection.darkMode),
                onToggle: controller.onSetDarkMode,
                initialValue: settings.isDarkMode,
              ),
            ]),
            SettingsSection(
                title: Text(t.settings.licenseSection.title),
                tiles: [
                  SettingsTile(
                    title: Text(t.settings.licenseSection.title),
                    onPressed: (context) async {
                      final packageInfo = await PackageInfo.fromPlatform();
                      if (context.mounted) {
                        showLicensePage(
                          context: context,
                          applicationName: packageInfo.appName,
                          applicationVersion: packageInfo.version,
                        );
                      }
                    },
                  ),
                ]),
          ],
        ));
  }
}

void _showDialog(BuildContext context, Widget child, {VoidCallback? onReset}) {
  showCupertinoModalPopup<void>(
    context: context,
    builder: (BuildContext context) => Container(
      height: 260,
      padding: const EdgeInsets.only(top: 6.0),
      margin: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      color: CupertinoColors.systemBackground.resolveFrom(context),
      child: SafeArea(
        top: false,
        child: Column(
          children: [
            if (onReset != null)
              CupertinoButton(
                child: Text(t.settings.resetButton),
                onPressed: () {
                  onReset.call();
                  Navigator.pop(context);
                },
              ),
            Flexible(child: child),
          ],
        ),
      ),
    ),
  );
}
