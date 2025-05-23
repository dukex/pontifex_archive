/// Generated file. Do not edit.
///
/// Original: lib/i18n
/// To regenerate, run: `dart run slang`
///
/// Locales: 2
/// Strings: 15 (7 per locale)
///
/// Built on 2024-07-18 at 15:04 UTC

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
enum AppLocale with BaseAppLocale<AppLocale, Translations> {
	en(languageCode: 'en', build: Translations.build),
	pt(languageCode: 'pt', build: _I18nPt.build);

	const AppLocale({required this.languageCode, this.scriptCode, this.countryCode, required this.build}); // ignore: unused_element

	@override final String languageCode;
	@override final String? scriptCode;
	@override final String? countryCode;
	@override final TranslationBuilder<AppLocale, Translations> build;

	/// Gets current instance managed by [LocaleSettings].
	Translations get translations => LocaleSettings.instance.translationMap[this]!;
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
Translations get t => LocaleSettings.instance.currentTranslations;

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
class TranslationProvider extends BaseTranslationProvider<AppLocale, Translations> {
	TranslationProvider({required super.child}) : super(settings: LocaleSettings.instance);

	static InheritedLocaleData<AppLocale, Translations> of(BuildContext context) => InheritedLocaleData.of<AppLocale, Translations>(context);
}

/// Method B shorthand via [BuildContext] extension method.
/// Configurable via 'translate_var'.
///
/// Usage (e.g. in a widget's build method):
/// context.t.someKey.anotherKey
extension BuildContextTranslationsExtension on BuildContext {
	Translations get t => TranslationProvider.of(this).translations;
}

/// Manages all translation instances and the current locale
class LocaleSettings extends BaseFlutterLocaleSettings<AppLocale, Translations> {
	LocaleSettings._() : super(utils: AppLocaleUtils.instance);

	static final instance = LocaleSettings._();

	// static aliases (checkout base methods for documentation)
	static AppLocale get currentLocale => instance.currentLocale;
	static Stream<AppLocale> getLocaleStream() => instance.getLocaleStream();
	static AppLocale setLocale(AppLocale locale, {bool? listenToDeviceLocale = false}) => instance.setLocale(locale, listenToDeviceLocale: listenToDeviceLocale);
	static AppLocale setLocaleRaw(String rawLocale, {bool? listenToDeviceLocale = false}) => instance.setLocaleRaw(rawLocale, listenToDeviceLocale: listenToDeviceLocale);
	static AppLocale useDeviceLocale() => instance.useDeviceLocale();
	@Deprecated('Use [AppLocaleUtils.supportedLocales]') static List<Locale> get supportedLocales => instance.supportedLocales;
	@Deprecated('Use [AppLocaleUtils.supportedLocalesRaw]') static List<String> get supportedLocalesRaw => instance.supportedLocalesRaw;
	static void setPluralResolver({String? language, AppLocale? locale, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver}) => instance.setPluralResolver(
		language: language,
		locale: locale,
		cardinalResolver: cardinalResolver,
		ordinalResolver: ordinalResolver,
	);
}

/// Provides utility functions without any side effects.
class AppLocaleUtils extends BaseAppLocaleUtils<AppLocale, Translations> {
	AppLocaleUtils._() : super(baseLocale: _baseLocale, locales: AppLocale.values);

	static final instance = AppLocaleUtils._();

