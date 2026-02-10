import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/configuration/flavor.dart';
import 'core_state.dart';

class CoreCubit extends Cubit<CoreState> {
  final Connectivity _connectivity = Connectivity();
  late StreamSubscription<List<ConnectivityResult>> subscription;

  CoreCubit()
    : super(
        CoreState(
          themeMode: ThemeMode.light,
          locale: const Locale('en'),
          isConnected: true,
        ),
      ) {
    _monitorConnectivity();
  }

  void toggleTheme() {
    emit(
      state.copyWith(
        themeMode: state.themeMode == ThemeMode.light
            ? ThemeMode.dark
            : ThemeMode.light,
      ),
    );
  }

  void setFlavor(Flavor flavor) {
    this.flavor = flavor;
  }

  Flavor flavor = Flavor.dev;

  void _monitorConnectivity() {
    subscription = _connectivity.onConnectivityChanged.listen((
      List<ConnectivityResult> result,
    ) {
      if (result.contains(ConnectivityResult.none)) {
        emit(state.copyWith(isConnected: false));
      } else {
        emit(state.copyWith(isConnected: true));
      }
    });
  }

  @override
  Future<void> close() {
    subscription.cancel();
    return super.close();
  }

  void setThemeMode(String themeMode) {
    if (themeMode == 'light') {
      emit(state.copyWith(themeMode: ThemeMode.light));
    } else if (themeMode == 'dark') {
      emit(state.copyWith(themeMode: ThemeMode.dark));
    } else {
      emit(state.copyWith(themeMode: ThemeMode.system));
    }
  }

  void setLocale(Locale locale) {
    emit(state.copyWith(locale: locale));
  }
}
