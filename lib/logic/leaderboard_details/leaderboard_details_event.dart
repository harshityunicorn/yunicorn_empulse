part of 'leaderboard_details_bloc.dart';

@immutable
sealed class LeaderboardDetailsEvent {}

class LoadLeaderBoardHistoryEvent extends LeaderboardDetailsEvent{
  final String userId;
  LoadLeaderBoardHistoryEvent({required this.userId});
}
