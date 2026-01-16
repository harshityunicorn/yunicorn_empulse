import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yunicorn_empulse/core/constants/color_contants.dart';
import 'package:yunicorn_empulse/core/constants/image_constants.dart';
import 'package:yunicorn_empulse/core/constants/text_constants.dart';
import 'package:yunicorn_empulse/logic/dashboard/dashboard_bloc.dart';
import 'package:yunicorn_empulse/logic/notice/notice_bloc.dart';
import 'package:yunicorn_empulse/core/widgets/notice_board/notice_card.dart';

class NoticeBoard extends StatelessWidget {
  const NoticeBoard({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NoticeBloc, NoticeState>(
      builder: (context, state) {
        final noticeCount = state.noticeList.length >= 3
            ? 3
            : state.noticeList.length;
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
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          context.read<DashboardBloc>().add(
                            ClickOnNoticeBoardViewAllButton(),
                          );
                        },
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

                  if (state.noticeList.isNotEmpty &&
                      state.noticeList[0].isPinned)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                state.noticeList[0].title,
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 14,
                                ),
                              ),

                              Text(
                                state.noticeList[0].content,
                                style: TextStyle(
                                  overflow: TextOverflow.ellipsis,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 12,
                                ),
                                maxLines: 1,
                              ),
                            ],
                          ),
                        ),
                        Image.asset(ImageConstants.pin_icon, height: 28.h),
                      ],
                    ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20.0,
                vertical: 8,
              ),
              child: Column(
                spacing: 8,
                children: [
                  if (state.noticeList.isNotEmpty)
                    for (int i = 0; i < noticeCount; i++)
                      NoticeCard(
                        onTogglePin: () {
                          context.read<NoticeBloc>().add(
                            ToggleNoticePinEvent(notice: state.noticeList[i]),
                          );
                        },
                        byTeam: state.noticeList[i].byTeam,
                        content: state.noticeList[i].content,
                        tag: state.noticeList[i].category.name,
                        title: state.noticeList[i].title,
                        date: state.noticeList[i].date,
                        isPinned: state.noticeList[i].isPinned,
                      ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
