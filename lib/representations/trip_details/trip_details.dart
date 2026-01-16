import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yunicorn_empulse/core/constants/color_contants.dart';
import 'package:yunicorn_empulse/core/constants/image_constants.dart';
import 'package:yunicorn_empulse/core/constants/text_constants.dart';
import 'package:yunicorn_empulse/core/widgets/trip/trip_tag_card.dart';
import 'package:yunicorn_empulse/data/models/trip.dart';

class TripDetails extends StatelessWidget {
  const TripDetails({super.key, required this.trip});
  final Trip trip;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(TextConstants.trip_details)),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 4,
            children: [
              Text(
                TextConstants.noticeBoardSubTitle,
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 12,
                  color: ColorContants.sub_heading_grey,
                ),
              ),
              SizedBox(height: 4),
              Column(
                children: [
                  Container(
                    clipBehavior: Clip.hardEdge,
                    height: 160.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Image.asset(trip.image, fit: BoxFit.cover),
                  ),
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
                            Image.asset(
                              ImageConstants.location_icon,
                              height: 16.h,
                            ),
                            Text(
                              trip.address,
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 14.h,
                              ),
                            ),
                          ],
                        ),

                        SizedBox(height: 12.h),
                        Row(
                          spacing: 8,
                          children: [
                            TripTagCard(
                              content:
                                  '${trip.availableSlots} ${TextConstants.winnersOnly}',
                              heading: TextConstants.availableSlots,
                              iconImage: ImageConstants.reward_icon,
                            ),
                            TripTagCard(
                              content: trip.rewardType,
                              heading: TextConstants.rewardType,
                              iconImage: ImageConstants.luggage_bag_icon,
                            ),
                            TripTagCard(
                              content: 'Eligible',
                              heading: TextConstants.tripEligibility,
                              iconImage: ImageConstants.right_icon,
                            ),
                          ],
                        ),

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

                        SizedBox(height: 12.h),

                        Text(
                          TextConstants.tripOverview,
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 16.h,
                            color: ColorContants.purple_text_headings,
                          ),
                        ),

                        Container(
                          padding: EdgeInsets.all(12),
                          child: Text(
                            trip.tripOverview,
                            softWrap: true,
                            style: TextStyle(
                              fontSize: 12.h,
                              fontWeight: FontWeight.w500,
                              color: ColorContants.sub_heading_grey,
                            ),
                          ),
                        ),

                        // SizedBox(height: 12.h),
                        Text(
                          TextConstants.tripHighlights,
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 16.h,
                            color: ColorContants.purple_text_headings,
                          ),
                        ),

                        for (int i = 0; i < trip.tripHighlights.length; i++)
                          Row(
                            spacing: 6,
                            children: [
                              Container(
                                height: 4.h,
                                width: 4.h,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: ColorContants.sub_heading_grey,
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  trip.tripHighlights[i],
                                  softWrap: true,
                                  maxLines: 2,
                                  style: TextStyle(
                                    fontSize: 12.h,
                                    fontWeight: FontWeight.w500,
                                    color: ColorContants.sub_heading_grey,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        SizedBox(height: 12.h),

                        Text(
                          TextConstants.eligibilityCriteria,
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 16.h,
                            color: ColorContants.purple_text_headings,
                          ),
                        ),

                        for (
                          int i = 0;
                          i < trip.eligibilityCriteria.length;
                          i++
                        )
                          Row(
                            spacing: 6,
                            children: [
                              Container(
                                height: 4.h,
                                width: 4.h,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: ColorContants.sub_heading_grey,
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  trip.eligibilityCriteria[i],
                                  softWrap: true,
                                  maxLines: 2,
                                  style: TextStyle(
                                    fontSize: 12.h,
                                    fontWeight: FontWeight.w500,
                                    color: ColorContants.sub_heading_grey,
                                  ),
                                ),
                              ),
                            ],
                          ),

                        SizedBox(height: 12.h),

                        Text(
                          TextConstants.inclusions,
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 16.h,
                            color: ColorContants.purple_text_headings,
                          ),
                        ),

                        for (int i = 0; i < trip.inclusions.length; i++)
                          Row(
                            spacing: 6,
                            children: [
                              Container(
                                height: 4.h,
                                width: 4.h,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: ColorContants.sub_heading_grey,
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  trip.inclusions[i],
                                  softWrap: true,
                                  maxLines: 2,
                                  style: TextStyle(
                                    fontSize: 12.h,
                                    fontWeight: FontWeight.w500,
                                    color: ColorContants.sub_heading_grey,
                                  ),
                                ),
                              ),
                            ],
                          ),
                      ],
                    ),
                  ),
                ],
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  TextConstants.tripDetailsLastHeading,
                  softWrap: true,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 10.h,
                    fontWeight: FontWeight.w500,
                    color: ColorContants.sub_heading_grey,
                  ),
                ),
              ),
              Divider()
            ],
          ),
        ),
      ),
    );
  }
}
