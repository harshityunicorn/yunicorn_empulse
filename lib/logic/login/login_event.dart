part of 'login_bloc.dart';

@immutable
sealed class LoginEvent {}

class ClickOnLoginButtonEvent extends LoginEvent{
  final String email;
  final String password;
  ClickOnLoginButtonEvent({required this.email, required this.password});
}

class TogglePasswordVisibility extends LoginEvent{}
