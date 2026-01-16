part of 'leaderboard_bloc.dart';

@immutable
sealed class LeaderboardState {}

final class LeaderboardInitial extends LeaderboardState {
  final List<User> employees;
  final UserFilters? tripFilter;
  LeaderboardInitial({required this.employees, this.tripFilter});

  factory LeaderboardInitial.initial() {
    return LeaderboardInitial(employees: []);
  }

  LeaderboardInitial copyWith({UserFilters? tripFilter, List<User>? employees}) {
    return LeaderboardInitial(
      employees: employees ?? this.employees,
      tripFilter: tripFilter ?? this.tripFilter,
    );
  }
}
