import 'package:flutter/material.dart';

class SSystemWidgetTheme {
  SSystemWidgetTheme._();

  static AppBarTheme sAppBarTheme(ColorScheme colors) {
    return AppBarTheme(
      elevation: 0,
      scrolledUnderElevation: 0,
      backgroundColor: colors.surface,
      foregroundColor: colors.onSurface,
    );
  }

  static TabBarTheme sTabBarTheme(ColorScheme colors) {
    return TabBarTheme(
      labelColor: colors.secondary,
      unselectedLabelColor: colors.onSurfaceVariant,
      indicator: BoxDecoration(
        border: Border(bottom: BorderSide(color: colors.secondary, width: 2)),
      ),
    );
  }

  static BottomAppBarThemeData sBottomAppBarTheme(ColorScheme colors) {
    return BottomAppBarThemeData(color: colors.surface, elevation: 0);
  }

  static BottomNavigationBarThemeData sBottomNavigationBarTheme(
    ColorScheme colors,
  ) {
    return BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      backgroundColor: colors.surfaceContainerHighest,
      selectedItemColor: colors.onSurface,
      unselectedItemColor: colors.onSurfaceVariant,
      elevation: 0,
      landscapeLayout: BottomNavigationBarLandscapeLayout.centered,
    );
  }

  static NavigationRailThemeData sNavigationRailTheme(ColorScheme colors) {
    return const NavigationRailThemeData();
  }

  static DrawerThemeData sDrawerTheme(ColorScheme colors) {
    return DrawerThemeData(backgroundColor: colors.surface);
  }

  static IconButtonThemeData sIconButtonTheme(ColorScheme colors) {
    return IconButtonThemeData(
      style: IconButton.styleFrom(
        visualDensity: VisualDensity.compact,
        shape: RoundedRectangleBorder(
          side: BorderSide(color: colors.primaryContainer),
          borderRadius: BorderRadius.circular(50),
        ),
      ),
    );
  }

  static ShapeBorder get shapeMedium =>
      RoundedRectangleBorder(borderRadius: BorderRadius.circular(8));

  static CardTheme sCardTheme() {
    return CardTheme(
      elevation: 0,
      shape: shapeMedium,
      clipBehavior: Clip.antiAlias,
    );
  }

  static ListTileThemeData sListTileTheme(ColorScheme colors) {
    return ListTileThemeData(
      shape: shapeMedium,
      selectedColor: colors.secondary,
      selectedTileColor: colors.secondaryContainer,
      iconColor: colors.onSurfaceVariant,
      textColor: colors.onSurface,
      tileColor: colors.surfaceContainer,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
    );
  }

  static ElevatedButtonThemeData sElevatedButtonTheme(ColorScheme colorScheme) {
    return ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(double.maxFinite, 40),
        backgroundColor: colorScheme.primary,
        foregroundColor: colorScheme.onPrimary,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        elevation: 0,
      ),
    );
  }

  static OutlinedButtonThemeData sOutlinedButtonTheme(ColorScheme colorScheme) {
    return OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        backgroundColor: colorScheme.primaryContainer,
        minimumSize: const Size(double.maxFinite, 40),
        side: BorderSide(color: colorScheme.outlineVariant),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
          // side: BorderSide(color: lightColorScheme.primary ),
        ),
        elevation: 0,
      ),
    );
  }

  static InputDecorationTheme sInputDecorationTheme(ColorScheme colorScheme) {
    return InputDecorationTheme(
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      border: OutlineInputBorder(
        borderSide: BorderSide(color: colorScheme.outlineVariant),
        borderRadius: BorderRadius.circular(8),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: colorScheme.outlineVariant),
        borderRadius: BorderRadius.circular(8),
      ),
      disabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: colorScheme.outlineVariant.withValues(alpha: 0.5),
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: colorScheme.primary),
        borderRadius: BorderRadius.circular(8),
      ),
    );
  }
}
