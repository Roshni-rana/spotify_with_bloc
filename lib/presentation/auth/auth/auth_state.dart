part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

/// Initial state before any action is taken
class AuthInitial extends AuthState {}

class AuthSuccess extends AuthState {}

/// State when authentication fails
class AuthFailure extends AuthState {
  final String errorMessage;
  const AuthFailure({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}
