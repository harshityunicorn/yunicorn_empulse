part of 'login_bloc.dart';

@immutable
sealed class LoginState {}

final class LoginInitial extends LoginState {}

final class LoginSuccess extends LoginState{
  final User user;
  LoginSuccess({required this.user});
}

final class LoginFailed extends LoginState{}

final class LoginLoading extends LoginState{}