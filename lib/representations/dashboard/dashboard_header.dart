import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yunicorn_empulse/core/constants/color_contants.dart';
import 'package:yunicorn_empulse/core/constants/image_constants.dart';
import 'package:yunicorn_empulse/core/constants/text_constants.dart';
import 'package:yunicorn_empulse/logic/dashboard/dashboard_bloc.dart';

class DashboardHeader extends StatelessWidget {
  const DashboardHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 12.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            spacing: 12.w,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    TextConstants.goodMorning,
                    style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    'Aditi Sharma',
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              const Spacer(),
              GestureDetector(
                onTap: () {
                  context.read<DashboardBloc>().add(ClickOnNotificationButton());
                },
                child: Image.asset(
                  ImageConstants.notification_icon,
                  height: 56.h,
                  width: 24.h,
                  fit: BoxFit.cover, // Use contain instead of cover
                ),
              ),
              Image.asset(
                ImageConstants.person_icon,
                height: 56.h,
                width: 24.h,
                fit: BoxFit.cover, // Use contain instead of cover
              ),
            ],
          ),

          Divider(color: ColorContants.text_grey_white),
          SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "1870",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 20.h,
                    ),
                  ),
                  Text(
                    TextConstants.yourTotalPoints,
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
                  ),
                ],
              ),
              Column(
                children: [
                  Image.asset(
                    ImageConstants.person_holding_stars,
                    height: 47.h,
                  ),
                  Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: ColorContants.purple_text_headings,
                      borderRadius: BorderRadius.circular(26),
                    ),
                    child: Center(
                      child: Text(
                        TextConstants.yourCurrentRanking,
                        style: TextStyle(color: ColorContants.text_grey_white),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
