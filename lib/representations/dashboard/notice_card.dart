import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yunicorn_empulse/core/constants/color_contants.dart';
import 'package:yunicorn_empulse/core/constants/image_constants.dart';
import 'package:yunicorn_empulse/core/constants/text_constants.dart';
import 'package:yunicorn_empulse/core/util/util.dart';

class NoticeCard extends StatelessWidget {
  const NoticeCard({
    super.key,
    this.isPinned = false,
    required this.title,
    required this.content,
    required this.byTeam,
    required this.date,
    required this.tag,
  });
  final bool isPinned;
  final String title;
  final String content;
  final String tag;
  final String byTeam;
  final DateTime date;

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.hardEdge,
      color: ColorContants.notification_card_background_cream,
      surfaceTintColor: ColorContants.notification_card_background_cream,
      child: Container(
        padding: EdgeInsets.fromLTRB(12, 0, 12, 8),
        color: ColorContants.notification_card_background_cream,
        child: Column(
          spacing: 4,
          children: [
            Row(
              spacing: 12,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  ImageConstants.notification_icon,
                  height: 56.h,
                  width: 24.h,
                  fit: BoxFit.cover,
                ),
                Text(
                  TextConstants.tripEligibilityCriteriaUpdated,
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
                ),
              ],
            ),
            Text(
              TextConstants.notification1content,
              style: TextStyle(overflow: TextOverflow.ellipsis),
              maxLines: 2,
            ),

            Row(
              spacing: 8,
              children: [
                Text("Trip-related"),
                CircleAvatar(maxRadius: 3),
                Text("By HR Team"),
                CircleAvatar(maxRadius: 3),
                Text('${Util.getDaysFromNow(date) + 1}d ago'),
                Spacer(),
                Stack(
                  children: [
                    Image.asset(
                      ImageConstants.push_pin,
                      height: 24.h,
                      width: 24.w,
                    ),
                    if (isPinned)
                      Image.asset(ImageConstants.cross_line, width: 20.h),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
