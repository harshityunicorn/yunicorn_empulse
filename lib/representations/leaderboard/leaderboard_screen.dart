import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yunicorn_empulse/core/constants/color_contants.dart';
import 'package:yunicorn_empulse/core/constants/enums.dart';
import 'package:yunicorn_empulse/core/constants/text_constants.dart';
import 'package:yunicorn_empulse/core/widgets/leaderboard/filter_bottom_sheet.dart';
import 'package:yunicorn_empulse/core/widgets/leaderboard/leader_board_tile.dart';
import 'package:yunicorn_empulse/core/widgets/leaderboard/custom_tab_bar_filter.dart';
import 'package:yunicorn_empulse/core/widgets/leaderboard/leaderboard_top_three.dart';
import 'package:yunicorn_empulse/data/models/user.dart';
import 'package:yunicorn_empulse/data/models/user_filters.dart';
import 'package:yunicorn_empulse/logic/bottom_nav/bottom_nav_bloc.dart';
import 'package:yunicorn_empulse/logic/leaderboard/leaderboard_bloc.dart';

class LeaderboardScreen extends StatelessWidget {
  const LeaderboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LeaderboardBloc, LeaderboardState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        final currentState = state as LeaderboardInitial;

        void _showFilterBottomSheet() async {
          final filters = await UserFilterBottomSheet.show(
            context,
            initialFilters: UserFilters(
              selectedDepartment: DEPARTMENT.development,
              selectedTrip: TRIPS.dubai,
            ),
          );
          context.read<LeaderboardBloc>().add(
            ApplyFiltersEvent(appliedFilters: filters),
          );
        }

        return Scaffold(
          backgroundColor: ColorContants.brand_secondary,
          body: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: TextButton.icon(
                      label: Text(
                        TextConstants.leaderBoard,
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                          color: ColorContants.black,
                        ),
                      ),
                      icon: Icon(Icons.arrow_back_ios),
                      onPressed: () {
                        context.read<BottomNavBloc>().add(
                          BottomNavBarClickedEvent(index: 0),
                        );
                      },
                    ),
                  ),

                  LeaderboardTopThree(
                    users: [
                      User(
                        id: "YC-00051",
                        email: 'harshit@gmail.com',
                        password: "fdsf",
                        name: "Rupesh patil",
                        profile: "CEO",
                        department: DEPARTMENT.development,
                        joinDate: DateTime.now(),
                        points: 2000,
                        rank: 1,
                        tripEligibility: TripEligibility(
                          eligibility: ELIGIBILITY.pending,
                          trip: TRIPS.dubai,
                        ),
                      ),
                      User(
                        id: "YC-00051",
                        email: 'harshit@gmail.com',
                        password: "fdsf",
                        name: "Rupesh patil",
                        profile: "CEO",
                        department: DEPARTMENT.development,
                        joinDate: DateTime.now(),
                        points: 2000,
                        rank: 2,
                        tripEligibility: TripEligibility(
                          eligibility: ELIGIBILITY.pending,
                          trip: TRIPS.dubai,
                        ),
                      ),
                      User(
                        id: "YC-00051",
                        email: 'harshit@gmail.com',
                        password: "fdsf",
                        name: "Rupesh patil",
                        profile: "CEO",
                        department: DEPARTMENT.development,
                        joinDate: DateTime.now(),
                        points: 2000,
                        rank: 3,
                        tripEligibility: TripEligibility(
                          eligibility: ELIGIBILITY.pending,
                          trip: TRIPS.dubai,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    width: double.infinity,

                    decoration: BoxDecoration(
                      color: ColorContants.text_grey_white,
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 0, vertical: 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15.0),
                          child: Text(
                            "All Employees",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                              color: ColorContants.black,
                            ),
                          ),
                        ),

                        CustomTabBarFilter(
                          tabs: ["weekly", "monthly", "all time"],
                          backgroundColor: ColorContants.text_grey_white,
                          onFilterTap: () {
                            _showFilterBottomSheet();
                          },
                          onTabSelected: (value) {},
                        ),

                        SizedBox(
                          height: 300.h,
                          child: ListView.builder(
                            itemCount: currentState.employees.length,
                            itemBuilder: (context, index) {
                              return LeaderBoardTile(
                                onTap: () {
                                  context.read<LeaderboardBloc>().add(
                                    ClickOnLeaderBoardTile(
                                      user: currentState.employees[index],
                                    ),
                                  );
                                },
                                user: currentState.employees[index],
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
