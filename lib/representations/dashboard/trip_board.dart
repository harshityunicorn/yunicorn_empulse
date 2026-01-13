import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yunicorn_empulse/core/constants/color_contants.dart';
import 'package:yunicorn_empulse/core/constants/image_constants.dart';
import 'package:yunicorn_empulse/core/constants/text_constants.dart';

class TripBoard extends StatelessWidget {
  const TripBoard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 50.w, vertical: 24.h),
          child: Column(
            children: [
              Text(
                TextConstants.tripBoardHeading1,
                style: TextStyle(color: ColorContants.sub_heading_grey),
              ),
              Text(
                TextConstants.tripBoardHeading2,
                style: TextStyle(color: ColorContants.sub_heading_grey),
              ),
              Divider(),
            ],
          ),
        ),

        Container(
          color: ColorContants.brand_secondary,
          height: 145.h,
          width: double.infinity,
          child: Stack(
            children: [
              Positioned(
                bottom: 0,
                left: 0,
                child: Image.asset(ImageConstants.trip_board, height: 124.h),
              ),
              Container(
                alignment: Alignment.centerRight,
                padding: EdgeInsets.fromLTRB(70, 20, 16, 0),
                child: Column(
                  spacing: 8,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      TextConstants.tripBoardSlogan,
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      softWrap: true,
                      TextConstants.nextReward,
                      textAlign: TextAlign.end,
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                        color: ColorContants.sub_heading_grey,
                      ),
                    ),
                    GestureDetector(
                      child: Container(
                        width: 120,
                        alignment: Alignment.center,
                        padding: EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: ColorContants.purple_text_headings,
                          ),
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Row(
                          spacing: 8,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              TextConstants.trip_details,
                              style: TextStyle(
                                color: ColorContants.purple_text_headings,
                                fontWeight: FontWeight.w600,
                                fontSize: 12,
                              ),
                            ),
                            Image.asset(
                              ImageConstants.right_arrow,
                              height: 16.h,
                              width: 16.w,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
