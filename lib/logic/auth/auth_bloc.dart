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
      } else {
        User user = DummyData.userList.firstWhere(
          (element) => element.email == token,
        );
        emit(AuthAuthenticated(user: user));
      }
    });

    on<SaveUserAndToken>(saveUserAndToken);
  }

  FutureOr<void> saveUserAndToken(
    SaveUserAndToken event,
    Emitter<AuthState> emit,
  ) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    // in real case scenerio save token instead of email;
    sharedPreferences.setString('token', event.user.email);
    NavigationService.pushNamed(AppRoutes.dashboard);
  }
}
