import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yunicorn_empulse/core/constants/color_contants.dart';
import 'package:yunicorn_empulse/core/constants/text_constants.dart';

class PointsCard extends StatelessWidget {
  const PointsCard({
    super.key,
    required this.title,
    required this.content,
    required this.iconImage,
  });
  final String title;
  final String content;
  final String iconImage;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 70.h,
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: ColorContants.text_grey_white,
          borderRadius: BorderRadius.circular(12),
        ),
        alignment: Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  content,
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w500,
                    color: ColorContants.sub_heading_grey,
                  ),
                ),
              ],
            ),
            CircleAvatar(
              backgroundColor: ColorContants.card_back_ground_grey,
              child: Image.asset(
                iconImage,
                height: 24,
                color: ColorContants.purple_text_headings,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
