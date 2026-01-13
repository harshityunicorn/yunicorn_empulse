import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yunicorn_empulse/logic/dashboard/dashboard_bloc.dart';
import 'package:yunicorn_empulse/representations/dashboard/news_card.dart';

class NewsView extends StatelessWidget {
  const NewsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DashboardBloc, DashboardState>(
      builder: (context, state) {
        if (state is DashBoardPageLoaded) {
          return SizedBox(
            height: 100.h,
            child: ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: 8),
              itemCount: state.news.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return NewsCard(news: state.news[index]);
              },
            ),
          );
        }
        return Container();
      },
    );
  }
}
