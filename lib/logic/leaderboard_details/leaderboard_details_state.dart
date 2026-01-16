part of 'leaderboard_details_bloc.dart';

class LeaderboardDetailsState {
  final List<PointHistory> pointhistory;
  LeaderboardDetailsState({required this.pointhistory});

  factory LeaderboardDetailsState.initial() {
    return LeaderboardDetailsState(pointhistory: []);
  }
}
