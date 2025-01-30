import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:spotify_app/domain/usecases/auth/sign_in_usecase.dart';

import '../../../data/models/auth/create_user_model.dart';
import '../../../domain/usecases/auth/register_usecase.dart';
import '../../../service_locator.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  TextEditingController fullNameTextController = TextEditingController();
  TextEditingController emailTextController = TextEditingController();
  TextEditingController passWordTextController = TextEditingController();

  AuthBloc() : super(AuthInitial()) {
    on<Register>((event, emit) async {
      final result = await s1<RegisterUseCase>().call(
        params: CreateUserModel(
          fullName: fullNameTextController.text.trim(),
          password: passWordTextController.text.trim(),
          email: emailTextController.text.trim(),
        ),
      );
      result.fold(
        (failure) {
          print('Failed to register');
        },
        (success) {
          emit(AuthSuccess());

          print('successfully register ');
        },
      );
    });

    on<SignIn>((event, emit) async {
      final result = await s1<SignInUseCase>().call(
        params: CreateUserModel(
          email: emailTextController.text.trim(),
          password: passWordTextController.text.trim(),
        ),
      );
      result.fold(
        (failure) {
          emit(AuthFailure(
            errorMessage: "Sign-in failed",
          ));
        },
        (success) {
          emit(AuthSuccess());
        },
      );
    });
  }
}
