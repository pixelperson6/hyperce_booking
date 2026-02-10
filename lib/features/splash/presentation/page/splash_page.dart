// splash_page.dart - speedzcode advance AI for lightning fast development

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/resource/app_assets.dart';
import '../../../../core/router/app_routes.dart';
import '../cubit/splash_cubit.dart';
import '../../domain/entity/splash_arg.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key, required this.arg});
  final SplashArg arg;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider(create: (_) => SplashCubit()..appStarted())],
      child: SplashView(arg: arg),
    );
  }
}

class SplashView extends StatelessWidget {
  const SplashView({super.key, required this.arg});
  final SplashArg arg;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final splashCubit = context.read<SplashCubit>();
    return MultiBlocListener(
      listeners: [
        BlocListener<SplashCubit, SplashState>(
          listener: (context, state) {
            if (state is UnAuthenticated) {
              // Navigate to unauthenticated route
            }
            if (state is Authenticated) {
              // Navigate to authenticated route
            }
          },
        ),
      ],
      child: Scaffold(
        backgroundColor: theme.colorScheme.surface,
        body: Center(
          child: ClipOval(
            child: Image.asset(
              SAppAssets.logoProdLogo,
              width: 100,
              height: 100,
            ),
          ),
        ),
      ),
    );
  }
}
