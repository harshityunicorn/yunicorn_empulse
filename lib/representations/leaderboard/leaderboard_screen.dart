import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yunicorn_empulse/core/constants/color_contants.dart';
import 'package:yunicorn_empulse/core/constants/text_constants.dart';
import 'package:yunicorn_empulse/core/widgets/custom_bottom_sheet.dart';
import 'package:yunicorn_empulse/core/widgets/leaderboard/leader_board_tile.dart';
import 'package:yunicorn_empulse/core/widgets/leaderboard/custom_tab_bar_filter.dart';
import 'package:yunicorn_empulse/core/widgets/leaderboard/leaderboard_top_three.dart';
import 'package:yunicorn_empulse/data/models/user.dart';
import 'package:yunicorn_empulse/logic/bottom_nav/bottom_nav_bloc.dart';
import 'package:yunicorn_empulse/logic/leaderboard/leaderboard_bloc.dart';
import 'package:yunicorn_empulse/representations/leaderboard/filter_sheet.dart';

class LeaderboardScreen extends StatelessWidget {
  const LeaderboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LeaderboardBloc()..add(LoadLeaderBoard()),
      child: BlocConsumer<LeaderboardBloc, LeaderboardState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          final currentState = state as LeaderboardInitial;

          void handleClickOnFilterButton(ctx) {
            CustomBottomSheet.show(ctx, child: FilterSheet());
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
                          email: 'harshit@gmail.com',
                          password: "fdsf",
                          name: "Rupesh patil",
                          profile: "CEO",
                          department: DEPARTMENT.engineering,
                          joinDate: DateTime.now(),
                          points: 2000,
                          rank: 1,
                          tripEligibility: TRIP_ELIGIBILITY.pending,
                        ),
                        User(
                          email: 'harshit@gmail.com',
                          password: "fdsf",
                          name: "Rupesh patil",
                          profile: "CEO",
                          department: DEPARTMENT.engineering,
                          joinDate: DateTime.now(),
                          points: 2000,
                          rank: 2,
                          tripEligibility: TRIP_ELIGIBILITY.pending,
                        ),
                        User(
                          email: 'harshit@gmail.com',
                          password: "fdsf",
                          name: "Rupesh patil",
                          profile: "CEO",
                          department: DEPARTMENT.engineering,
                          joinDate: DateTime.now(),
                          points: 2000,
                          rank: 3,
                          tripEligibility: TRIP_ELIGIBILITY.pending,
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
                            padding: const EdgeInsets.symmetric(
                              horizontal: 15.0,
                            ),
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
                              handleClickOnFilterButton(context);
                            },
                            onTabSelected: (value) {},
                          ),

                          SizedBox(
                            height: 300.h,
                            child: ListView.builder(
                              itemCount: currentState.employees.length,
                              itemBuilder: (context, index) {
                                return LeaderBoardTile(
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
      ),
    );
  }
}
