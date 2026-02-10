// import 'package:firebase_core/firebase_core.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';

import 'app.dart';
import 'core/configuration/flavor.dart';
import 'core/di/app_locator.dart';
import 'core/utils/storage_util.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await SStorageUtil.initStorage();

  // setPathUrlStrategy();

  //Responsive initialization
  // ResponsiveSizingConfig.instance.setCustomBreakpoints(
  //   const ScreenBreakpoints(desktop: 900, tablet: 600, watch: 200),
  // );
  await initializeDependencies();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.light,
    ),
  );

  GoRouter.optionURLReflectsImperativeAPIs = true;

  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('en', 'US'), Locale('np', 'NP')],
      path: 'assets/translation',
      fallbackLocale: const Locale('en', 'US'),
      startLocale: const Locale('en', 'US'),
      child: const MyApp(flavor: Flavor.prod),
    ),
  );
}
