part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent {}

class CheckAuthStatus extends AuthEvent {}

class SaveUserAndToken extends AuthEvent {
  final User user;
  SaveUserAndToken({required this.user});
}
