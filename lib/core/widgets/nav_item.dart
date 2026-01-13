import 'package:flutter/material.dart';
import 'package:yunicorn_empulse/core/constants/color_contants.dart';

class NavItem extends StatelessWidget {
  const NavItem({
    super.key,
    required this.backGroundImage,
    required this.isSelected,
  });
  final String backGroundImage;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      backGroundImage,
      height: 20,
      color: !isSelected ? ColorContants.sub_heading_grey : null,
    );
  }
}
