import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yunicorn_empulse/core/constants/color_contants.dart';
import 'package:yunicorn_empulse/core/constants/image_constants.dart';
import 'package:yunicorn_empulse/core/constants/text_constants.dart';
import 'package:yunicorn_empulse/core/widgets/circular_profile.dart';
import 'package:yunicorn_empulse/core/widgets/leaderboard_details/point_tile.dart';
import 'package:yunicorn_empulse/data/models/user.dart';
import 'package:yunicorn_empulse/logic/leaderboard_details/leaderboard_details_bloc.dart';

class LeaderboardDetailsScreen extends StatelessWidget {
  const LeaderboardDetailsScreen({super.key, required this.user});
  final User user;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          LeaderboardDetailsBloc()
            ..add(LoadLeaderBoardHistoryEvent(userId: user.id)),
      child: Scaffold(
        // backgroundColor: ColorContants.brand_secondary,
        appBar: AppBar(
          title: Text(TextConstants.leaderBoard),
          backgroundColor: ColorContants.brand_secondary,
        ),
        body: BlocBuilder<LeaderboardDetailsBloc, LeaderboardDetailsState>(
          builder: (context, state) {
            return Column(
              children: [
                Container(
                  height: 200.h,
                  color: ColorContants.brand_secondary,
                  padding: EdgeInsets.all(12),
                  alignment: Alignment.center,
                  child: CircularProfile(
                    radius: 45.h,
                    backgroundImage: user.image ?? ImageConstants.rupesh_sir,
                    name: user.name,
                    position: user.profile,
                    nameFontSize: 18,
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: ColorContants.text_grey_white,
                    ),

                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          TextConstants.pointHistory,
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                          ),
                        ),
                        Expanded(
                          child: ListView.builder(
                            itemCount: state.pointhistory.length,

                            itemBuilder: (context, index) {
                              return PointTile(
                                point: state.pointhistory[index],
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
