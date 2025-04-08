import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vision_ex_digital_assignment_manula/utils/colors.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final Color backgroundColor;
  final Color textColor;
  final double height;
  final double borderRadius;
  final double fontSize;
  final bool fullWidth;
  final EdgeInsetsGeometry? padding;

  const CustomButton({
    super.key,
    required this.text,
    this.onPressed,
    this.backgroundColor = kButtonGreenColor,
    this.textColor = kWhiteColor,
    this.height = 50,
    this.borderRadius = 24,
    this.fontSize = 16,
    this.fullWidth = true,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: fullWidth ? double.infinity : null,
      height: height.h,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          foregroundColor: textColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius.r),
          ),
          padding: padding,
          elevation: 0,
        ),
        child: Text(
          text,
          style: TextStyle(
            fontSize: fontSize.sp,
          ),
        ),
      ),
    );
  }
}