import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:spotify_app/core/routes/routes.dart';
import 'package:spotify_app/presentation/intro/pages/intro_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  @override
  void initState() {
    redirect();
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: AppColors.white,
      body: Center(
        child: Image.asset(
          'assets/images/logo.png',
          height: 50,
        ),
      ),
    );
  }

  Future<void> redirect() async {
    await Future.delayed(const Duration(seconds: 3));
    context.goNamed(AppRoutes.intro.name);

    // Navigator.pushReplacement(
    //     context,
    //     MaterialPageRoute(
    //       builder: (context) => const IntroScreen(),
    //     ));
  }
}
