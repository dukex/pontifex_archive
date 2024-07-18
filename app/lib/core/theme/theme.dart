import "package:flutter/material.dart";

class MaterialTheme {
  final TextTheme textTheme;

  const MaterialTheme(this.textTheme);

  static ColorScheme lightScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff5a4c35),
      surfaceTint: Color(0xff6b5c44),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff807057),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff655d52),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xfff1e5d6),
      onSecondaryContainer: Color(0xff51493f),
      tertiary: Color(0xff4b503c),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff6f755e),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xffba1a1a),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffffdad6),
      onErrorContainer: Color(0xff410002),
      surface: Color(0xfffef8f4),
      onSurface: Color(0xff1d1b19),
      onSurfaceVariant: Color(0xff4c463d),
      outline: Color(0xff7e766c),
      outlineVariant: Color(0xffcfc5b9),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff32302e),
      inversePrimary: Color(0xffd8c4a7),
      primaryFixed: Color(0xfff5e0c1),
      onPrimaryFixed: Color(0xff241a07),
      primaryFixedDim: Color(0xffd8c4a7),
      onPrimaryFixedVariant: Color(0xff52452f),
      secondaryFixed: Color(0xffede1d2),
      onSecondaryFixed: Color(0xff201b12),
      secondaryFixedDim: Color(0xffd0c5b7),
      onSecondaryFixedVariant: Color(0xff4d463b),
      tertiaryFixed: Color(0xffe0e5ca),
      onTertiaryFixed: Color(0xff181d0c),
      tertiaryFixedDim: Color(0xffc3c9af),
      onTertiaryFixedVariant: Color(0xff434935),
      surfaceDim: Color(0xffded9d5),
      surfaceBright: Color(0xfffef8f4),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfff8f2ef),
      surfaceContainer: Color(0xfff3ede9),
      surfaceContainerHigh: Color(0xffede7e3),
      surfaceContainerHighest: Color(0xffe7e1de),
    );
  }

  ThemeData light() {
    return theme(lightScheme());
  }

  static ColorScheme darkScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffd8c4a7),
      surfaceTint: Color(0xffd8c4a7),
      onPrimary: Color(0xff3b2f1a),
      primaryContainer: Color(0xff76674e),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xffd0c5b7),
      onSecondary: Color(0xff362f26),
      secondaryContainer: Color(0xff443d32),
      onSecondaryContainer: Color(0xffdcd0c2),
      tertiary: Color(0xffc3c9af),
      onTertiary: Color(0xff2d3320),
      tertiaryContainer: Color(0xff656b55),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xffffb4ab),
      onError: Color(0xff690005),
      errorContainer: Color(0xff93000a),
      onErrorContainer: Color(0xffffdad6),
      surface: Color(0xff151311),
      onSurface: Color(0xffe7e1de),
      onSurfaceVariant: Color(0xffcfc5b9),
      outline: Color(0xff988f85),
      outlineVariant: Color(0xff4c463d),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffe7e1de),
      inversePrimary: Color(0xff6b5c44),
      primaryFixed: Color(0xfff5e0c1),
      onPrimaryFixed: Color(0xff241a07),
      primaryFixedDim: Color(0xffd8c4a7),
      onPrimaryFixedVariant: Color(0xff52452f),
      secondaryFixed: Color(0xffede1d2),
      onSecondaryFixed: Color(0xff201b12),
      secondaryFixedDim: Color(0xffd0c5b7),
      onSecondaryFixedVariant: Color(0xff4d463b),
      tertiaryFixed: Color(0xffe0e5ca),
      onTertiaryFixed: Color(0xff181d0c),
      tertiaryFixedDim: Color(0xffc3c9af),
      onTertiaryFixedVariant: Color(0xff434935),
      surfaceDim: Color(0xff151311),
      surfaceBright: Color(0xff3b3936),
      surfaceContainerLowest: Color(0xff0f0e0c),
      surfaceContainerLow: Color(0xff1d1b19),
      surfaceContainer: Color(0xff211f1d),
      surfaceContainerHigh: Color(0xff2c2a27),
      surfaceContainerHighest: Color(0xff373432),
    );
  }

  ThemeData dark() {
    return theme(darkScheme());
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
}
