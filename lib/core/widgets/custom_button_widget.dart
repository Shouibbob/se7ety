import 'package:flutter/material.dart';
import 'package:se7ety/core/utils/colors.dart';
import 'package:se7ety/core/utils/text_style.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key,
      this.borderRadius = 12,
      this.height = 50,
      this.width = double.infinity,
      this.color = AppColors.primaryColor,
      this.textStyle,
      this.isOutline = false,
      required this.text,
      required this.onPressed});
  final TextStyle? textStyle;
  final double height;
  final double width;
  final String text;
  final Color color;
  final double borderRadius;
  final Function() onPressed;
  final bool isOutline;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: width,
        height: height,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: isOutline ? AppColors.whiteColor : color,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius),
              side: isOutline
                  ? const BorderSide(color: AppColors.textColor)
                  : BorderSide.none,
            ),
          ),
          onPressed: onPressed,
          child: Text(
            text,
            style: textStyle ??
                getBodyStyle(
                  
                  color: isOutline ? AppColors.textColor : AppColors.whiteColor,
                ),
          ),
        ));
  }
}
