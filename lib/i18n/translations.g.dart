/// Generated file. Do not edit.
///
/// Locales: 2
/// Strings: 54 (27 per locale)
///
/// Built on 2023-07-13 at 09:59 UTC

// coverage:ignore-file
// ignore_for_file: type=lint

import 'package:flutter/widgets.dart';
import 'package:slang/builder/model/node.dart';
import 'package:slang_flutter/slang_flutter.dart';
export 'package:slang_flutter/slang_flutter.dart';

const AppLocale _baseLocale = AppLocale.en;

/// Supported locales, see extension methods below.
///
/// Usage:
/// - LocaleSettings.setLocale(AppLocale.en) // set locale
/// - Locale locale = AppLocale.en.flutterLocale // get flutter locale from enum
/// - if (LocaleSettings.currentLocale == AppLocale.en) // locale check
enum AppLocale with BaseAppLocale<AppLocale, _TranslationsEn> {
  en(languageCode: 'en', build: _TranslationsEn.build),
  ja(languageCode: 'ja', build: _TranslationsJa.build);

  const AppLocale(
      {required this.languageCode,
      this.scriptCode,
      this.countryCode,
      required this.build}); // ignore: unused_element

  @override
  final String languageCode;
  @override
  final String? scriptCode;
  @override
  final String? countryCode;
  @override
  final TranslationBuilder<AppLocale, _TranslationsEn> build;

  /// Gets current instance managed by [LocaleSettings].
  _TranslationsEn get translations =>
      LocaleSettings.instance.translationMap[this]!;
}

/// Method A: Simple
///
/// No rebuild after locale change.
/// Translation happens during initialization of the widget (call of t).
/// Configurable via 'translate_var'.
///
/// Usage:
/// String a = t.someKey.anotherKey;
/// String b = t['someKey.anotherKey']; // Only for edge cases!
_TranslationsEn get t => LocaleSettings.instance.currentTranslations;

/// Method B: Advanced
///
/// All widgets using this method will trigger a rebuild when locale changes.
/// Use this if you have e.g. a settings page where the user can select the locale during runtime.
///
/// Step 1:
/// wrap your App with
/// TranslationProvider(
/// 	child: MyApp()
/// );
///
/// Step 2:
/// final t = Translations.of(context); // Get t variable.
/// String a = t.someKey.anotherKey; // Use t variable.
/// String b = t['someKey.anotherKey']; // Only for edge cases!
class Translations {
  Translations._(); // no constructor

  static _TranslationsEn of(BuildContext context) =>
      InheritedLocaleData.of<AppLocale, _TranslationsEn>(context).translations;
}

/// The provider for method B
class TranslationProvider
    extends BaseTranslationProvider<AppLocale, _TranslationsEn> {
  TranslationProvider({required super.child})
      : super(settings: LocaleSettings.instance);

  static InheritedLocaleData<AppLocale, _TranslationsEn> of(
          BuildContext context) =>
      InheritedLocaleData.of<AppLocale, _TranslationsEn>(context);
}

/// Method B shorthand via [BuildContext] extension method.
/// Configurable via 'translate_var'.
///
/// Usage (e.g. in a widget's build method):
/// context.t.someKey.anotherKey
extension BuildContextTranslationsExtension on BuildContext {
  _TranslationsEn get t => TranslationProvider.of(this).translations;
}

