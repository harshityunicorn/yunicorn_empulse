import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yunicorn_empulse/core/constants/color_contants.dart';
import 'package:yunicorn_empulse/core/constants/image_constants.dart';
import 'package:yunicorn_empulse/core/constants/text_constants.dart';
import 'package:yunicorn_empulse/core/widgets/common_elevated_button.dart';
import 'package:yunicorn_empulse/core/widgets/profile/points_card.dart';
import 'package:yunicorn_empulse/data/models/user.dart';
import 'package:yunicorn_empulse/logic/auth/auth_bloc.dart';
import 'package:yunicorn_empulse/logic/profile/bloc/profile_bloc.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileBloc(),
      child: BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state) {
          final currentState = state as AuthAuthenticated;
          return BlocBuilder<ProfileBloc, ProfileState>(
            builder: (context, profileState) {
              final currentProfileState = profileState as ProfileInitial;
              return Scaffold(
                appBar: AppBar(title: Text(TextConstants.profile)),
                body: Container(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  currentState.user.name,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 24,
                                    color: ColorContants.purple_text_headings,
                                  ),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  softWrap: true,
                                ),
                                SizedBox(height: 4.h),
                                Text(
                                  currentState.user.profile,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                    color: ColorContants.sub_heading_grey,
                                  ),
                                ),
                                SizedBox(height: 4.h),
                                Text(
                                  currentState.user.department.name,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                    color: ColorContants.sub_heading_grey,
                                  ),
                                ),
                                SizedBox(height: 12),
                                Row(
                                  spacing: 12,
                                  children: [
                                    Container(
                                      padding: EdgeInsets.all(8),
                                      decoration: BoxDecoration(
                                        color: ColorContants.brand_secondary,
                                        borderRadius: BorderRadius.circular(24),
                                      ),
                                      child: Text(currentState.user.id),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        context.read<ProfileBloc>().add(
                                          ClickOnImagePickerEvent(),
                                        );
                                      },
                                      child: Image.asset(
                                        ImageConstants.image_picker_icon,
                                        height: 24,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),

                          SizedBox(width: 2.w),

                          SizedBox(
                            height: 200.h,
                            width: 120.w,
                            child: currentProfileState.pickedImage == null
                                ? Image.asset(
                                    currentState.user.image ??
                                        ImageConstants.rupesh_sir,
                                    fit: BoxFit.cover,
                                  )
                                : Image.file(
                                    File(currentProfileState.pickedImage!.path),
                                  ),
                          ),
                        ],
                      ),

                      Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: ColorContants.brand_secondary,
                        ),
                        height: 200.h,
                        child: Column(
                          children: [
                            Expanded(
                              child: Row(
                                children: [
                                  PointsCard(
                                    title: currentState.user.points.toString(),
                                    content: TextConstants.totalPoints,
                                    iconImage: ImageConstants.star_icon,
                                  ),
                                  const SizedBox(width: 12),
                                  PointsCard(
                                    title: currentState.user.rank.toString(),
                                    content: TextConstants.rank,
                                    iconImage: ImageConstants.trophy_icon,
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 12),
                            Expanded(
                              child: Row(
                                children: [
                                  PointsCard(
                                    title: currentState
                                        .user
                                        .tripEligibility
                                        .eligibility
                                        .name,
                                    content: TextConstants.tripEligibility,
                                    iconImage: ImageConstants.luggage_bag_icon,
                                  ),
                                  const SizedBox(width: 12),
                                  PointsCard(
                                    title: currentState.user.joinDate
                                        .toUtc()
                                        .toString()
                                        .split(' ')[0],
                                    content: TextConstants.joinDate,
                                    iconImage: ImageConstants.calender_icon,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),

                      SizedBox(height: 12.h),

                      SizedBox(
                        width: double.infinity,
                        height: 60,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadiusGeometry.circular(12),
                            ),
                            backgroundColor:
                                ColorContants.common_elevated_button_color,
                            foregroundColor: ColorContants.text_grey_white,
                          ),
                          onPressed: () {
                            context.read<AuthBloc>().add(LogoutEvent());
                          },
                          child: Row(
                            spacing: 12,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                TextConstants.logout,
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                ),
                              ),
                              Image.asset(
                                ImageConstants.logout_icon,
                                height: 24,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
