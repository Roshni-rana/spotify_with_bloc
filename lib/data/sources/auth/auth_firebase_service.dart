import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:spotify_app/common/common_methods/common_method.dart';
import 'package:spotify_app/core/constant/keys_constants.dart';
import 'package:spotify_app/data/models/auth/create_user_model.dart';

abstract class AuthFirebaseService {
  /// Sign_up
  Future<Either> register(CreateUserModel createUserModel);

  /// sign_in
  Future<Either> signIn(CreateUserModel createUserModel);
}

class AuthenticationImpl extends AuthFirebaseService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  static CollectionReference<Map<String, dynamic>> userAuth =
      FirebaseFirestore.instance.collection(KeysConstants.kUsers);

  @override
  Future<Either> register(CreateUserModel createUserModel) async {
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
  Future<Either<String, User>> signIn(CreateUserModel createUserModel) async {
    try {
      UserCredential userCredential =
          await _firebaseAuth.signInWithEmailAndPassword(
        email: createUserModel.email.toString(),
        password: createUserModel.password.toString(),
      );

      /// check the firebase collection
      DocumentSnapshot userDoc = await _firestore
          .collection("users")
          .doc(userCredential.user?.uid)
          .get();

      if (!userDoc.exists) {
        print("successfully");
        Right(userCredential.user!);
      }

      return Right(userCredential.user!);
    } on FirebaseAuthException catch (e) {
      return Left(snackBar(label: e.message.toString(), successColor: false));
    }
  }
}
