import 'package:dartz/dartz.dart';
import 'package:spotify_app/data/models/auth/create_user_model.dart';

abstract class AuthRepository {
  Future<Either> signIn(CreateUserModel createUserModel);
  Future<Either> register(CreateUserModel createUserModel);
}
