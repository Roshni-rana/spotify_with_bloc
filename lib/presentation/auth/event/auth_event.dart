part of 'authentication_bloc.dart';

sealed class AuthEvent {
  const AuthEvent();
}

final class AuthSignIn extends AuthEvent {}

final class AuthRegister extends AuthEvent {}