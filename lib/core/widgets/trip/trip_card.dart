import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yunicorn_empulse/core/constants/color_contants.dart';
import 'package:yunicorn_empulse/core/constants/image_constants.dart';
import 'package:yunicorn_empulse/core/constants/text_constants.dart';
import 'package:yunicorn_empulse/core/widgets/common_elevated_button.dart';
import 'package:yunicorn_empulse/data/models/trip.dart';
import 'package:yunicorn_empulse/logic/trip/trip_bloc.dart';

class TripCard extends StatelessWidget {
  const TripCard({super.key, required this.trip});
  final Trip trip;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      clipBehavior: Clip.hardEdge,
      child: Column(
        children: [
          Image.asset(trip.image),
          Container(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  spacing: 4,
                  children: [
                    Text(
                      trip.title,
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 18.h,
                      ),
                    ),
                    Spacer(),
                    Image.asset(ImageConstants.location_icon, height: 16.h),
                    Text(
                      trip.address,
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 14.h,
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 4),

                Row(
                  children: [
                    Text(
                      TextConstants.rewardType,
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 10.h,
                        color: ColorContants.sub_heading_grey,
                      ),
                    ),
                    Spacer(),
                    Text(
                      TextConstants.availableSlots,
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 10.h,
                        color: ColorContants.sub_heading_grey,
                      ),
                    ),
                  ],
                ),

                Row(
                  children: [
                    Text(
                      trip.rewardType,
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 10.h,
                        color: ColorContants.black,
                      ),
                    ),
                    Spacer(),
                    Text(
                      '${trip.availableSlots} ${TextConstants.winnersOnly}',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 10.h,
                        color: ColorContants.black,
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 6),

                Text(
                  TextConstants.yourProgress,
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: 12.h,
                    color: ColorContants.black,
                  ),
                ),
                Slider(
                  activeColor: trip.themeColor,
                  padding: EdgeInsets.all(0),
                  max: 100,
                  min: 0,

                  value: 80,
                  onChanged: (value) {},
                ),
                Text(
                  TextConstants.sliderSubHeading,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 10.h,
                    color: ColorContants.sub_heading_grey,
                  ),
                ),

                SizedBox(height: 8.h),
                CommonElevatedButton(
                  buttonText: TextConstants.viewDetails,
                  onClick: () {
                    context.read<TripBloc>().add(ClickOnViewDetailsButton(trip: trip));
                  },
                  color: trip.themeColor,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
