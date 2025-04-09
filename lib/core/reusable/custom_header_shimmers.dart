import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
import 'package:vision_ex_digital_assignment_manula/utils/colors.dart';

class CustomHeaderShimmer extends StatelessWidget {
  final bool isCategory3Screen;

  const CustomHeaderShimmer({
    super.key,
    this.isCategory3Screen = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: isCategory3Screen ? 150.h : 200.h,
      decoration: BoxDecoration(
        color: isCategory3Screen ? kGreenColor : kYellowColor,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(35.r),
          bottomRight: Radius.circular(35.r),
        ),
        boxShadow: [
          BoxShadow(
            color: kBlackColor.withOpacity(0.05),
            blurRadius: 35.r,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: SafeArea(
        bottom: false,
        child: Padding(
          padding: EdgeInsets.fromLTRB(16.w, 16.h, 16.w, 23.h),
          child: Column(
            children: [
              Visibility(
                visible: !isCategory3Screen,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Menu icon shimmer
                    Shimmer.fromColors(
                      baseColor: kBaseColor,
                      highlightColor: kHighlightColor,
                      child: Container(
                        width: 50.w,
                        height: 50.h,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                      ),
                    ),

                    // User greeting and avatar shimmer
                    Row(
                      children: [
                        // Greeting text shimmer
                        Shimmer.fromColors(
                          baseColor: Colors.grey[300]!,
                          highlightColor: Colors.grey[100]!,
                          child: Container(
                            width: 80.w,
                            height: 20.h,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10.r),
                            ),
                          ),
                        ),

                        SizedBox(width: 10.w),

                        // Avatar shimmer
                        Shimmer.fromColors(
                          baseColor: Colors.grey[300]!,
                          highlightColor: Colors.grey[100]!,
                          child: CircleAvatar(
                            radius: 20.r,
                            backgroundColor: Colors.white,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),

              SizedBox(height: 16.h),

              // Search bar shimmer
              Row(
                children: [
                  // Menu icon for category3 screen
                  Visibility(
                    visible: isCategory3Screen,
                    child: Shimmer.fromColors(
                      baseColor: Colors.grey[300]!,
                      highlightColor: Colors.grey[100]!,
                      child: CircleAvatar(
                        radius: 24.r,
                        backgroundColor: Colors.white,
                      ),
                    ),
                  ),

                  SizedBox(width: isCategory3Screen ? 11.w : 0),

                  // Expanded search bar shimmer
                  Expanded(
                    child: Shimmer.fromColors(
                      baseColor: Colors.grey[300]!,
                      highlightColor: Colors.grey[100]!,
                      child: Container(
                        height: 50.h,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(24.r),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}