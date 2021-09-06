part of 'auth_cubit.dart';

@immutable
abstract class AuthState {}

class AuthInitial extends AuthState {}
class AuthRegisLoading extends AuthState {}
class AuthRegisSuccess extends AuthState {
   final String messageSuccess;
  AuthRegisSuccess(this.messageSuccess);
}
class AuthRegisFailed extends AuthState {
  final String messageFailed;
  AuthRegisFailed(this.messageFailed);
}

class AuthLoginLoading extends AuthState {}
class AuthLoginSuccess extends AuthState {
   final String messageSuccess;
  AuthLoginSuccess(this.messageSuccess);
}
class AuthLoginFailed extends AuthState {
  final String messageFailed;
  AuthLoginFailed(this.messageFailed);
}
