import 'package:get_it/get_it.dart';
import 'package:spotify_app/data/repository/auth/auth_repository_impl.dart';
import 'package:spotify_app/data/sources/auth/auth_firebase_service.dart';
import 'package:spotify_app/domain/repository/auth/auth_repository.dart';
import 'package:spotify_app/domain/usecases/auth/register_usecase.dart';
import 'package:spotify_app/domain/usecases/auth/sign_in_usecase.dart';

final s1 = GetIt.instance;

Future<void> initializeDependacies() async {
  s1.registerSingleton<AuthFirebaseService>(AuthenticationImpl());
  s1.registerSingleton<AuthRepository>(AuthRepositoryImpl());
  s1.registerSingleton<RegisterUseCase>(RegisterUseCase());
  s1.registerSingleton<SignInUseCase>(SignInUseCase());
}
