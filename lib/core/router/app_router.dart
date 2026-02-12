import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:logarte/logarte.dart';

import '../../features/signin/presentation/page/signin_page.dart';
import '../../features/signin/domain/entity/signin_arg.dart';
import '../../features/booking/presentation/page/booking_page.dart';
import '../../features/booking/domain/entity/booking_arg.dart';
import '../../features/splash/domain/entity/splash_arg.dart';
import '../../features/splash/presentation/page/splash_page.dart';
import '../utils/logarte_util.dart';
import '../utils/utils.dart';
import 'app_routes.dart';

final rootNavigatorKey = GlobalKey<NavigatorState>();
final shellNavigatorKey = GlobalKey<NavigatorState>();

class AppRouter {
  GoRouter get router => _router;

  static final GoRouter _router = GoRouter(
    initialLocation: AppRoutes.initialPath,
    navigatorKey: rootNavigatorKey,
    observers: [LogarteNavigatorObserver(logarte)],
    routes: [
      GoRoute(
        name: AppRoutes.splashRoute,
        path: AppRoutes.splashPath,
        redirect: (context, state) {
          SUtils.logPrint('Route: ${state.uri}');
          return null;
        },
        pageBuilder: (context, state) {
          final query = state.uri.queryParameters;
          final arg = SplashArg.fromMap(query);

          return pageTransitionBuilder(
            state: state,
            child: SplashPage(arg: arg),
          );
        },
      ),
    
    GoRoute(
      name: AppRoutes.bookingRoute,
      path: AppRoutes.bookingPath,
      redirect: (context, state) {
        SUtils.logPrint('Route: ${state.uri}');
        return null;
      },
      pageBuilder: (context, state) {
        final query = state.uri.queryParameters;
        final arg = BookingArg.fromMap(query);
        
        return pageTransitionBuilder(
          state: state,
          child: BookingPage(
            arg: arg,
          ),
        );
      },
    ),
      
    GoRoute(
      name: AppRoutes.signinRoute,
      path: AppRoutes.signinPath,
      redirect: (context, state) {
        SUtils.logPrint('Route: ${state.uri}');
        return null;
      },
      pageBuilder: (context, state) {
        final query = state.uri.queryParameters;
        final arg = SigninArg.fromMap(query);
        
        return pageTransitionBuilder(
          state: state,
          child: SigninPage(
            arg: arg,
          ),
        );
      },
    ),
      ],
  );

  static CustomTransitionPage<dynamic> pageTransitionBuilder({
    required Widget child,
    required GoRouterState state,
    bool isTransition = false,
  }) {
    return CustomTransitionPage(
      child: child,
      key: state.pageKey,
      name: state.name,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        // NOTE: You can customize your page transition animation here
        if (!isTransition) {
          return child;
        }
        final slideAnimation = Tween<Offset>(
          begin: const Offset(1.0, 0.0),
          end: Offset.zero,
        ).animate(animation);
        return SlideTransition(position: slideAnimation, child: child);
      },
    );
  }
}
