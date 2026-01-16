import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yunicorn_empulse/core/constants/color_contants.dart';
import 'package:yunicorn_empulse/core/constants/text_constants.dart';
import 'package:yunicorn_empulse/core/widgets/leaderboard/custom_tab_bar_filter.dart';
import 'package:yunicorn_empulse/core/widgets/trip/trip_card.dart';
import 'package:yunicorn_empulse/logic/trip/trip_bloc.dart';
import 'package:yunicorn_empulse/representations/dashboard/custom_tab_bar.dart';

class TripScreen extends StatelessWidget {
  const TripScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TripBloc()..add(LoadTrips()),
      child: Scaffold(
        body: BlocBuilder<TripBloc, TripState>(
          builder: (context, state) {
            return Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 4,
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
                         
                        },
                      ),
                    ),
                  Text(
                    TextConstants.noticeBoardSubTitle,
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 12,
                      color: ColorContants.sub_heading_grey,
                    ),
                  ),
                  SizedBox(height: 4),
                  CustomTabBarFilter(
                    tabs: [TextConstants.newTrips, TextConstants.archTrips],
                    backgroundColor: Colors.transparent,
                    showFilter: false,
                    outerPadding: EdgeInsets.symmetric(vertical: 12.h),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: state.tripList.length,
                      itemBuilder: (context, index) {
                        return TripCard(trip: state.tripList[index]);
                      },
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
