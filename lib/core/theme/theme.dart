import "package:flutter/material.dart";

import "widget_theme/system_widget_theme.dart";

class MaterialTheme {
  final TextTheme textTheme;

  const MaterialTheme(this.textTheme);

  static ColorScheme lightScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff904a4a),
      surfaceTint: Color(0xff904a4a),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xffffdad8),
      onPrimaryContainer: Color(0xff3b080c),
      secondary: Color(0xff8c4a60),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xffffd9e2),
      onSecondaryContainer: Color(0xff3a071d),
      tertiary: Color(0xff8e4956),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xffffd9dd),
      onTertiaryContainer: Color(0xff3b0715),
      error: Color(0xffba1a1a),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffffdad6),
      onErrorContainer: Color(0xff410002),
      surface: Color(0xfffff8f7),
      onSurface: Color(0xff231919),
      onSurfaceVariant: Color(0xff524343),
      outline: Color(0xff857372),
      outlineVariant: Color(0xffd7c1c0),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff382e2d),
      inversePrimary: Color(0xffffb3b1),
      primaryFixed: Color(0xffffdad8),
      onPrimaryFixed: Color(0xff3b080c),
      primaryFixedDim: Color(0xffffb3b1),
      onPrimaryFixedVariant: Color(0xff733334),
      secondaryFixed: Color(0xffffd9e2),
      onSecondaryFixed: Color(0xff3a071d),
      secondaryFixedDim: Color(0xffffb1c8),
      onSecondaryFixedVariant: Color(0xff703348),
      tertiaryFixed: Color(0xffffd9dd),
      onTertiaryFixed: Color(0xff3b0715),
      tertiaryFixedDim: Color(0xffffb2bd),
      onTertiaryFixedVariant: Color(0xff72333f),
      surfaceDim: Color(0xffe8d6d5),
      surfaceBright: Color(0xfffff8f7),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfffff0ef),
      surfaceContainer: Color(0xfffceae9),
      surfaceContainerHigh: Color(0xfff6e4e3),
      surfaceContainerHighest: Color(0xfff0dedd),
    );
  }

  ThemeData light() {
    return theme(lightScheme());
  }

  static ColorScheme lightMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff6e2f30),
      surfaceTint: Color(0xff904a4a),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xffaa5f5f),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff6b2f45),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xffa55f76),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff6d2f3b),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xffa85f6b),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff8c0009),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffda342e),
      onErrorContainer: Color(0xffffffff),
      surface: Color(0xfffff8f7),
      onSurface: Color(0xff231919),
      onSurfaceVariant: Color(0xff4e3f3f),
      outline: Color(0xff6c5b5a),
      outlineVariant: Color(0xff897676),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff382e2d),
      inversePrimary: Color(0xffffb3b1),
      primaryFixed: Color(0xffaa5f5f),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff8d4748),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xffa55f76),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff89475e),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xffa85f6b),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff8b4753),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffe8d6d5),
      surfaceBright: Color(0xfffff8f7),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfffff0ef),
      surfaceContainer: Color(0xfffceae9),
      surfaceContainerHigh: Color(0xfff6e4e3),
      surfaceContainerHighest: Color(0xfff0dedd),
    );
  }

  ThemeData lightMediumContrast() {
    return theme(lightMediumContrastScheme());
  }

  static ColorScheme lightHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff440f12),
      surfaceTint: Color(0xff904a4a),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff6e2f30),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff420e24),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff6b2f45),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff430e1b),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff6d2f3b),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff4e0002),
      onError: Color(0xffffffff),
      errorContainer: Color(0xff8c0009),
      onErrorContainer: Color(0xffffffff),
      surface: Color(0xfffff8f7),
      onSurface: Color(0xff000000),
      onSurfaceVariant: Color(0xff2e2120),
      outline: Color(0xff4e3f3f),
      outlineVariant: Color(0xff4e3f3f),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff382e2d),
      inversePrimary: Color(0xffffe6e5),
      primaryFixed: Color(0xff6e2f30),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff521a1c),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff6b2f45),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff50192e),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff6d2f3b),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff511926),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffe8d6d5),
      surfaceBright: Color(0xfffff8f7),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfffff0ef),
      surfaceContainer: Color(0xfffceae9),
      surfaceContainerHigh: Color(0xfff6e4e3),
      surfaceContainerHighest: Color(0xfff0dedd),
    );
  }

  ThemeData lightHighContrast() {
    return theme(lightHighContrastScheme());
  }

  static ColorScheme darkScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffffb3b1),
      surfaceTint: Color(0xffffb3b1),
      onPrimary: Color(0xff571d1f),
      primaryContainer: Color(0xff733334),
      onPrimaryContainer: Color(0xffffdad8),
      secondary: Color(0xffffb1c8),
      onSecondary: Color(0xff541d32),
      secondaryContainer: Color(0xff703348),
      onSecondaryContainer: Color(0xffffd9e2),
      tertiary: Color(0xffffb2bd),
      onTertiary: Color(0xff561d29),
      tertiaryContainer: Color(0xff72333f),
      onTertiaryContainer: Color(0xffffd9dd),
      error: Color(0xffffb4ab),
      onError: Color(0xff690005),
      errorContainer: Color(0xff93000a),
      onErrorContainer: Color(0xffffdad6),
      surface: Color(0xff1a1111),
      onSurface: Color(0xfff0dedd),
      onSurfaceVariant: Color(0xffd7c1c0),
      outline: Color(0xffa08c8b),
      outlineVariant: Color(0xff524343),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xfff0dedd),
      inversePrimary: Color(0xff904a4a),
      primaryFixed: Color(0xffffdad8),
      onPrimaryFixed: Color(0xff3b080c),
      primaryFixedDim: Color(0xffffb3b1),
      onPrimaryFixedVariant: Color(0xff733334),
      secondaryFixed: Color(0xffffd9e2),
      onSecondaryFixed: Color(0xff3a071d),
      secondaryFixedDim: Color(0xffffb1c8),
      onSecondaryFixedVariant: Color(0xff703348),
      tertiaryFixed: Color(0xffffd9dd),
      onTertiaryFixed: Color(0xff3b0715),
      tertiaryFixedDim: Color(0xffffb2bd),
      onTertiaryFixedVariant: Color(0xff72333f),
      surfaceDim: Color(0xff1a1111),
      surfaceBright: Color(0xff423736),
      surfaceContainerLowest: Color(0xff140c0c),
      surfaceContainerLow: Color(0xff231919),
      surfaceContainer: Color(0xff271d1d),
      surfaceContainerHigh: Color(0xff322827),
      surfaceContainerHighest: Color(0xff3d3232),
    );
  }

  ThemeData dark() {
    return theme(darkScheme());
  }

  static ColorScheme darkMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffffb9b7),
      surfaceTint: Color(0xffffb3b1),
      onPrimary: Color(0xff340407),
      primaryContainer: Color(0xffcb7a7a),
      onPrimaryContainer: Color(0xff000000),
      secondary: Color(0xffffb7cc),
      onSecondary: Color(0xff330218),
      secondaryContainer: Color(0xffc67b92),
      onSecondaryContainer: Color(0xff000000),
      tertiary: Color(0xffffb8c2),
      onTertiary: Color(0xff330310),
      tertiaryContainer: Color(0xffc97a87),
      onTertiaryContainer: Color(0xff000000),
      error: Color(0xffffbab1),
      onError: Color(0xff370001),
      errorContainer: Color(0xffff5449),
      onErrorContainer: Color(0xff000000),
      surface: Color(0xff1a1111),
      onSurface: Color(0xfffff9f9),
      onSurfaceVariant: Color(0xffdcc6c5),
      outline: Color(0xffb29e9d),
      outlineVariant: Color(0xff927f7e),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xfff0dedd),
      inversePrimary: Color(0xff743435),
      primaryFixed: Color(0xffffdad8),
      onPrimaryFixed: Color(0xff2c0104),
      primaryFixedDim: Color(0xffffb3b1),
      onPrimaryFixedVariant: Color(0xff5e2324),
      secondaryFixed: Color(0xffffd9e2),
      onSecondaryFixed: Color(0xff2b0012),
      secondaryFixedDim: Color(0xffffb1c8),
      onSecondaryFixedVariant: Color(0xff5b2238),
      tertiaryFixed: Color(0xffffd9dd),
      onTertiaryFixed: Color(0xff2c000b),
      tertiaryFixedDim: Color(0xffffb2bd),
      onTertiaryFixedVariant: Color(0xff5d222f),
      surfaceDim: Color(0xff1a1111),
      surfaceBright: Color(0xff423736),
      surfaceContainerLowest: Color(0xff140c0c),
      surfaceContainerLow: Color(0xff231919),
      surfaceContainer: Color(0xff271d1d),
      surfaceContainerHigh: Color(0xff322827),
      surfaceContainerHighest: Color(0xff3d3232),
    );
  }

  ThemeData darkMediumContrast() {
    return theme(darkMediumContrastScheme());
  }

  static ColorScheme darkHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xfffff9f9),
      surfaceTint: Color(0xffffb3b1),
      onPrimary: Color(0xff000000),
      primaryContainer: Color(0xffffb9b7),
      onPrimaryContainer: Color(0xff000000),
      secondary: Color(0xfffff9f9),
      onSecondary: Color(0xff000000),
      secondaryContainer: Color(0xffffb7cc),
      onSecondaryContainer: Color(0xff000000),
      tertiary: Color(0xfffff9f9),
      onTertiary: Color(0xff000000),
      tertiaryContainer: Color(0xffffb8c2),
      onTertiaryContainer: Color(0xff000000),
      error: Color(0xfffff9f9),
      onError: Color(0xff000000),
      errorContainer: Color(0xffffbab1),
      onErrorContainer: Color(0xff000000),
      surface: Color(0xff1a1111),
      onSurface: Color(0xffffffff),
      onSurfaceVariant: Color(0xfffff9f9),
      outline: Color(0xffdcc6c5),
      outlineVariant: Color(0xffdcc6c5),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xfff0dedd),
      inversePrimary: Color(0xff4e1719),
      primaryFixed: Color(0xffffe0de),
      onPrimaryFixed: Color(0xff000000),
      primaryFixedDim: Color(0xffffb9b7),
      onPrimaryFixedVariant: Color(0xff340407),
      secondaryFixed: Color(0xffffdfe6),
      onSecondaryFixed: Color(0xff000000),
      secondaryFixedDim: Color(0xffffb7cc),
      onSecondaryFixedVariant: Color(0xff330218),
      tertiaryFixed: Color(0xffffdfe2),
      onTertiaryFixed: Color(0xff000000),
      tertiaryFixedDim: Color(0xffffb8c2),
      onTertiaryFixedVariant: Color(0xff330310),
      surfaceDim: Color(0xff1a1111),
      surfaceBright: Color(0xff423736),
      surfaceContainerLowest: Color(0xff140c0c),
      surfaceContainerLow: Color(0xff231919),
      surfaceContainer: Color(0xff271d1d),
      surfaceContainerHigh: Color(0xff322827),
      surfaceContainerHighest: Color(0xff3d3232),
    );
  }

  ThemeData darkHighContrast() {
    return theme(darkHighContrastScheme());
  }

  ThemeData theme(ColorScheme colorScheme) => ThemeData(
    useMaterial3: true,
    brightness: colorScheme.brightness,
    colorScheme: colorScheme,
    canvasColor: colorScheme.surface,

    // Add page transitions
    //general
    primaryColor: colorScheme.primary,

    //typography & icon
    textTheme: textTheme.apply(
      bodyColor: colorScheme.onSurface,
      displayColor: colorScheme.onSurface,
    ),

    //components
    appBarTheme: SSystemWidgetTheme.sAppBarTheme(colorScheme),
    elevatedButtonTheme: SSystemWidgetTheme.sElevatedButtonTheme(colorScheme),
    outlinedButtonTheme: SSystemWidgetTheme.sOutlinedButtonTheme(colorScheme),
    inputDecorationTheme: SSystemWidgetTheme.sInputDecorationTheme(colorScheme),

    // cardTheme: SSystemWidgetTheme.sCardTheme(),
    // iconButtonTheme: SSystemWidgetTheme.sIconButtonTheme(colorScheme),
    listTileTheme: SSystemWidgetTheme.sListTileTheme(colorScheme),
    bottomAppBarTheme: SSystemWidgetTheme.sBottomAppBarTheme(colorScheme),
    bottomNavigationBarTheme: SSystemWidgetTheme.sBottomNavigationBarTheme(
      colorScheme,
    ),
    navigationRailTheme: SSystemWidgetTheme.sNavigationRailTheme(colorScheme),
    // tabBarTheme: SSystemWidgetTheme.sTabBarTheme(colorScheme),
    drawerTheme: SSystemWidgetTheme.sDrawerTheme(colorScheme),
    scaffoldBackgroundColor: colorScheme.surface,
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
