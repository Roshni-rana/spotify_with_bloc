part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();
}

class Register extends AuthEvent {
  final BuildContext context;
  Register({required this.context});
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}
