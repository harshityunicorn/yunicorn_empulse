import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yunicorn_empulse/core/constants/color_contants.dart';
import 'package:yunicorn_empulse/core/util/util.dart';
import 'package:yunicorn_empulse/data/models/point_history.dart';

class PointTile extends StatelessWidget {
  const PointTile({super.key, required this.point});
  final PointHistory point;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: ColorContants.card_back_ground_grey),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  point.reason,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 12.h,
                    color: ColorContants.purple_text_headings,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  softWrap: true,
                ),
                SizedBox(height: 4.h),
                Row(
                  spacing: 2,
                  children: [
                    Text(
                      'By ${point.by}',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 8.h,
                        fontWeight: FontWeight.w500,
                        color: ColorContants.sub_heading_grey,
                      ),
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      Util.formatDateTime(point.dateTime),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 8.h,
                        fontWeight: FontWeight.w500,
                        color: ColorContants.sub_heading_grey,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: point.points > 0
                  ? ColorContants.error_green_light
                  : ColorContants.error_red_light,
            ),
            width: 60.h,
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 6),
            child: Text(
              '${point.points > 0 ? '+' : ""}${point.points.toString()}',
            ),
          ),
        ],
      ),
    );
  }
}
