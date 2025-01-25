import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:spotify_app/data/models/auth/create_user_model.dart';

abstract class AuthFirebaseService {
  /// Sign_up
  Future<Either> Register(CreateUserModel createUserModel);

  /// sign_in
  Future<void> SignIn();
}

class AuthenticationImpl extends AuthFirebaseService {
  @override
  Future<Either> Register(CreateUserModel createUserModel) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: createUserModel.email.toString(),
          password: createUserModel.password.toString());
      return Right("Register was SuccessFully");
    } on FirebaseException catch (e) {
      String message = "";
      if (e.code == "weak-password") {
        message = "the password provider is too weak ";
      } else if (e.code == "email-already-in-use") {
        message = "An account already exist with that email";
      }
      return Left(message);
    }
  }

  @override
  Future<void> SignIn() async {
    try {} on FirebaseException catch (e) {}
  }
}