/// Manages all translation instances and the current locale
class LocaleSettings
    extends BaseFlutterLocaleSettings<AppLocale, _TranslationsEn> {
  LocaleSettings._() : super(utils: AppLocaleUtils.instance);

  static final instance = LocaleSettings._();

  // static aliases (checkout base methods for documentation)
  static AppLocale get currentLocale => instance.currentLocale;
  static Stream<AppLocale> getLocaleStream() => instance.getLocaleStream();
  static AppLocale setLocale(AppLocale locale,
          {bool? listenToDeviceLocale = false}) =>
      instance.setLocale(locale, listenToDeviceLocale: listenToDeviceLocale);
  static AppLocale setLocaleRaw(String rawLocale,
          {bool? listenToDeviceLocale = false}) =>
      instance.setLocaleRaw(rawLocale,
          listenToDeviceLocale: listenToDeviceLocale);
  static AppLocale useDeviceLocale() => instance.useDeviceLocale();
  @Deprecated('Use [AppLocaleUtils.supportedLocales]')
  static List<Locale> get supportedLocales => instance.supportedLocales;
  @Deprecated('Use [AppLocaleUtils.supportedLocalesRaw]')
  static List<String> get supportedLocalesRaw => instance.supportedLocalesRaw;
  static void setPluralResolver(
          {String? language,
          AppLocale? locale,
          PluralResolver? cardinalResolver,
          PluralResolver? ordinalResolver}) =>
      instance.setPluralResolver(
        language: language,
        locale: locale,
        cardinalResolver: cardinalResolver,
        ordinalResolver: ordinalResolver,
      );
}

/// Provides utility functions without any side effects.
class AppLocaleUtils extends BaseAppLocaleUtils<AppLocale, _TranslationsEn> {
  AppLocaleUtils._()
      : super(baseLocale: _baseLocale, locales: AppLocale.values);

  static final instance = AppLocaleUtils._();

  // static aliases (checkout base methods for documentation)
  static AppLocale parse(String rawLocale) => instance.parse(rawLocale);
  static AppLocale parseLocaleParts(
          {required String languageCode,
          String? scriptCode,
          String? countryCode}) =>
      instance.parseLocaleParts(
          languageCode: languageCode,
          scriptCode: scriptCode,
          countryCode: countryCode);
  static AppLocale findDeviceLocale() => instance.findDeviceLocale();
  static List<Locale> get supportedLocales => instance.supportedLocales;
  static List<String> get supportedLocalesRaw => instance.supportedLocalesRaw;
}

// translations

// Path: <root>
class _TranslationsEn implements BaseTranslations<AppLocale, _TranslationsEn> {
  /// You can call this constructor and build your own translation instance of this locale.
  /// Constructing via the enum [AppLocale.build] is preferred.
  _TranslationsEn.build(
      {Map<String, Node>? overrides,
      PluralResolver? cardinalResolver,
      PluralResolver? ordinalResolver})
      : assert(overrides == null,
            'Set "translation_overrides: true" in order to enable this feature.'),
        $meta = TranslationMetadata(
          locale: AppLocale.en,
          overrides: overrides ?? {},
          cardinalResolver: cardinalResolver,
          ordinalResolver: ordinalResolver,
        ) {
    $meta.setFlatMapFunction(_flatMapFunction);
  }

  /// Metadata for the translations of <en>.
  @override
  final TranslationMetadata<AppLocale, _TranslationsEn> $meta;

  /// Access flat map
  dynamic operator [](String key) => $meta.getTranslation(key);

  late final _TranslationsEn _root = this; // ignore: unused_field

  // Translations
  late final _TranslationsSettingsEn settings =
      _TranslationsSettingsEn._(_root);
  late final _TranslationsTimerEn timer = _TranslationsTimerEn._(_root);
}

// Path: settings
class _TranslationsSettingsEn {
  _TranslationsSettingsEn._(this._root);

  final _TranslationsEn _root; // ignore: unused_field

  // Translations
  String get abbBar => 'Settings';
  late final _TranslationsSettingsBasicsSectionEn basicsSection =
      _TranslationsSettingsBasicsSectionEn._(_root);
  late final _TranslationsSettingsContinuousSectionEn continuousSection =
      _TranslationsSettingsContinuousSectionEn._(_root);
  late final _TranslationsSettingsBellSectionEn bellSection =
      _TranslationsSettingsBellSectionEn._(_root);
  late final _TranslationsSettingsAnimationSectionEn animationSection =
      _TranslationsSettingsAnimationSectionEn._(_root);
  late final _TranslationsSettingsThemeSectionEn themeSection =
      _TranslationsSettingsThemeSectionEn._(_root);
  late final _TranslationsSettingsLicenseSectionEn licenseSection =
      _TranslationsSettingsLicenseSectionEn._(_root);
  String min({required Object min}) => '${min} min';
  String sec({required Object sec}) => '${sec} sec';
  String get resetButton => 'Reset';
}

