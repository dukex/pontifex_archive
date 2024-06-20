import "package:flutter/material.dart";

class MaterialTheme {
  final TextTheme textTheme;

  const MaterialTheme(this.textTheme);

  static ColorScheme lightScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff00547f),
      surfaceTint: Color(0xff006495),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff0e7ab4),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xffa10010),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xffe31320),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff615f4b),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xfffffbf0),
      onTertiaryContainer: Color(0xff585743),
      error: Color(0xff9d0014),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffd9252c),
      onErrorContainer: Color(0xffffffff),
      surface: Color(0xfffcf8f8),
      onSurface: Color(0xff1c1b1b),
      onSurfaceVariant: Color(0xff404850),
      outline: Color(0xff707881),
      outlineVariant: Color(0xffbfc7d1),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff313030),
      inversePrimary: Color(0xff90cdff),
      primaryFixed: Color(0xffcbe6ff),
      onPrimaryFixed: Color(0xff001e31),
      primaryFixedDim: Color(0xff90cdff),
      onPrimaryFixedVariant: Color(0xff004b72),
      secondaryFixed: Color(0xffffdad6),
      onSecondaryFixed: Color(0xff410002),
      secondaryFixedDim: Color(0xffffb4ac),
      onSecondaryFixedVariant: Color(0xff93000d),
      tertiaryFixed: Color(0xffe7e3ca),
      onTertiaryFixed: Color(0xff1d1c0d),
      tertiaryFixedDim: Color(0xffcac7af),
      onTertiaryFixedVariant: Color(0xff494835),
      surfaceDim: Color(0xffddd9d9),
      surfaceBright: Color(0xfffcf8f8),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfff6f3f2),
      surfaceContainer: Color(0xfff1edec),
      surfaceContainerHigh: Color(0xffebe7e7),
      surfaceContainerHighest: Color(0xffe5e2e1),
    );
  }

  ThemeData light() {
    return theme(lightScheme());
  }

  static ColorScheme lightMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff00476c),
      surfaceTint: Color(0xff006495),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff0e7ab4),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff8c000c),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xffe31320),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff454431),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff777560),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff8b0010),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffd9252c),
      onErrorContainer: Color(0xffffffff),
      surface: Color(0xfffcf8f8),
      onSurface: Color(0xff1c1b1b),
      onSurfaceVariant: Color(0xff3c444c),
      outline: Color(0xff586068),
      outlineVariant: Color(0xff737c84),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff313030),
      inversePrimary: Color(0xff90cdff),
      primaryFixed: Color(0xff117bb5),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff006192),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xffe61722),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xffbb0014),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff777560),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff5e5d49),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffddd9d9),
      surfaceBright: Color(0xfffcf8f8),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfff6f3f2),
      surfaceContainer: Color(0xfff1edec),
      surfaceContainerHigh: Color(0xffebe7e7),
      surfaceContainerHighest: Color(0xffe5e2e1),
    );
  }

  ThemeData lightMediumContrast() {
    return theme(lightMediumContrastScheme());
  }

  static ColorScheme lightHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff00253b),
      surfaceTint: Color(0xff006495),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff00476c),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff4e0003),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff8c000c),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff242313),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff454431),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff4d0005),
      onError: Color(0xffffffff),
      errorContainer: Color(0xff8b0010),
      onErrorContainer: Color(0xffffffff),
      surface: Color(0xfffcf8f8),
      onSurface: Color(0xff000000),
      onSurfaceVariant: Color(0xff1d252c),
      outline: Color(0xff3c444c),
      outlineVariant: Color(0xff3c444c),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff313030),
      inversePrimary: Color(0xffdeeeff),
      primaryFixed: Color(0xff00476c),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff00304a),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff8c000c),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff620006),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff454431),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff2e2d1d),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffddd9d9),
      surfaceBright: Color(0xfffcf8f8),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfff6f3f2),
      surfaceContainer: Color(0xfff1edec),
      surfaceContainerHigh: Color(0xffebe7e7),
      surfaceContainerHighest: Color(0xffe5e2e1),
    );
  }

  ThemeData lightHighContrast() {
    return theme(lightHighContrastScheme());
  }

  static ColorScheme darkScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xff90cdff),
      surfaceTint: Color(0xff90cdff),
      onPrimary: Color(0xff003350),
      primaryContainer: Color(0xff0070a6),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xffffb4ac),
      onSecondary: Color(0xff690006),
      secondaryContainer: Color(0xffd60019),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xffffffff),
      onTertiary: Color(0xff323120),
      tertiaryContainer: Color(0xffd9d5bc),
      onTertiaryContainer: Color(0xff41402e),
      error: Color(0xffffb3ad),
      onError: Color(0xff680009),
      errorContainer: Color(0xffb60019),
      onErrorContainer: Color(0xffffffff),
      surface: Color(0xff141313),
      onSurface: Color(0xffe5e2e1),
      onSurfaceVariant: Color(0xffbfc7d1),
      outline: Color(0xff89929b),
      outlineVariant: Color(0xff404850),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffe5e2e1),
      inversePrimary: Color(0xff006495),
      primaryFixed: Color(0xffcbe6ff),
      onPrimaryFixed: Color(0xff001e31),
      primaryFixedDim: Color(0xff90cdff),
      onPrimaryFixedVariant: Color(0xff004b72),
      secondaryFixed: Color(0xffffdad6),
      onSecondaryFixed: Color(0xff410002),
      secondaryFixedDim: Color(0xffffb4ac),
      onSecondaryFixedVariant: Color(0xff93000d),
      tertiaryFixed: Color(0xffe7e3ca),
      onTertiaryFixed: Color(0xff1d1c0d),
      tertiaryFixedDim: Color(0xffcac7af),
      onTertiaryFixedVariant: Color(0xff494835),
      surfaceDim: Color(0xff141313),
      surfaceBright: Color(0xff3a3939),
      surfaceContainerLowest: Color(0xff0e0e0e),
      surfaceContainerLow: Color(0xff1c1b1b),
      surfaceContainer: Color(0xff201f1f),
      surfaceContainerHigh: Color(0xff2a2a2a),
      surfaceContainerHighest: Color(0xff353434),
    );
  }

  ThemeData dark() {
    return theme(darkScheme());
  }

  static ColorScheme darkMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xff9ad1ff),
      surfaceTint: Color(0xff90cdff),
      onPrimary: Color(0xff001829),
      primaryContainer: Color(0xff4098d3),
      onPrimaryContainer: Color(0xff000000),
      secondary: Color(0xffffbab2),
      onSecondary: Color(0xff370002),
      secondaryContainer: Color(0xffff544c),
      onSecondaryContainer: Color(0xff000000),
      tertiary: Color(0xffffffff),
      onTertiary: Color(0xff323120),
      tertiaryContainer: Color(0xffd9d5bc),
      onTertiaryContainer: Color(0xff212010),
      error: Color(0xffffb9b3),
      onError: Color(0xff370003),
      errorContainer: Color(0xffff5450),
      onErrorContainer: Color(0xff000000),
      surface: Color(0xff141313),
      onSurface: Color(0xfffefaf9),
      onSurfaceVariant: Color(0xffc4cbd5),
      outline: Color(0xff9ca4ad),
      outlineVariant: Color(0xff7c848d),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffe5e2e1),
      inversePrimary: Color(0xff004c74),
      primaryFixed: Color(0xffcbe6ff),
      onPrimaryFixed: Color(0xff001321),
      primaryFixedDim: Color(0xff90cdff),
      onPrimaryFixedVariant: Color(0xff003a59),
      secondaryFixed: Color(0xffffdad6),
      onSecondaryFixed: Color(0xff2d0001),
      secondaryFixedDim: Color(0xffffb4ac),
      onSecondaryFixedVariant: Color(0xff730008),
      tertiaryFixed: Color(0xffe7e3ca),
      onTertiaryFixed: Color(0xff121204),
      tertiaryFixedDim: Color(0xffcac7af),
      onTertiaryFixedVariant: Color(0xff383725),
      surfaceDim: Color(0xff141313),
      surfaceBright: Color(0xff3a3939),
      surfaceContainerLowest: Color(0xff0e0e0e),
      surfaceContainerLow: Color(0xff1c1b1b),
      surfaceContainer: Color(0xff201f1f),
      surfaceContainerHigh: Color(0xff2a2a2a),
      surfaceContainerHighest: Color(0xff353434),
    );
  }

  ThemeData darkMediumContrast() {
    return theme(darkMediumContrastScheme());
  }

  static ColorScheme darkHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xfff9fbff),
      surfaceTint: Color(0xff90cdff),
      onPrimary: Color(0xff000000),
      primaryContainer: Color(0xff9ad1ff),
      onPrimaryContainer: Color(0xff000000),
      secondary: Color(0xfffff9f9),
      onSecondary: Color(0xff000000),
      secondaryContainer: Color(0xffffbab2),
      onSecondaryContainer: Color(0xff000000),
      tertiary: Color(0xffffffff),
      onTertiary: Color(0xff000000),
      tertiaryContainer: Color(0xffd9d5bc),
      onTertiaryContainer: Color(0xff000000),
      error: Color(0xfffff9f9),
      onError: Color(0xff000000),
      errorContainer: Color(0xffffb9b3),
      onErrorContainer: Color(0xff000000),
      surface: Color(0xff141313),
      onSurface: Color(0xffffffff),
      onSurfaceVariant: Color(0xfff9fbff),
      outline: Color(0xffc4cbd5),
      outlineVariant: Color(0xffc4cbd5),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffe5e2e1),
      inversePrimary: Color(0xff002d46),
      primaryFixed: Color(0xffd4e9ff),
      onPrimaryFixed: Color(0xff000000),
      primaryFixedDim: Color(0xff9ad1ff),
      onPrimaryFixedVariant: Color(0xff001829),
      secondaryFixed: Color(0xffffe0dc),
      onSecondaryFixed: Color(0xff000000),
      secondaryFixedDim: Color(0xffffbab2),
      onSecondaryFixedVariant: Color(0xff370002),
      tertiaryFixed: Color(0xffebe8ce),
      onTertiaryFixed: Color(0xff000000),
      tertiaryFixedDim: Color(0xffcfcbb3),
      onTertiaryFixedVariant: Color(0xff171708),
      surfaceDim: Color(0xff141313),
      surfaceBright: Color(0xff3a3939),
      surfaceContainerLowest: Color(0xff0e0e0e),
      surfaceContainerLow: Color(0xff1c1b1b),
      surfaceContainer: Color(0xff201f1f),
      surfaceContainerHigh: Color(0xff2a2a2a),
      surfaceContainerHighest: Color(0xff353434),
    );
  }

  ThemeData darkHighContrast() {
    return theme(darkHighContrastScheme());
  }

  ThemeData theme(ColorScheme colorScheme) => ThemeData(
        useMaterial3: true,
        brightness: colorScheme.brightness,
        colorScheme: colorScheme,
        textTheme: textTheme.apply(
          bodyColor: colorScheme.onSurface,
          displayColor: colorScheme.onSurface,
        ),
        scaffoldBackgroundColor: colorScheme.surface,
        canvasColor: colorScheme.surface,
      );

  List<ExtendedColor> get extendedColors => [];
}

class ExtendedColor {
  final Color seed, value;
  final ColorFamily light;
  final ColorFamily lightHighContrast;
  final ColorFamily lightMediumContrast;
  final ColorFamily dark;
  final ColorFamily darkHighContrast;
  final ColorFamily darkMediumContrast;

  const ExtendedColor({
    required this.seed,
    required this.value,
    required this.light,
    required this.lightHighContrast,
    required this.lightMediumContrast,
    required this.dark,
    required this.darkHighContrast,
    required this.darkMediumContrast,
  });
}

class ColorFamily {
  const ColorFamily({
    required this.color,
    required this.onColor,
    required this.colorContainer,
    required this.onColorContainer,
  });

  final Color color;
  final Color onColor;
  final Color colorContainer;
  final Color onColorContainer;
}
