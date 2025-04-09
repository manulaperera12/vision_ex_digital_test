import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
import 'package:vision_ex_digital_assignment_manula/utils/colors.dart';

import '../../../../utils/font.dart';

class NewOffersSectionShimmer extends StatelessWidget {
  final bool isCategory3Screen;
  final int itemCount;

  const NewOffersSectionShimmer({
    super.key,
    this.isCategory3Screen = false,
    this.itemCount = 3,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        // Header row
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: !isCategory3Screen ? 26.h : 20.h),
          child: Row(
            mainAxisAlignment: !isCategory3Screen ? MainAxisAlignment.spaceBetween : MainAxisAlignment.center,
            children: [
              Text(!isCategory3Screen ? 'New offers' : "Popular Rent Offers", style: kRoboto700(context, fontSize: 20.sp)),
              Visibility(visible: !isCategory3Screen, child: GestureDetector(onTap: () {}, child: Text('View all', style: kRoboto400(context, fontSize: 14.sp, color: kGreyColorText)))),
            ],
          ),
        ),

        // List of property offer shimmers
        ListView.builder(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: itemCount,
          itemBuilder: (context, index) {
            return NewOfferCardShimmer(
              isCategory3Screen: isCategory3Screen,
            );
          },
        ),
      ],
    );
  }
}

class NewOfferCardShimmer extends StatelessWidget {
  final bool isCategory3Screen;

  const NewOfferCardShimmer({
    super.key,
    this.isCategory3Screen = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: [BoxShadow(color: kBlackColor.withOpacity(0.05), blurRadius: 10.r, offset: const Offset(0, 3))],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Stack(
            children: [
              // Image placeholder
              Shimmer.fromColors(
                baseColor: Colors.grey[300]!,
                highlightColor: Colors.grey[100]!,
                child: Container(
                  height: 230.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(24.r),
                  ),
                ),
              ),

              // Price tags shimmer for bottom of image
              Positioned(
                bottom: 16.h,
                right: !isCategory3Screen ? 16.w : null,
                left: isCategory3Screen ? 16.w : null,
                child: Row(
                  children: [
                    // Price/Beds tag shimmer
                    Shimmer.fromColors(
                      baseColor: Colors.grey[300]!,
                      highlightColor: Colors.grey[100]!,
                      child: Container(
                        width: 80.w,
                        height: 28.h,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16.r),
                        ),
                      ),
                    ),

                    // Bathrooms tag shimmer (only for category3)
                    if (isCategory3Screen)
                      Padding(
                        padding: EdgeInsets.only(left: 5.0.w),
                        child: Shimmer.fromColors(
                          baseColor: Colors.grey[300]!,
                          highlightColor: Colors.grey[100]!,
                          child: Container(
                            width: 110.w,
                            height: 28.h,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(16.r),
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ),

              // Favorite button shimmer
              Positioned(
                top: 20.h,
                right: 20.w,
                child: Shimmer.fromColors(
                  baseColor: Colors.grey[300]!,
                  highlightColor: Colors.grey[100]!,
                  child: Container(
                    width: 24.w,
                    height: 24.h,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ),
            ],
          ),

          // Property info shimmer
          Padding(
            padding: EdgeInsets.only(top: 10.h, bottom: 8.h, left: 3.w, right: 3.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Title and location shimmer
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Shimmer.fromColors(
                      baseColor: Colors.grey[300]!,
                      highlightColor: Colors.grey[100]!,
                      child: Container(
                        width: 150.w,
                        height: 16.h,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(4.r),
                        ),
                      ),
                    ),

                    // Location shimmer (only for category3)
                    if (isCategory3Screen)
                      Padding(
                        padding: EdgeInsets.only(top: 4.h),
                        child: Shimmer.fromColors(
                          baseColor: Colors.grey[300]!,
                          highlightColor: Colors.grey[100]!,
                          child: Container(
                            width: 120.w,
                            height: 12.h,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(4.r),
                            ),
                          ),
                        ),
                      ),
                  ],
                ),

                // Rating or price shimmer
                Shimmer.fromColors(
                  baseColor: Colors.grey[300]!,
                  highlightColor: Colors.grey[100]!,
                  child: !isCategory3Screen
                      ? Row(
                    children: [
                      Container(
                        width: 18.w,
                        height: 18.h,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                      ),
                      SizedBox(width: 4.w),
                      Container(
                        width: 20.w,
                        height: 14.h,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(4.r),
                        ),
                      ),
                      SizedBox(width: 4.w),
                      Container(
                        width: 80.w,
                        height: 14.h,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(4.r),
                        ),
                      ),
                    ],
                  )
                      : Container(
                    width: 80.w,
                    height: 22.h,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(4.r),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}