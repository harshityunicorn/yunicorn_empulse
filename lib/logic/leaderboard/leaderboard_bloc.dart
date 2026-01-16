import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:yunicorn_empulse/core/constants/enums.dart';
import 'package:yunicorn_empulse/core/navigation/navigation_services.dart';
import 'package:yunicorn_empulse/data/dummy_data/dummy_data.dart';
import 'package:yunicorn_empulse/data/models/user.dart';
import 'package:yunicorn_empulse/data/models/user_filters.dart';
import 'package:yunicorn_empulse/routes/app_routes.dart';

part 'leaderboard_event.dart';
part 'leaderboard_state.dart';

class LeaderboardBloc extends Bloc<LeaderboardEvent, LeaderboardState> {
  LeaderboardBloc() : super(LeaderboardInitial.initial()) {
    on<LoadLeaderBoard>(loadLeaderBoard);
    on<ClickOnLeaderBoardTile>(clickOnLeaderBoardTile);
    on<ApplyFiltersEvent>(applyFiltersEvent);
  }

  FutureOr<void> loadLeaderBoard(
    LoadLeaderBoard event,
    Emitter<LeaderboardState> emit,
  ) {
    List<User> employees = DummyData.userList;
    emit(LeaderboardInitial(employees: employees));
  }

  FutureOr<void> clickOnLeaderBoardTile(
    ClickOnLeaderBoardTile event,
    Emitter<LeaderboardState> emit,
  ) {
    NavigationService.pushNamed(
      AppRoutes.leaderBoardDetails,
      arguments: event.user,
    );
  }

  FutureOr<void> applyFiltersEvent(
    ApplyFiltersEvent event,
    Emitter<LeaderboardState> emit,
  ) {
    print(event.appliedFilters);
    if (state is LeaderboardInitial) {
      final employees = DummyData.userList;
      final filters = event.appliedFilters;
      if (filters != null) {
        final filteredEmployees = filterUsers(
          users: employees,
          filters: filters,
        );
        emit(LeaderboardInitial(employees: filteredEmployees));
      }else{
        emit(LeaderboardInitial(employees: employees));
      }
    }
  }
}

List<User> filterUsers({
  required List<User> users,
  required UserFilters filters,
}) {
  if (filters.selectedTrip == TRIPS.all) {
    return users;
  }
  return users.where((user) {
    final matchesDepartment =
        filters.selectedDepartment == null ||
        user.department == filters.selectedDepartment;

    final matchesTrip =
        filters.selectedTrip == null ||
        user.tripEligibility.trip == filters.selectedTrip;

    return matchesDepartment && matchesTrip;
  }).toList();
}
