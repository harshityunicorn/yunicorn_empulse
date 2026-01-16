import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yunicorn_empulse/core/constants/image_constants.dart';

class CustomTabBarFilter extends StatefulWidget {
  final List<String> tabs;
  final Function(int)? onTabSelected;
  final Color selectedColor;
  final Color unselectedColor;
  final Color selectedTextColor;
  final Color unselectedTextColor;
  final Color backgroundColor;
  final double? fontSize;
  final double? padding;
  final EdgeInsets? outerPadding;
  final FontWeight? fontWeight;
  final void Function()? onFilterTap;
  final bool showFilter;

  const CustomTabBarFilter({
    super.key,
    required this.tabs,
    this.fontSize,
    this.outerPadding,
    this.fontWeight,
    this.onTabSelected,
    this.padding,
    this.selectedColor = const Color(0xFF3D4B7A),
    this.unselectedColor = Colors.transparent,
    this.selectedTextColor = Colors.white,
    this.unselectedTextColor = const Color(0xFF3D4B7A),
    this.backgroundColor = const Color(0xFFF5F5F5),
    this.onFilterTap,
    this.showFilter = true,
  });

  @override
  State<CustomTabBarFilter> createState() => _CustomTabBarState();
}

class _CustomTabBarState extends State<CustomTabBarFilter> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.h,
      padding: widget.outerPadding ?? EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: widget.backgroundColor,
        borderRadius: BorderRadius.circular(30.r),
      ),
      child: Row(
        spacing: 8,
        children: [
          ...List.generate(
            widget.tabs.length,
            (index) => GestureDetector(
              onTap: () {
                setState(() {
                  _selectedIndex = index;
                });
                widget.onTabSelected?.call(index);
              },
              child: AnimatedContainer(
                // width: 70.w,
                padding: EdgeInsets.all(widget.padding ?? 6),
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
                      fontWeight: widget.fontWeight ?? FontWeight.w600,
                      fontSize: widget.fontSize ?? 15.sp,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Spacer(),
          if (widget.showFilter)
            GestureDetector(
              onTap: widget.onFilterTap,
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(),
                ),
                child: CircleAvatar(
                  backgroundColor: Colors.transparent,
                  child: Image.asset(
                    ImageConstants.filter_icon,
                    height: 20,
                    width: 20,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
