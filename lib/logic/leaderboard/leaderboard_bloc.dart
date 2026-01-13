import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:yunicorn_empulse/core/constants/enums.dart';
import 'package:yunicorn_empulse/data/dummy_data/dummy_data.dart';
import 'package:yunicorn_empulse/data/models/user.dart';

part 'leaderboard_event.dart';
part 'leaderboard_state.dart';

class LeaderboardBloc extends Bloc<LeaderboardEvent, LeaderboardState> {
  LeaderboardBloc() : super(LeaderboardInitial.initial()) {
    on<LoadLeaderBoard>(loadLeaderBoard);
  }

  FutureOr<void> loadLeaderBoard(
    LoadLeaderBoard event,
    Emitter<LeaderboardState> emit,
  ) {
    List<User> employees = DummyData.userList;
    emit(LeaderboardInitial(employees: employees));
  }

}