// Path: timer
class _TranslationsTimerEn {
  _TranslationsTimerEn._(this._root);

  final _TranslationsEn _root; // ignore: unused_field

  // Translations
  String get intervalText => 'Setting up';
  String get timeLeft => 'Time left';
  String get congrats => 'Congratulations!';
  String get min => 'min';
  String get sec => 'sec';
}

// Path: settings.basicsSection
class _TranslationsSettingsBasicsSectionEn {
  _TranslationsSettingsBasicsSectionEn._(this._root);

  final _TranslationsEn _root; // ignore: unused_field

  // Translations
  String get title => 'Basics';
  String get longSessionMode => 'Long Session Mode (in minutes)';
  String get sessionTime => 'Session Time';
}

// Path: settings.continuousSection
class _TranslationsSettingsContinuousSectionEn {
  _TranslationsSettingsContinuousSectionEn._(this._root);

  final _TranslationsEn _root; // ignore: unused_field

  // Translations
  String get title => 'Continous Session';
  String get autoRestart => 'Auto restart';
  String get interval => 'Interval';
}

// Path: settings.bellSection
class _TranslationsSettingsBellSectionEn {
  _TranslationsSettingsBellSectionEn._(this._root);

  final _TranslationsEn _root; // ignore: unused_field

  // Translations
  String get title => 'Bell';
  String get bell1 => 'Bell 1';
  String get bell2 => 'Bell 2';
  String get bell3 => 'Bell 3';
  String timeElapsed({required Object time}) => 'In ${time} ';
  String get soundTest => 'Sound test';
}

// Path: settings.animationSection
class _TranslationsSettingsAnimationSectionEn {
  _TranslationsSettingsAnimationSectionEn._(this._root);

  final _TranslationsEn _root; // ignore: unused_field

  // Translations
  String get title => 'Animation & Sound';
  String get show => 'Show congrats animation';
  String get soundTest => 'Sound test';
}

// Path: settings.themeSection
class _TranslationsSettingsThemeSectionEn {
  _TranslationsSettingsThemeSectionEn._(this._root);

  final _TranslationsEn _root; // ignore: unused_field

  // Translations
  String get title => 'UI Theme';
  String get darkMode => 'Dark mode';
}

// Path: settings.licenseSection
class _TranslationsSettingsLicenseSectionEn {
  _TranslationsSettingsLicenseSectionEn._(this._root);

  final _TranslationsEn _root; // ignore: unused_field

  // Translations
  String get title => 'Licenses';
}

// Path: <root>
class _TranslationsJa implements _TranslationsEn {
  /// You can call this constructor and build your own translation instance of this locale.
  /// Constructing via the enum [AppLocale.build] is preferred.
  _TranslationsJa.build(
      {Map<String, Node>? overrides,
      PluralResolver? cardinalResolver,
      PluralResolver? ordinalResolver})
      : assert(overrides == null,
            'Set "translation_overrides: true" in order to enable this feature.'),
        $meta = TranslationMetadata(
          locale: AppLocale.ja,
          overrides: overrides ?? {},
          cardinalResolver: cardinalResolver,
          ordinalResolver: ordinalResolver,
        ) {
    $meta.setFlatMapFunction(_flatMapFunction);
  }

  /// Metadata for the translations of <ja>.
  @override
  final TranslationMetadata<AppLocale, _TranslationsEn> $meta;

  /// Access flat map
  @override
  dynamic operator [](String key) => $meta.getTranslation(key);

  @override
  late final _TranslationsJa _root = this; // ignore: unused_field

  // Translations
  @override
  late final _TranslationsTimerJa timer = _TranslationsTimerJa._(_root);
  @override
  late final _TranslationsSettingsJa settings =
      _TranslationsSettingsJa._(_root);
}

// Path: timer
class _TranslationsTimerJa implements _TranslationsTimerEn {
  _TranslationsTimerJa._(this._root);