	// static aliases (checkout base methods for documentation)
	static AppLocale parse(String rawLocale) => instance.parse(rawLocale);
	static AppLocale parseLocaleParts({required String languageCode, String? scriptCode, String? countryCode}) => instance.parseLocaleParts(languageCode: languageCode, scriptCode: scriptCode, countryCode: countryCode);
	static AppLocale findDeviceLocale() => instance.findDeviceLocale();
	static List<Locale> get supportedLocales => instance.supportedLocales;
	static List<String> get supportedLocalesRaw => instance.supportedLocalesRaw;
}

// translations

// Path: <root>
class Translations implements BaseTranslations<AppLocale, Translations> {
	/// Returns the current translations of the given [context].
	///
	/// Usage:
	/// final t = Translations.of(context);
	static Translations of(BuildContext context) => InheritedLocaleData.of<AppLocale, Translations>(context).translations;

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	Translations.build({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = TranslationMetadata(
		    locale: AppLocale.en,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <en>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	dynamic operator[](String key) => $meta.getTranslation(key);

	late final Translations _root = this; // ignore: unused_field

	// Translations
	late final _I18nAppEn app = _I18nAppEn._(_root);
	late final _I18nAuthorEn author = _I18nAuthorEn._(_root);
	late final _I18nHomeEn home = _I18nHomeEn._(_root);
	late final _I18nReaderEn reader = _I18nReaderEn._(_root);
	late final _I18nSearchEn search = _I18nSearchEn._(_root);
}

// Path: app
class _I18nAppEn {
	_I18nAppEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'Pontifex Archive';
}

// Path: author
class _I18nAuthorEn {
	_I18nAuthorEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	late final _I18nAuthorHeaderEn header = _I18nAuthorHeaderEn._(_root);
	late final _I18nAuthorDocumentsEn documents = _I18nAuthorDocumentsEn._(_root);
}

// Path: home
class _I18nHomeEn {
	_I18nHomeEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	late final _I18nHomeHeaderEn header = _I18nHomeHeaderEn._(_root);
	late final _I18nHomePopesEn popes = _I18nHomePopesEn._(_root);
	late final _I18nHomeContinueReadingEn continueReading = _I18nHomeContinueReadingEn._(_root);
}

// Path: reader
class _I18nReaderEn {
	_I18nReaderEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get closeTooltip => 'Close reader';
	late final _I18nReaderNavigationDrawerEn navigation_drawer = _I18nReaderNavigationDrawerEn._(_root);
}

// Path: search
class _I18nSearchEn {
	_I18nSearchEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String found({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(n,
		one: 'Found in ${n} chapter',
		other: 'Found in ${n} chapters',
	);
	String title({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(n,
		zero: 'Not found any document',
		one: 'Found ${n} document',
		other: 'Found in ${n} documents',
	);
	String get defaultTitle => 'Search for documents';
}

// Path: author.header
class _I18nAuthorHeaderEn {
	_I18nAuthorHeaderEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'Author';
}

// Path: author.documents
class _I18nAuthorDocumentsEn {
	_I18nAuthorDocumentsEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	late final _I18nAuthorDocumentsTypeEn type = _I18nAuthorDocumentsTypeEn._(_root);
}

// Path: home.header
class _I18nHomeHeaderEn {
	_I18nHomeHeaderEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'My library';
}

// Path: home.popes
class _I18nHomePopesEn {
	_I18nHomePopesEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'Popes';
}

// Path: home.continueReading
class _I18nHomeContinueReadingEn {
	_I18nHomeContinueReadingEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'Continue Reading';
}

// Path: reader.navigation_drawer
class _I18nReaderNavigationDrawerEn {
	_I18nReaderNavigationDrawerEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	late final _I18nReaderNavigationDrawerChaptersEn chapters = _I18nReaderNavigationDrawerChaptersEn._(_root);
}

// Path: author.documents.type
class _I18nAuthorDocumentsTypeEn {
	_I18nAuthorDocumentsTypeEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get enc => 'Encyclicals';
}

// Path: reader.navigation_drawer.chapters
class _I18nReaderNavigationDrawerChaptersEn {
	_I18nReaderNavigationDrawerChaptersEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'Chapters';
}

// Path: <root>
class _I18nPt extends Translations {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	_I18nPt.build({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = TranslationMetadata(
		    locale: AppLocale.pt,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super.build(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver) {
		super.$meta.setFlatMapFunction($meta.getTranslation); // copy base translations to super.$meta
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <pt>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key) ?? super.$meta.getTranslation(key);

	@override late final _I18nPt _root = this; // ignore: unused_field

	// Translations
	@override late final _I18nHomePt home = _I18nHomePt._(_root);
}

// Path: home
class _I18nHomePt extends _I18nHomeEn {
	_I18nHomePt._(_I18nPt root) : this._root = root, super._(root);

	@override final _I18nPt _root; // ignore: unused_field

	// Translations
	@override late final _I18nHomeHeaderPt header = _I18nHomeHeaderPt._(_root);
}

// Path: home.header
class _I18nHomeHeaderPt extends _I18nHomeHeaderEn {
	_I18nHomeHeaderPt._(_I18nPt root) : this._root = root, super._(root);

	@override final _I18nPt _root; // ignore: unused_field

	// Translations
	@override String get title => 'Documentos da Igreja';
}

/// Flat map(s) containing all translations.
/// Only for edge cases! For simple maps, use the map function of this library.

extension on Translations {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'app.title': return 'Pontifex Archive';
			case 'author.header.title': return 'Author';
			case 'author.documents.type.enc': return 'Encyclicals';
			case 'home.header.title': return 'My library';
			case 'home.popes.title': return 'Popes';
			case 'home.continueReading.title': return 'Continue Reading';
			case 'reader.closeTooltip': return 'Close reader';
			case 'reader.navigation_drawer.chapters.title': return 'Chapters';
			case 'search.found': return ({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(n,
				one: 'Found in ${n} chapter',
				other: 'Found in ${n} chapters',
			);
			case 'search.title': return ({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(n,
				zero: 'Not found any document',
				one: 'Found ${n} document',
				other: 'Found in ${n} documents',
			);
			case 'search.defaultTitle': return 'Search for documents';
			default: return null;
		}
	}
}

extension on _I18nPt {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'home.header.title': return 'Documentos da Igreja';
			default: return null;
		}
	}
}
