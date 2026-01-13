part of 'leaderboard_bloc.dart';

@immutable
sealed class LeaderboardState {}

final class LeaderboardInitial extends LeaderboardState {
  final List<User> employees;
  final TRIPS tripFilter;
  LeaderboardInitial({required this.employees, this.tripFilter = TRIPS.all});

  factory LeaderboardInitial.initial() {
    return LeaderboardInitial(employees: []);
  }

  LeaderboardInitial copyWith({TRIPS? tripFilter, List<User>? employees}) {
    return LeaderboardInitial(
      employees: employees ?? this.employees,
      tripFilter: tripFilter ?? this.tripFilter,
    );
  }
}
