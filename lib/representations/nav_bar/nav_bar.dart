import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yunicorn_empulse/core/constants/color_contants.dart';
import 'package:yunicorn_empulse/core/constants/image_constants.dart';
import 'package:yunicorn_empulse/core/widgets/nav_item.dart';
import 'package:yunicorn_empulse/logic/bottom_nav/bottom_nav_bloc.dart';
import 'package:yunicorn_empulse/representations/dashboard/dashboard_screen.dart';
import 'package:yunicorn_empulse/representations/leaderboard/leaderboard_screen.dart';
import 'package:yunicorn_empulse/representations/trip/trip_screen.dart';

class BottomNavScreen extends StatelessWidget {
  const BottomNavScreen({super.key});

  final List<Widget> tabScreens = const [
    DashboardScreen(),
    TripScreen(),
    LeaderboardScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return BlocListener<BottomNavBloc, BottomNavState>(
      listener: (context, state) {},
      child: BlocBuilder<BottomNavBloc, BottomNavState>(
        builder: (context, state) {
          final currentState = state as BottomNavInitial;
          return Scaffold(
            bottomNavigationBar: CurvedNavigationBar(
              backgroundColor: Colors.transparent,
              onTap: (value) {
                context.read<BottomNavBloc>().add(
                  BottomNavBarClickedEvent(index: value),
                );
              },
              index: state.index,
              items: [
                NavItem(
                  backGroundImage: ImageConstants.home_icon,
                  isSelected: state.index == 0,
                ),
                NavItem(
                  backGroundImage: ImageConstants.airplace_icon,
                  isSelected: state.index == 1,
                ),
                NavItem(
                  backGroundImage: ImageConstants.leaderboard_icon,
                  isSelected: state.index == 2,
                ),
              ],
              buttonBackgroundColor: ColorContants.purple_text_headings,
            ),
            body: IndexedStack(index: currentState.index, children: tabScreens),
          );
        },
      ),
    );
  }
}
