import 'package:flutter/material.dart';
import 'package:yunicorn_empulse/core/constants/color_contants.dart';

class CommonElevatedButton extends StatelessWidget {
  final String buttonText;
  final Function() onClick;
  const CommonElevatedButton({
    super.key,
    required this.buttonText,
    required this.onClick,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 60,
      child: ElevatedButton(

        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.circular(12)),
          backgroundColor: ColorContants.common_elevated_button_color,
          foregroundColor: ColorContants.text_grey_white, 
        ),
        onPressed: onClick,
        child: Text(buttonText),
      ),
    );
  }
}
