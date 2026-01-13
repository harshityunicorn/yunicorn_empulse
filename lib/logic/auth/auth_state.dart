part of 'auth_bloc.dart';

@immutable
sealed class AuthState {}

class AuthChecking extends AuthState {}

class AuthAuthenticated extends AuthState {
  final User user;
  AuthAuthenticated({required this.user});
}

class AuthUnauthenticated extends AuthState {}
