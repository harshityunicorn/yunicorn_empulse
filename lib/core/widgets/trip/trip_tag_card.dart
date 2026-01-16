import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yunicorn_empulse/core/constants/color_contants.dart';

class TripTagCard extends StatelessWidget {
  const TripTagCard({
    super.key,
    required this.content,
    required this.heading,
    required this.iconImage,
  });
  final String iconImage;
  final String heading;
  final String content;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 95.w,
      height: 70.h,
      decoration: BoxDecoration(
        color: ColorContants.brand_secondary_lighter,
        borderRadius: BorderRadius.circular(12),
      ),
      padding: EdgeInsets.fromLTRB(4, 0, 4, 12),
      child: Column(
        children: [
          Image.asset(iconImage, height: 24),
          Text(
            heading,
            style: TextStyle(
              fontSize: 8.h,
              fontWeight: FontWeight.w500,
              color: ColorContants.sub_heading_grey,
            ),
          ),
          Text(
            content,
            style: TextStyle(
              fontSize: 10.h,
              fontWeight: FontWeight.w500,
              color: ColorContants.purple_text_headings,
            ),
          ),
        ],
      ),
    );
  }
}
