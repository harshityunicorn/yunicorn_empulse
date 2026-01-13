import 'package:flutter/material.dart';
import 'package:yunicorn_empulse/core/constants/color_contants.dart';
import 'package:yunicorn_empulse/core/constants/image_constants.dart';

class InputField extends StatelessWidget {
  const InputField({
    super.key,
    this.hintText,
    this.prefixImage,
    this.obsecureText = false,
    this.isPasswordField = false,
    this.textEditingController,
  });

  final String? prefixImage;
  final String? hintText;
  final TextEditingController? textEditingController;
  final bool obsecureText;
  final bool isPasswordField;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      padding: EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        border: Border.all(
          style: BorderStyle.solid,
          color: ColorContants.input_background,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        spacing: 8,
        children: [
          Image.asset(
            prefixImage ?? ImageConstants.mail_icon_image,
            height: 20,
            // width: 25,
            fit: BoxFit.fitHeight,
          ),
          Expanded(
            child: TextFormField(
              controller: textEditingController,
              obscureText: obsecureText,
              decoration: InputDecoration(
                hintText: hintText ?? '',
                hintStyle: TextStyle(fontSize: 20),
                border: InputBorder.none,
              ),
            ),
          ),
          if (isPasswordField)
            Image.asset(
              ImageConstants.password_eye,
              height: 20,
              // width: 25,
              fit: BoxFit.fitHeight,
            ),
        ],
      ),
    );
  }
}
