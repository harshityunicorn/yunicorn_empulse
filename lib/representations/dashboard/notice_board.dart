import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yunicorn_empulse/core/constants/color_contants.dart';
import 'package:yunicorn_empulse/core/constants/image_constants.dart';
import 'package:yunicorn_empulse/core/constants/text_constants.dart';
import 'package:yunicorn_empulse/representations/dashboard/notice_card.dart';

class NoticeBoard extends StatelessWidget {
  const NoticeBoard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 50.w, vertical: 24.h),
          child: Column(
            children: [
              Text(
                TextConstants.noticeBoardHeadingPart1,
                style: TextStyle(color: ColorContants.sub_heading_grey),
              ),
              Text(
                TextConstants.noticeBoardHeadingPart2,
                style: TextStyle(color: ColorContants.sub_heading_grey),
              ),
              Divider(),
            ],
          ),
        ),

        Container(
          color: ColorContants.card_back_ground_grey,
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    TextConstants.noticeBoard,
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      TextConstants.viewAll,
                      style: TextStyle(
                        color: ColorContants.sub_heading_grey,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ],
              ),
              Divider(color: ColorContants.text_grey_white),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "New Work From Home Policy",
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 14,
                        ),
                      ),

                      Text(
                        "Updated WFH policy effective November 1st......",
                        style: TextStyle(
                          overflow: TextOverflow.ellipsis,
                          fontWeight: FontWeight.w500,
                          fontSize: 12,
                        ),
                        maxLines: 1,
                      ),
                    ],
                  ),
                  Image.asset(ImageConstants.pin_icon, height: 28.h),
                ],
              ),
            ],
          ),
        ),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8),
          child: Column(
            spacing: 8,
            children: [
              NoticeCard(
                byTeam: TextConstants.byHRTeam,
                content: TextConstants.notification1content,
                tag: TextConstants.notificationTag,
                title: TextConstants.tripEligibilityCriteriaUpdated,
                date: DateTime.now(),
              ),
              NoticeCard(
                byTeam: TextConstants.byHRTeam,
                content: TextConstants.notification1content,
                tag: TextConstants.notificationTag,
                title: TextConstants.tripEligibilityCriteriaUpdated,
                date: DateTime.now(),
              ),
            ],
          ),
        )
      ],
    );
  }
}
