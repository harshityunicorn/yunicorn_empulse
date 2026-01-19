import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:yunicorn_empulse/core/navigation/navigation_services.dart';
import 'package:yunicorn_empulse/data/dummy_data/dummy_data.dart';
import 'package:yunicorn_empulse/data/models/user.dart';
import 'package:yunicorn_empulse/routes/app_routes.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthChecking()) {
    on<CheckAuthStatus>((event, emit) async {
      await Future.delayed(const Duration(seconds: 1));
      final sharedPreferences = await SharedPreferences.getInstance();
      String? token = sharedPreferences.getString('token');

      if (token == null) {
        emit(AuthUnauthenticated());
        NavigationService.pushReplacementNamed(AppRoutes.login);
      } else {
        User user = DummyData.userList.firstWhere(
          (element) => element.email == token,
        );
        emit(AuthAuthenticated(user: user));
        NavigationService.pushReplacementNamed(AppRoutes.navbar);
      }
    });

    on<LogoutEvent>(logoutEvent);

    on<SaveUserAndToken>(saveUserAndToken);

    on<UpdateUser>(updateUser);
  }

  FutureOr<void> saveUserAndToken(
    SaveUserAndToken event,
    Emitter<AuthState> emit,
  ) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    // in real case scenerio save token instead of email;
    sharedPreferences.setString('token', event.user.email);
    emit(AuthAuthenticated(user: event.user));
    NavigationService.pushNamed(AppRoutes.navbar);
  }

  FutureOr<void> updateUser(UpdateUser event, Emitter<AuthState> emit) {
    emit(AuthAuthenticated(user: event.user));
  }

  FutureOr<void> logoutEvent(LogoutEvent event, Emitter<AuthState> emit) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.clear();
    NavigationService.pushNamed(AppRoutes.login);
  }
}