  @override
  final _TranslationsJa _root; // ignore: unused_field

  // Translations
  @override
  String get intervalText => '準備中';
  @override
  String get timeLeft => '残り';
  @override
  String get congrats => 'お疲れさまでした！';
  @override
  String get min => '分';
  @override
  String get sec => '秒';
}

// Path: settings
class _TranslationsSettingsJa implements _TranslationsSettingsEn {
  _TranslationsSettingsJa._(this._root);

  @override
  final _TranslationsJa _root; // ignore: unused_field

  // Translations
  @override
  String get abbBar => '設定';
  @override
  late final _TranslationsSettingsBasicsSectionJa basicsSection =
      _TranslationsSettingsBasicsSectionJa._(_root);
  @override
  late final _TranslationsSettingsContinuousSectionJa continuousSection =
      _TranslationsSettingsContinuousSectionJa._(_root);
  @override
  late final _TranslationsSettingsBellSectionJa bellSection =
      _TranslationsSettingsBellSectionJa._(_root);
  @override
  late final _TranslationsSettingsAnimationSectionJa animationSection =
      _TranslationsSettingsAnimationSectionJa._(_root);
  @override
  late final _TranslationsSettingsThemeSectionJa themeSection =
      _TranslationsSettingsThemeSectionJa._(_root);
  @override
  late final _TranslationsSettingsLicenseSectionJa licenseSection =
      _TranslationsSettingsLicenseSectionJa._(_root);
  @override
  String min({required Object min}) => '${min} 分';
  @override
  String sec({required Object sec}) => '${sec} 秒';
  @override
  String get resetButton => 'リセット';
}

// Path: settings.basicsSection
class _TranslationsSettingsBasicsSectionJa
    implements _TranslationsSettingsBasicsSectionEn {
  _TranslationsSettingsBasicsSectionJa._(this._root);

  @override
  final _TranslationsJa _root; // ignore: unused_field

  // Translations
  @override
  String get title => '基本';
  @override
  String get longSessionMode => '長尺モード (分単位)';
  @override
  String get sessionTime => 'セッション時間';
}

// Path: settings.continuousSection
class _TranslationsSettingsContinuousSectionJa
    implements _TranslationsSettingsContinuousSectionEn {
  _TranslationsSettingsContinuousSectionJa._(this._root);

  @override
  final _TranslationsJa _root; // ignore: unused_field

  // Translations
  @override
  String get title => '連続セッション';
  @override
  String get autoRestart => '自動再スタート';
  @override
  String get interval => 'インターバル';
}

// Path: settings.bellSection
class _TranslationsSettingsBellSectionJa
    implements _TranslationsSettingsBellSectionEn {
  _TranslationsSettingsBellSectionJa._(this._root);

  @override
  final _TranslationsJa _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'ベル';
  @override
  String get bell1 => 'ベル 1';
  @override
  String get bell2 => 'ベル 2';
  @override
  String get bell3 => 'ベル 3';
  @override
  String timeElapsed({required Object time}) => '${time} 経過';
  @override
  String get soundTest => '音声テスト';
}

// Path: settings.animationSection
class _TranslationsSettingsAnimationSectionJa
    implements _TranslationsSettingsAnimationSectionEn {
  _TranslationsSettingsAnimationSectionJa._(this._root);

  @override
  final _TranslationsJa _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'アニメーションと音声';
  @override
  String get show => '終了時アニメーション';
  @override
  String get soundTest => '音声テスト';
}

// Path: settings.themeSection
class _TranslationsSettingsThemeSectionJa
    implements _TranslationsSettingsThemeSectionEn {
  _TranslationsSettingsThemeSectionJa._(this._root);

  @override
  final _TranslationsJa _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'UIテーマ';
  @override
  String get darkMode => 'ダークモード';
}

// Path: settings.licenseSection
class _TranslationsSettingsLicenseSectionJa
    implements _TranslationsSettingsLicenseSectionEn {
  _TranslationsSettingsLicenseSectionJa._(this._root);

  @override
  final _TranslationsJa _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'ライセンス';
}

