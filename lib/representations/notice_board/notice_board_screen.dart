import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yunicorn_empulse/core/constants/color_contants.dart';
import 'package:yunicorn_empulse/core/constants/image_constants.dart';
import 'package:yunicorn_empulse/core/constants/text_constants.dart';
import 'package:yunicorn_empulse/core/widgets/leaderboard/custom_tab_bar_filter.dart';
import 'package:yunicorn_empulse/logic/notice/notice_bloc.dart';
import 'package:yunicorn_empulse/core/widgets/notice_board/notice_card.dart';

class NoticeBoardScreen extends StatelessWidget {
  const NoticeBoardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(TextConstants.noticeBoard)),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: BlocBuilder<NoticeBloc, NoticeState>(
          builder: (context, state) {
            return Column(
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

                if (state.noticeList[0].isPinned)
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              state.noticeList[0].title,
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 14,
                              ),
                            ),
                            Text(
                              state.noticeList[0].content,
                              style: TextStyle(
                                overflow: TextOverflow.ellipsis,
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: ColorContants.sub_heading_grey,
                              ),
                              maxLines: 1,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 4),

                      Image.asset(ImageConstants.pin_icon, height: 24.h),
                    ],
                  ),

                SizedBox(height: 4),

                Container(
                  padding: EdgeInsets.symmetric(vertical: 4),
                  decoration: BoxDecoration(
                    color: ColorContants.text_grey_white,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(width: 0.2),
                  ),
                  child: EasyDateTimeLine(
                    initialDate: DateTime.now(),
                    onDateChange: (selectedDate) {
                      print(selectedDate);
                    },
                    activeColor: const Color(0xFF2C2C5E),
                    headerProps: const EasyHeaderProps(showHeader: false),
                    dayProps: const EasyDayProps(
                      height: 45,
                      width: 40,
                      borderColor: Colors.transparent,
                      dayStructure: DayStructure.dayNumDayStr,
                      activeDayStyle: DayStyle(
                        dayNumStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                        dayStrStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                        ),
                        decoration: BoxDecoration(
                          color: Color(0xFF2C2C5E),
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                        ),
                      ),
                    ),
                  ),
                ),

                CustomTabBarFilter(
                  tabs: [
                    TextConstants.tripRelated,
                    TextConstants.general,
                    TextConstants.policy,
                  ],
                  backgroundColor: Colors.transparent,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500,
                  outerPadding: EdgeInsets.symmetric(vertical: 12),
                ),

                Expanded(
                  child: ListView.builder(
                    itemCount: state.noticeList.length,
                    itemBuilder: (context, index) {
                      return NoticeCard(
                        title: state.noticeList[index].title,
                        content: state.noticeList[index].content,
                        byTeam: state.noticeList[index].byTeam,
                        date: state.noticeList[index].date,
                        tag: state.noticeList[index].category.name,
                        isPinned: state.noticeList[index].isPinned,
                        onTogglePin: () {
                          context.read<NoticeBloc>().add(
                            ToggleNoticePinEvent(
                              notice: state.noticeList[index],
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
