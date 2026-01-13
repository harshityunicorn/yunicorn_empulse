import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yunicorn_empulse/core/constants/color_contants.dart';
import 'package:yunicorn_empulse/core/constants/text_constants.dart';
import 'package:yunicorn_empulse/core/widgets/circular_profile.dart';
import 'package:yunicorn_empulse/core/widgets/leaderboard/leader_board_tile.dart';
import 'package:yunicorn_empulse/core/widgets/leaderboard/leaderboard_top_three.dart';
import 'package:yunicorn_empulse/data/models/user.dart';
import 'package:yunicorn_empulse/representations/dashboard/custom_tab_bar.dart';

class LeaderBoard extends StatelessWidget {
  const LeaderBoard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Leaderboard",
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  TextConstants.viewAll,
                  style: TextStyle(
                    color: ColorContants.sub_heading_grey,
                    fontWeight: FontWeight.w600,
                    fontSize: 12,
                  ),
                ),
              ),
            ],
          ),
          CustomTabBar(
            tabs: ["This week", "This month"],
            backgroundColor: ColorContants.card_back_ground_grey,
            selectedColor: ColorContants.purple_text_headings,
            selectedTextColor: ColorContants.text_grey_white,
            unselectedTextColor: ColorContants.purple_text_headings,
          ),

          SizedBox(height: 12.h),
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

          SizedBox(height: 12.h),

          SizedBox(
            height: 200.h,
            child: ListView.builder(
              itemCount: 3,
              itemBuilder: (context, index) {
                return Container(
                  decoration: BoxDecoration(
                    color: ColorContants.text_grey_white,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: LeaderBoardTile(
                    user: User(
                      email: "harshit@gmail.com",
                      password: "2142",
                      name: "Harshit",
                      profile: "Jr. Flutter developer",
                      department: DEPARTMENT.engineering,
                      joinDate: DateTime.now(),
                      points: 2000,
                      rank: 1,
                      tripEligibility: TRIP_ELIGIBILITY.pending,
                    ),
                  ),
                );
              },
            ),
          ),

          Padding(
            padding: EdgeInsets.symmetric(vertical: 4.h),
            child: Column(
              children: [
                Text(
                  TextConstants.seeWhoLeading,
                  style: TextStyle(color: ColorContants.sub_heading_grey),
                ),
                Text(
                  TextConstants.keepShining,
                  style: TextStyle(color: ColorContants.sub_heading_grey),
                ),
                Divider(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
