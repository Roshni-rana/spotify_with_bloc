import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:spotify_app/core/routes/pages.dart';
import 'package:spotify_app/core/routes/routes.dart';
import 'package:spotify_app/core/theme/app_theme.dart';
import 'package:spotify_app/firebase_options.dart';
import 'package:spotify_app/presentation/choose_mode/bloc/theme_cubit.dart';
import 'package:spotify_app/presentation/splash/page/splash.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: kIsWeb
        ? HydratedStorage.webStorageDirectory
        : await getApplicationDocumentsDirectory(),
  );
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider(create: (_) => ThemeCubit())],
      child: BlocBuilder<ThemeCubit, ThemeMode>(
        builder: (context, mode) => MaterialApp.router(
          title: 'Spotify',
          themeMode: mode,
          darkTheme: AppTheme.darkTheme,
          debugShowCheckedModeBanner: false,
          theme: AppTheme.lightTheme,
          routerConfig: router,

          // home: SplashScreen(),
        ),
      ),
    );
  }
}