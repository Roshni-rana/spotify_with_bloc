import 'package:dartz/dartz.dart';
import 'package:spotify_app/data/models/auth/create_user_model.dart';
import 'package:spotify_app/data/sources/auth/auth_firebase_service.dart';
import 'package:spotify_app/domain/repository/auth/auth_repository.dart';
import 'package:spotify_app/service_locator.dart';

class AuthRepositoryImpl extends AuthRepository {
  @override
  Future<Either> Register(CreateUserModel createUserModel) async {
    return await s1<AuthFirebaseService>().Register(createUserModel);
  }

  @override
  Future<void> SignIn() {
    // TODO: implement SignIn
    throw UnimplementedError();
  }
}
