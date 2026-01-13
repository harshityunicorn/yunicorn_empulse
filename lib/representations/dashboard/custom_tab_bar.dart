import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yunicorn_empulse/core/constants/image_constants.dart';

class CustomTabBar extends StatefulWidget {
  final List<String> tabs;
  final Function(int)? onTabSelected;
  final Color selectedColor;
  final Color unselectedColor;
  final Color selectedTextColor;
  final Color unselectedTextColor;
  final Color backgroundColor;

  const CustomTabBar({
    super.key,
    required this.tabs,
    this.onTabSelected,
    this.selectedColor = const Color(0xFF3D4B7A),
    this.unselectedColor = Colors.transparent,
    this.selectedTextColor = Colors.white,
    this.unselectedTextColor = const Color(0xFF3D4B7A),
    this.backgroundColor = const Color(0xFFF5F5F5),
  });

  @override
  State<CustomTabBar> createState() => _CustomTabBarState();
}

class _CustomTabBarState extends State<CustomTabBar> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.h,
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: widget.backgroundColor,
        borderRadius: BorderRadius.circular(30.r),
      ),
      child: Row(
        children: [
          ...List.generate(
            widget.tabs.length,
            (index) => Expanded(
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    _selectedIndex = index;
                  });
                  widget.onTabSelected?.call(index);
                },
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                  decoration: BoxDecoration(
                    color: _selectedIndex == index
                        ? widget.selectedColor
                        : widget.unselectedColor,
                    borderRadius: BorderRadius.circular(26.r),
                  ),
                  child: Center(
                    child: Text(
                      widget.tabs[index],
                      style: TextStyle(
                        color: _selectedIndex == index
                            ? widget.selectedTextColor
                            : widget.unselectedTextColor,
                        fontWeight: FontWeight.w600,
                        fontSize: 15.sp,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
         
        ],
      ),
    );
  }
}
