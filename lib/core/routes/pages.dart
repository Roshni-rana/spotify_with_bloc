import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:spotify_app/core/routes/routes.dart';

final navigatorKey = GlobalKey<NavigatorState>();
final GoRouter router = GoRouter(navigatorKey: navigatorKey, routes: [
  _parent(
    AppRoutes.splash,
  ),
  _parent(AppRoutes.intro, routes: [
    _child(AppRoutes.chooseMode, routes: [
      _child(AppRoutes.signupsignin, routes: [
        _child(AppRoutes.SignInScreen),
        _child(AppRoutes.register),
      ]),
    ]),
    _child(AppRoutes.homeScreen),
  ]),
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
