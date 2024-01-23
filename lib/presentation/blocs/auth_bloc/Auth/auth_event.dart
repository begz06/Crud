part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();
}


class AuthLoginEvent extends AuthEvent{
  final String login;
  final String password;

  const AuthLoginEvent({required this.login, required this.password});
  @override
  // TODO: implement props
  List<Object?> get props => [login, password];

}

