import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yunicorn_empulse/core/constants/color_contants.dart';

class CustomBottomNavigation extends StatefulWidget {
  const CustomBottomNavigation({super.key});

  @override
  State<CustomBottomNavigation> createState() => _CustomBottomNavigationState();
}

class _CustomBottomNavigationState extends State<CustomBottomNavigation> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 80.h,
        width: 330.w,
        decoration: BoxDecoration(
          color: ColorContants.text_grey_white, 
          borderRadius: BorderRadius.circular(20)
        ),
        child: Row(),
      ),
    );
  }
}