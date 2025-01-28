import 'package:dartz/dartz.dart';
import 'package:spotify_app/data/models/auth/create_user_model.dart';

abstract class AuthRepository {
  Future<void> SignIn();
  Future<Either> Register(CreateUserModel createUserModel);
}
