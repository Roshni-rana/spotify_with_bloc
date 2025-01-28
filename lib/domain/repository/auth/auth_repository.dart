import 'package:dartz/dartz.dart';
import 'package:spotify_app/data/models/auth/create_user_model.dart';

abstract class AuthRepository {
  Future<Either> SignIn(CreateUserModel createUserModel);
  Future<Either> Register(CreateUserModel createUserModel);
}
