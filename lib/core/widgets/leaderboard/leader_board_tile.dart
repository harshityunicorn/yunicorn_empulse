import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yunicorn_empulse/core/constants/color_contants.dart';
import 'package:yunicorn_empulse/core/constants/image_constants.dart';
import 'package:yunicorn_empulse/core/widgets/circular_profile.dart';
import 'package:yunicorn_empulse/data/models/user.dart';

class LeaderBoardTile extends StatelessWidget {
  const LeaderBoardTile({super.key, required this.user, required this.onTap});
  final User user;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              width: 1,
              color: ColorContants.card_back_ground_grey,
            ),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
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
                radius: 20,
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  user.name,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 12,
                    color: ColorContants.purple_text_headings,
                  ),
                ),
                Text(
                  user.profile,
                  style: TextStyle(
                    color: ColorContants.sub_heading_grey,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '#${user.rank}',
                  style: TextStyle(
                    color: ColorContants.purple_text_headings,
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text("Rank"),
              ],
            ),
            VerticalDivider(
              color: ColorContants.card_back_ground_grey,
              thickness: 1,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: ColorContants.purple_text_headings,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                  child: Text(
                    user.points.toString(),
                    style: TextStyle(color: ColorContants.text_grey_white),
                  ),
                ),
                Row(
                  children: [
                    Image.asset(ImageConstants.arrow_up, height: 24.h),
                    Text(
                      "1",
                      style: TextStyle(
                        color: ColorContants.error_green,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
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
