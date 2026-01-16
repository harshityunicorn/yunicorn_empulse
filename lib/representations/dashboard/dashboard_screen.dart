import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yunicorn_empulse/core/constants/color_contants.dart';
import 'package:yunicorn_empulse/core/constants/image_constants.dart';
import 'package:yunicorn_empulse/core/widgets/custom_bottom_navigation.dart';
import 'package:yunicorn_empulse/core/widgets/nav_item.dart';
import 'package:yunicorn_empulse/logic/dashboard/dashboard_bloc.dart';
import 'package:yunicorn_empulse/representations/dashboard/dash_board_content.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DashboardBloc()..add(DashBoardLoadEvent()),
      child: Scaffold(
        body: SingleChildScrollView(
            child: SafeArea(
              child: Column(
                children: [
                  Stack(
                    children: [
                      Container(
                        height: 260.h,
                        decoration: BoxDecoration(
                          color: ColorContants.brand_secondary,
                        ),
                      ),
                      Positioned(
                        right: -23.w,
                        top: 50.h,
                        child: Image.asset(
                          ImageConstants.three_leaf,
                          height: 140.h,
                        ),
                      ),
                      Positioned(
                        left: 0.w,
                        top: 60.h,
                        child: Image.asset(
                          ImageConstants.half_star,
                          height: 140.h,
                        ),
                      ),
                      DashBoardContent(),
                      Positioned(bottom: 10, child: CustomBottomNavigation()),
                    ],
                  ),
                ],
              ),
            ),
          ),
      ),
      );
  }
}
