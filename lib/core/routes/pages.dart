import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:spotify_app/core/routes/routes.dart';

final navigatorKey = GlobalKey<NavigatorState>();
final GoRouter router = GoRouter(navigatorKey: navigatorKey, routes: [
  _parent(
    AppRoutes.splash,
    routes: [
      _child(AppRoutes.intro, routes: [
        _child(AppRoutes.chooseMode, routes: [
          _child(AppRoutes.signupsignin, routes: [
          _child(AppRoutes.signIn ),
          _child(AppRoutes.register ,routes: [

          ]),
          ]),
        ]),
      ]),
    ],
  ),

  // _parent(
  //   AppRoutes.signUp,
  //   routes: [
  //     _child(AppRoutes.createAccount),
  //     // _child(
  //     //   AppRoutes.twoFactorAuthenticationWeb,
  //     //   redirect: (p0, p1) {
  //     //     if (p1.extra == null) {
  //     //       return AppRoutes.createAccount.route;
  //     //     }
  //     //     return null;
  //     //   },
  //     // ),
  //     _child(
  //       AppRoutes.twoAuthVerify,
  //       redirect: (p0, p1) {
  //         if (p1.extra == null) {
  //           return AppRoutes.createAccount.route;
  //         }
  //         return null;
  //       },
  //     ),
  //   ],
  //   redirect: (p0, p1) {
  //     if (LocalStorage().getToken() != null) {
  //       return AppRoutes.home.route;
  //     }
  //     return null;
  //   },
  // ),
  // _parent(
  //   AppRoutes.nurseryRegistration,
  //   redirect: (p0, p1) {
  //     if (LocalStorage().getToken() == null) {
  //       return AppRoutes.login.route;
  //     }
  //     if (LocalStorage().getUserData()?.data?.daycare.length != 0) {
  //       return AppRoutes.home.route;
  //     }
  //     return null;
  //   },
  // ),
  // _parent(AppRoutes.chooseMode),

  // For Bottom Navigation
  // StatefulShellRoute.indexedStack(
  //   redirect: (p0, p1) {
  //     if (LocalStorage().getToken() == null) {
  //       return AppRoutes.login.route;
  //     }
  //     if (LocalStorage().getUserData()?.data?.daycare.length == 0) {
  //       return AppRoutes.nurseryRegistration.route;
  //     }
  //     return null;
  //   },
  //   branches: [
  //     StatefulShellBranch(routes: [_parent(AppRoutes.home)]),
  //     // StatefulShellBranch(routes: [
  //     //
  //     // ]),
  //     // StatefulShellBranch(routes: [ ]),
  //     // StatefulShellBranch(routes: [
  //     //
  //     // ]),
  //   ],
  //   builder: (context, state, navigationShell) {
  //     return Dashboard(navigationShell: navigationShell);
  //   },
  // )
]);

GoRoute _parent<T>(
  AppRoutes route, {
  List<RouteBase> routes = const [],
  bool showTransition = true,
  FutureOr<String?> Function(BuildContext, GoRouterState)? redirect,
  Page<dynamic> Function(BuildContext, GoRouterState)? pageBuilder,
  GlobalKey<NavigatorState>? parentNavigatorKey,
  List<String>? pathParams, // Nullable pathParams
}) {
  final pathWithParams = route.route;

  return GoRoute(
    path: pathWithParams,
    name: route.name,
    parentNavigatorKey: parentNavigatorKey,
    routes: routes,
    redirect: redirect,
    pageBuilder: showTransition
        ? pageBuilder
        : (context, state) {
            return NoTransitionPage(child: route.widget);
          },
    builder: showTransition
        ? (context, state) {
            return route.widget;
          }
        : null,
  );
}

GoRoute _child<T>(
  AppRoutes route, {
  List<RouteBase> routes = const [],
  bool showTransition = true,
  FutureOr<String?> Function(BuildContext, GoRouterState)? redirect,
  GlobalKey<NavigatorState>? parentNavigatorKey,
  List<String>? pathParams, // Nullable pathParams
}) {
  final pathWithParams = pathParams != null && pathParams.isNotEmpty
      ? '${route.subRoute}/${pathParams.map((param) => ':$param').join('/')}'
      : route.subRoute;

  return GoRoute(
    path: pathWithParams,
    name: route.name,
    parentNavigatorKey: parentNavigatorKey,
    routes: routes,
    redirect: redirect,
    pageBuilder: showTransition
        ? null
        : (context, state) {
            return NoTransitionPage(child: route.widget);
          },
    builder: showTransition
        ? (context, state) {
            return route.widget;
          }
        : null,
  );
}
