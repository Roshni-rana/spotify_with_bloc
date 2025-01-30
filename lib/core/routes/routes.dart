import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:spotify_app/presentation/auth/pages/register.dart';
import 'package:spotify_app/presentation/auth/pages/sign_in.dart';
import 'package:spotify_app/presentation/auth/pages/signup_signin.dart';
import 'package:spotify_app/presentation/choose_mode/pages/choose_mode.dart';
import 'package:spotify_app/presentation/home/pages/home_screen.dart';
import 'package:spotify_app/presentation/intro/pages/intro_screen.dart';
import 'package:spotify_app/presentation/splash/page/splash.dart';

enum AppRoutes {
  splash,
  intro,
  chooseMode,
  signupsignin,
  SignInScreen,
  register,
  homeScreen
}

extension AppRoutesExtension on AppRoutes {
  String get route {
    switch (this) {
      case AppRoutes.splash:
        return '/';
      // case AppRoutes.createAccount:
      //   return "${AppRoutes.signUp.route}/${AppRoutes.createAccount.subRoute}";
      // case AppRoutes.twoAuthVerify:
      //   return "${AppRoutes.signUp.route}/${AppRoutes.twoAuthVerify.subRoute}";
      default:
        return '/$value';
    }
  }

  String get subRoute {
    switch (this) {
      default:
        return value;
    }
  }

  String get name {
    switch (this) {
      default:
        return value;
    }
  }

  String get value {
    return toString().split('.').last;
  }

  Widget get widget {
    switch (this) {
      case AppRoutes.splash:
        return const SplashScreen();
      case AppRoutes.intro:
        return const IntroScreen();
      case AppRoutes.chooseMode:
        return ChooseModePage();
      case AppRoutes.signupsignin:
        return SignUpSignIn();
      case AppRoutes.SignInScreen:
        return SignInScreen();
      case AppRoutes.register:
        return RegisterScreen();
      case AppRoutes.homeScreen:
        return HomeScreen();

      default:
        return const SizedBox();
    }
  }
}

extension GoRouteExtension on GoRoute {
  AppRoutes? get getAppRoute => AppRoutes.values.firstWhere(
        (element) => element.name == name,
      );
}
