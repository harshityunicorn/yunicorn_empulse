import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:yunicorn_empulse/data/dummy_data/dummy_data.dart';
import 'package:yunicorn_empulse/data/models/user.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    on<ClickOnLoginButtonEvent>((event, emit) {
      bool userPresent = DummyData.userList.any(
        (user) => user.email == event.email && user.password == event.password,
      );

      if (userPresent) {
        User user = DummyData.userList.firstWhere(
          (u) => u.email == event.email,
        );
        emit(LoginSuccess(user: user));
      } else {
        emit(LoginFailed());
      }
      emit(LoginInitial());
    });
  }
}
