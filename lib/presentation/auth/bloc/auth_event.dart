import 'package:equatable/equatable.dart';

abstract class AuthEvent {
  const AuthEvent();
}
class AuthSignUp  extends AuthEvent {}
 class AuthRegister extends AuthEvent {}