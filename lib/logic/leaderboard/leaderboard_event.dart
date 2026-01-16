part of 'leaderboard_bloc.dart';

@immutable
sealed class LeaderboardEvent {}

class LoadLeaderBoard extends LeaderboardEvent {}

class ClickOnFilterButtonEvent extends LeaderboardEvent {}

class ClickOnLeaderBoardTile extends LeaderboardEvent{
  final User user;
  ClickOnLeaderBoardTile({required this.user});
}

class ApplyFiltersEvent extends LeaderboardEvent{
  final UserFilters? appliedFilters;
  ApplyFiltersEvent({required this.appliedFilters});
}