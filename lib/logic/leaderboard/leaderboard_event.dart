part of 'leaderboard_bloc.dart';

@immutable
sealed class LeaderboardEvent {}

class LoadLeaderBoard extends LeaderboardEvent {}

class ClickOnFilterButtonEvent extends LeaderboardEvent {}
