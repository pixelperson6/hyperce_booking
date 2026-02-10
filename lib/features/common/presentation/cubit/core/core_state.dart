import 'package:flutter/material.dart';

class CoreState {
  final ThemeMode themeMode;
  final Locale locale;
  final bool isConnected;

  CoreState({required this.themeMode, required this.locale, required this.isConnected});

  CoreState copyWith({ThemeMode? themeMode, Locale? locale, bool? isConnected}) {
    return CoreState(
      themeMode: themeMode ?? this.themeMode,
      locale: locale ?? this.locale,
      isConnected: isConnected ?? this.isConnected,
    );
  }
}