/// Flat map(s) containing all translations.
/// Only for edge cases! For simple maps, use the map function of this library.

extension on _TranslationsEn {
  dynamic _flatMapFunction(String path) {
    switch (path) {
      case 'settings.abbBar':
        return 'Settings';
      case 'settings.basicsSection.title':
        return 'Basics';
      case 'settings.basicsSection.longSessionMode':
        return 'Long Session Mode (in minutes)';
      case 'settings.basicsSection.sessionTime':
        return 'Session Time';
      case 'settings.continuousSection.title':
        return 'Continous Session';
      case 'settings.continuousSection.autoRestart':
        return 'Auto restart';
      case 'settings.continuousSection.interval':
        return 'Interval';
      case 'settings.bellSection.title':
        return 'Bell';
      case 'settings.bellSection.bell1':
        return 'Bell 1';
      case 'settings.bellSection.bell2':
        return 'Bell 2';
      case 'settings.bellSection.bell3':
        return 'Bell 3';
      case 'settings.bellSection.timeElapsed':
        return ({required Object time}) => 'In ${time} ';
      case 'settings.bellSection.soundTest':
        return 'Sound test';
      case 'settings.animationSection.title':
        return 'Animation & Sound';
      case 'settings.animationSection.show':
        return 'Show congrats animation';
      case 'settings.animationSection.soundTest':
        return 'Sound test';
      case 'settings.themeSection.title':
        return 'UI Theme';
      case 'settings.themeSection.darkMode':
        return 'Dark mode';
      case 'settings.licenseSection.title':
        return 'Licenses';
      case 'settings.min':
        return ({required Object min}) => '${min} min';
      case 'settings.sec':
        return ({required Object sec}) => '${sec} sec';
      case 'settings.resetButton':
        return 'Reset';
      case 'timer.intervalText':
        return 'Setting up';
      case 'timer.timeLeft':
        return 'Time left';
      case 'timer.congrats':
        return 'Congratulations!';
      case 'timer.min':
        return 'min';
      case 'timer.sec':
        return 'sec';
      default:
        return null;
    }
  }
}

extension on _TranslationsJa {
  dynamic _flatMapFunction(String path) {
    switch (path) {
      case 'timer.intervalText':
        return '準備中';
      case 'timer.timeLeft':
        return '残り';
      case 'timer.congrats':
        return 'お疲れさまでした！';
      case 'timer.min':
        return '分';
      case 'timer.sec':
        return '秒';
      case 'settings.abbBar':
        return '設定';
      case 'settings.basicsSection.title':
        return '基本';
      case 'settings.basicsSection.longSessionMode':
        return '長尺モード (分単位)';
      case 'settings.basicsSection.sessionTime':
        return 'セッション時間';
      case 'settings.continuousSection.title':
        return '連続セッション';
      case 'settings.continuousSection.autoRestart':
        return '自動再スタート';
      case 'settings.continuousSection.interval':
        return 'インターバル';
      case 'settings.bellSection.title':
        return 'ベル';
      case 'settings.bellSection.bell1':
        return 'ベル 1';
      case 'settings.bellSection.bell2':
        return 'ベル 2';
      case 'settings.bellSection.bell3':
        return 'ベル 3';
      case 'settings.bellSection.timeElapsed':
        return ({required Object time}) => '${time} 経過';
      case 'settings.bellSection.soundTest':
        return '音声テスト';
      case 'settings.animationSection.title':
        return 'アニメーションと音声';
      case 'settings.animationSection.show':
        return '終了時アニメーション';
      case 'settings.animationSection.soundTest':
        return '音声テスト';
      case 'settings.themeSection.title':
        return 'UIテーマ';
      case 'settings.themeSection.darkMode':
        return 'ダークモード';
      case 'settings.licenseSection.title':
        return 'ライセンス';
      case 'settings.min':
        return ({required Object min}) => '${min} 分';
      case 'settings.sec':
        return ({required Object sec}) => '${sec} 秒';
      case 'settings.resetButton':
        return 'リセット';
      default:
        return null;
    }
  }
}
