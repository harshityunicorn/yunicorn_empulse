import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yunicorn_empulse/core/constants/color_contants.dart';
import 'package:yunicorn_empulse/core/constants/image_constants.dart';
import 'package:yunicorn_empulse/core/constants/text_constants.dart';
import 'package:yunicorn_empulse/core/util/util.dart';

class AnnouncementsCard extends StatelessWidget {
  const AnnouncementsCard({
    super.key,
    required this.title,
    required this.content,
    required this.date,
    required this.byTeam,
  });
  final String title;
  final String content;
  final String byTeam;
  final DateTime date;

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.hardEdge,
      elevation: 0,
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
                CircleAvatar(
                  backgroundColor: ColorContants.text_grey_white,
                  child: Image.asset(
                    ImageConstants.announcement_icon,
                    height: 14.h,
                    width: 14.h,
                    fit: BoxFit.cover,
                  ),
                ),
                Text(
                  title,
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
                ),
              ],
            ),
            Text(
              content,
              style: TextStyle(overflow: TextOverflow.ellipsis),
              maxLines: 2,
            ),
            Divider(),

            Row(
              spacing: 8,
              children: [
                Text(
                  '${Util.getDaysFromNow(date) + 1}d ago',
                  style: TextStyle(color: ColorContants.sub_heading_grey),
                ),
                Spacer(),
                Text(
                  byTeam,
                  style: TextStyle(color: ColorContants.sub_heading_grey),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
