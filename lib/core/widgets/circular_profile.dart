import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yunicorn_empulse/core/constants/color_contants.dart';
import 'package:yunicorn_empulse/core/constants/image_constants.dart';

class CircularProfile extends StatelessWidget {
  const CircularProfile({
    super.key,
    required this.backgroundImage,
    this.radius,
    this.name,
    this.rank,
    this.points,
    this.position,
    this.nameFontSize,
  });

  final String backgroundImage;
  final int? rank;
  final String? name;
  final int? points;
  final String? position;
  final double? radius;
  final double? nameFontSize;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Stack(
          clipBehavior: Clip.none,
          children: [
            if (rank != null && rank == 1)
              Positioned(
                top: -25.h,
                // left: 18.w,
                left: 0.w,
                right: 0.w,
                child: Image.asset(ImageConstants.crown, width: 35.w),
              ),
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  width: 2,
                  color: ColorContants.purple_text_headings,
                ),

                borderRadius: BorderRadius.circular(100),
              ),
              child: CircleAvatar(
                backgroundImage: AssetImage(ImageConstants.rupesh_sir),
                backgroundColor: ColorContants.card_back_ground_grey,
                radius: radius ?? 40,
              ),
            ),
            if (rank != null)
              Positioned(
                bottom: -8,
                left: 0,
                right: 0,
                child: Container(
                  width: 20,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: ColorContants.purple_text_headings,
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    rank.toString(),
                    style: TextStyle(color: ColorContants.text_grey_white),
                  ),
                ),
              ),
          ],
        ),
        SizedBox(height: 8),
        if (name != null)
          Text(
            name!,
            style: TextStyle(
              color: ColorContants.purple_text_headings,
              fontWeight: FontWeight.w600,
              fontSize: nameFontSize ?? 14,
              overflow: TextOverflow.ellipsis,
            ),
            textAlign: TextAlign.center, // Center align the text
            softWrap: true,
            maxLines: 2, // Allow 2 lines instead of 1
          ),

        if (position != null)
          Text(
            position!,
            style: TextStyle(
              color: ColorContants.sub_heading_grey,
              fontWeight: FontWeight.w500,
              fontSize: 12,
            ),
          ),
        if (points != null)
          Container(
            padding: EdgeInsets.all(6),
            width: 80,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24),
              color: ColorContants.purple_text_headings,
            ),
            child: Text(
              points.toString(),
              style: TextStyle(color: ColorContants.text_grey_white),
            ),
          ),
      ],
    );
  }
}
