import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vision_ex_digital_assignment_manula/utils/colors.dart';
import 'package:vision_ex_digital_assignment_manula/utils/font.dart';

class OptionsContainer extends StatelessWidget {
  final Color color;
  final String icon;
  final String label;
  final VoidCallback? onTap;

  const OptionsContainer({
    super.key,
    required this.color,
    required this.icon,
    required this.label,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 145.w,
        height: 192.h,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(24.r),
        ),
        child: Padding(
          padding: EdgeInsets.all(20.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: 30.0.h),
                child: Container(
                  padding: EdgeInsets.all(15.w),
                  decoration: const BoxDecoration(
                    color: kWhiteColor,
                    shape: BoxShape.circle,
                  ),
                  // child: Icon(icon, size: 23.sp),
                  child: SvgPicture.asset(
                    icon,
                    width: 23.w,
                    height: 23.h,
                    colorFilter: const ColorFilter.mode(
                      kBlackColor,
                      BlendMode.srcIn,
                    )
                  ),
                ),
              ),
              SizedBox(
                height: 12.h,
              ),
              Text(
                label,
                style: kRoboto700(context),
              ),
            ],
          ),
        ),
      ),
    );
  }
}