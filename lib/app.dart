import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'core/configuration/api.dart';
import 'core/configuration/flavor.dart';
import 'core/di/app_locator.dart';
import 'core/resource/app_strings.dart';
import 'core/router/app_router.dart';
import 'core/theme/theme.dart';
import 'core/theme/util.dart';
import 'features/common/presentation/cubit/core/core_cubit.dart';
import 'features/common/presentation/cubit/core/core_state.dart';
import 'features/common/presentation/cubit/logout/logout_cubit.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.flavor});

  final Flavor flavor;

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = createTextTheme(context, "Poppins", "Montserrat");

    MaterialTheme theme = MaterialTheme(textTheme);
    return MultiBlocProvider(
      providers: [
        // BlocProvider(
        //   create: (context) => SplashCubit()..appStarted(),
        // ),
        BlocProvider(create: (context) => LogoutCubit(sl<SApi>())),
        BlocProvider(create: (context) => sl<CoreCubit>()..setFlavor(flavor)),
      ],
      child: ResponsiveApp(
        builder: (context) {
          return BlocListener<LogoutCubit, LogoutState>(
            listener: (context, state) {
              if (state is LogoutSuccess) {
                // Go to login page
                // USE YOUR LOGIC TO NAVIGATE
                // Show snackbar
                // reset logout state
                context.read<LogoutCubit>().resetState();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(state.isSessionExpired
                        ? 'Session Expired, please login again '
                        : 'Logged out successfully'),
                  ),
                );
              }
            },
            child: BlocBuilder<CoreCubit, CoreState>(
              builder: (context, state) {
                return MaterialApp.router(
                  debugShowCheckedModeBanner: false,
                  title: SAppStrings.application,
                  theme: theme.light(),
                  darkTheme: theme.dark(),
                  themeMode: state.themeMode,
                  routerConfig: AppRouter().router,
                  localizationsDelegates: context.localizationDelegates,
                  supportedLocales: context.supportedLocales,
                  locale: context.locale,
                );
              },
            ),
          );
        },
      ),
    );
  }
}
