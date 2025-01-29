import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:spotify_app/common/common_methods/common_method.dart';
import 'package:spotify_app/core/constant/keys_constants.dart';
import 'package:spotify_app/data/models/auth/create_user_model.dart';

abstract class AuthFirebaseService {
  static CollectionReference<Map<String, dynamic>> userAuth =
      FirebaseFirestore.instance.collection(KeysConstants.kUsers);

  /// Sign_up
  Future<Either> Register(CreateUserModel createUserModel);

  /// sign_in
  Future<Either> SignIn(CreateUserModel createUserModel);
}

class AuthenticationImpl extends AuthFirebaseService {
  @override
  Future<Either> Register(CreateUserModel createUserModel) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: createUserModel.email.toString(),
          password: createUserModel.password.toString());

      await FirebaseFirestore.instance
          .collection("users")
          .doc(createUserModel.email.toString())
          .set({
        "email": createUserModel.email.toString(),
        "fullName": createUserModel.email.toString(),
        "createAt": DateTime.now().toIso8601String()
      });
      return Right(
          snackBar(label: "Register was SuccessFully", successColor: true));
    } on FirebaseException catch (e) {
      return Left(snackBar(label: e.message.toString(), successColor: false));
    }
  }

  @override
  Future<Either> SignIn(CreateUserModel createUserModel) {
    // TODO: implement SignIn
    throw UnimplementedError();
  }

  // @override
  // Future<Either> SignIn(CreateUserModel createUserModel) async {
  //   try {
  //     /// get the users
  //     final userDoc =
  //         await AuthFirebaseService.userAuth.doc(createUserModel.email).get();
  //     if (userDoc.exists) {
  //       CreateUserModel userModel = CreateUserModel.fromJson(userDoc.data()!);
  //       if (userModel.password == createUserModel.password) {
  //         return Right("SignIn was SuccessFully");
  //       } else {
  //         snackBar(label: "User and Password is not match");
  //       }
  //     }
  //   } on FirebaseException catch (e) {
  //     return Left(e.message);
  //   }
  // }
}
