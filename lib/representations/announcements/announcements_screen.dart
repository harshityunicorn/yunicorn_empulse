import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yunicorn_empulse/core/constants/color_contants.dart';
import 'package:yunicorn_empulse/core/constants/image_constants.dart';
import 'package:yunicorn_empulse/core/constants/text_constants.dart';
import 'package:yunicorn_empulse/core/widgets/announcements/announcement_filter_sheet.dart';
import 'package:yunicorn_empulse/core/widgets/announcements/announcements_card.dart';
import 'package:yunicorn_empulse/core/widgets/leaderboard/custom_tab_bar_filter.dart';
import 'package:yunicorn_empulse/logic/news/news_bloc.dart';

class AnnouncementsScreen extends StatelessWidget {
  const AnnouncementsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(TextConstants.announcements)),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: BlocBuilder<NewsBloc, NewsState>(
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
                  onFilterTap: () async {
                    final filters = await AnnouncementFilterSheet.show(context);
                    if (filters != null) {
                      context.read<NewsBloc>().add(
                        ApplyFiltersEvent(filters: filters),
                      );
                    }
                  },
                ),

                Expanded(
                  child: ListView.builder(
                    itemCount: state.newsList.length,
                    itemBuilder: (context, index) {
                      return AnnouncementsCard(
                        title: state.newsList[index].title,
                        content: state.newsList[index].content,
                        date: state.newsList[index].date,
                        byTeam: state.newsList[index].madeBy,
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
