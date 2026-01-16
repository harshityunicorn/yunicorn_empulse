import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:yunicorn_empulse/data/dummy_data/dummy_data.dart';
import 'package:yunicorn_empulse/data/models/point_history.dart';

part 'leaderboard_details_event.dart';
part 'leaderboard_details_state.dart';

class LeaderboardDetailsBloc
    extends Bloc<LeaderboardDetailsEvent, LeaderboardDetailsState> {
  LeaderboardDetailsBloc() : super(LeaderboardDetailsState.initial()) {
    on<LoadLeaderBoardHistoryEvent>(loadLeaderBoardHistoryEvent);
  }

  FutureOr<void> loadLeaderBoardHistoryEvent(
    LoadLeaderBoardHistoryEvent event,
    Emitter<LeaderboardDetailsState> emit,
  ) {
    if (DummyData.dummyPointHistory.any(
      (element) => element.userId == event.userId,
    )) {
     
      final pointHistory = DummyData.dummyPointHistory.where((history) {
        return history.userId == event.userId;
      }).toList();
      print(pointHistory);
      emit(LeaderboardDetailsState(pointhistory: pointHistory));
    }
  }
}
