import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yunicorn_empulse/core/widgets/circular_profile.dart';
import 'package:yunicorn_empulse/data/models/user.dart';

class LeaderboardTopThree extends StatelessWidget {
  const LeaderboardTopThree({super.key, required this.users});
  final List<User> users;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        if (users.length >= 2)
          Container(
            padding: EdgeInsets.fromLTRB(8.w, 65.h, 8.w, 8.h),
            child: CircularProfile(
              backgroundImage: users[1].image ?? '',
              name: users[1].name,
              rank: users[1].rank,
              points: users[1].points,
            ),
          ),
        if (users.isNotEmpty)
          Container(
            padding: EdgeInsets.fromLTRB(8.w, 0.h, 8.w, 8.h),
            child: CircularProfile(
              backgroundImage: users[0].image ?? '',
              name: users[0].name,
              rank: users[0].rank,
              points: users[0].points,
            ),
          ),
        if (users.length >= 3)
          Container(
            padding: EdgeInsets.fromLTRB(8.w, 65.h, 8.w, 8.h),
            child: CircularProfile(
              backgroundImage: users[2].image ?? '',
              name: users[2].name,
              rank: users[2].rank,
              points: users[2].points,
            ),
          ),
      ],
    );
  }
}
