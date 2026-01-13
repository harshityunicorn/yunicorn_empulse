import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yunicorn_empulse/representations/dashboard/dashboard_header.dart';
import 'package:yunicorn_empulse/representations/dashboard/leader_board.dart';
import 'package:yunicorn_empulse/representations/dashboard/news_view.dart';
import 'package:yunicorn_empulse/representations/dashboard/notice_board.dart';
import 'package:yunicorn_empulse/representations/dashboard/trip_board.dart';

class DashBoardContent extends StatelessWidget {
  const DashBoardContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DashboardHeader(),
        NewsView(),
        NoticeBoard(),
        TripBoard(), 
        LeaderBoard()
      ],
    );
  }
}
