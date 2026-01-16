part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent {}

class CheckAuthStatus extends AuthEvent {}

class UpdateUser extends AuthEvent{
  User user;
  UpdateUser({required this.user});
}

class SaveUserAndToken extends AuthEvent {
  final User user;
  SaveUserAndToken({required this.user});
}


class LogoutEvent extends AuthEvent{}