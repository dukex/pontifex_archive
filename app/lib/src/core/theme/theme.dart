import "package:flutter/material.dart";

class MaterialTheme {
  final TextTheme textTheme;

  const MaterialTheme(this.textTheme);

  static ColorScheme lightScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(4284107829),
      surfaceTint: Color(4285226052),
      onPrimary: Color(4294967295),
      primaryContainer: Color(4286607447),
      onPrimaryContainer: Color(4294967295),
      secondary: Color(4284833106),
      onSecondary: Color(4294967295),
      secondaryContainer: Color(4294043094),
      onSecondaryContainer: Color(4283517247),
      tertiary: Color(4283125820),
      onTertiary: Color(4294967295),
      tertiaryContainer: Color(4285494622),
      onTertiaryContainer: Color(4294967295),
      error: Color(4290386458),
      onError: Color(4294967295),
      errorContainer: Color(4294957782),
      onErrorContainer: Color(4282449922),
      surface: Color(4294899956),
      onSurface: Color(4280097561),
      onSurfaceVariant: Color(4283188797),
      outline: Color(4286477932),
      outlineVariant: Color(4291806649),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4281479214),
      inversePrimary: Color(4292396199),
      primaryFixed: Color(4294303937),
      onPrimaryFixed: Color(4280556039),
      primaryFixedDim: Color(4292396199),
      onPrimaryFixedVariant: Color(4283581743),
      secondaryFixed: Color(4293779922),
      onSecondaryFixed: Color(4280294162),
      secondaryFixedDim: Color(4291872183),
      onSecondaryFixedVariant: Color(4283254331),
      tertiaryFixed: Color(4292928970),
      onTertiaryFixed: Color(4279770380),
      tertiaryFixedDim: Color(4291021231),
      onTertiaryFixedVariant: Color(4282599733),
      surfaceDim: Color(4292794837),
      surfaceBright: Color(4294899956),
      surfaceContainerLowest: Color(4294967295),
      surfaceContainerLow: Color(4294505199),
      surfaceContainer: Color(4294176233),
      surfaceContainerHigh: Color(4293781475),
      surfaceContainerHighest: Color(4293386718),
    );
  }

  ThemeData light() {
    return theme(lightScheme());
  }

  static ColorScheme darkScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(4292396199),
      surfaceTint: Color(4292396199),
      onPrimary: Color(4282068762),
      primaryContainer: Color(4285949774),
      onPrimaryContainer: Color(4294967295),
      secondary: Color(4291872183),
      onSecondary: Color(4281741094),
      secondaryContainer: Color(4282662194),
      onSecondaryContainer: Color(4292661442),
      tertiary: Color(4291021231),
      onTertiary: Color(4281152288),
      tertiaryContainer: Color(4284836693),
      onTertiaryContainer: Color(4294967295),
      error: Color(4294948011),
      onError: Color(4285071365),
      errorContainer: Color(4287823882),
      onErrorContainer: Color(4294957782),
      surface: Color(4279571217),
      onSurface: Color(4293386718),
      onSurfaceVariant: Color(4291806649),
      outline: Color(4288188293),
      outlineVariant: Color(4283188797),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4293386718),
      inversePrimary: Color(4285226052),
      primaryFixed: Color(4294303937),
      onPrimaryFixed: Color(4280556039),
      primaryFixedDim: Color(4292396199),
      onPrimaryFixedVariant: Color(4283581743),
      secondaryFixed: Color(4293779922),
      onSecondaryFixed: Color(4280294162),
      secondaryFixedDim: Color(4291872183),
      onSecondaryFixedVariant: Color(4283254331),
      tertiaryFixed: Color(4292928970),
      onTertiaryFixed: Color(4279770380),
      tertiaryFixedDim: Color(4291021231),
      onTertiaryFixedVariant: Color(4282599733),
      surfaceDim: Color(4279571217),
      surfaceBright: Color(4282071350),
      surfaceContainerLowest: Color(4279176716),
      surfaceContainerLow: Color(4280097561),
      surfaceContainer: Color(4280360733),
      surfaceContainerHigh: Color(4281084455),
      surfaceContainerHighest: Color(4281807922),
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
