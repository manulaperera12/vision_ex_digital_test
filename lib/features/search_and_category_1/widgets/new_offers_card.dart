
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vision_ex_digital_assignment_manula/utils/colors.dart';
import 'package:vision_ex_digital_assignment_manula/utils/font.dart';

class NewOfferCard extends StatelessWidget {
  final Map<String, dynamic> property;
  final VoidCallback? onTap;
  final VoidCallback? onFavoriteTap;
  final bool isFavorite;

  const NewOfferCard({
    super.key,
    required this.property,
    this.onTap,
    this.onFavoriteTap,
    this.isFavorite = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(bottom: 16.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.r),
          // color: kWhiteColor,
          boxShadow: [
            BoxShadow(
              color: kBlackColor.withOpacity(0.05),
              blurRadius: 10.r,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Stack(
              children: [
                // Image
                ClipRRect(
                  borderRadius: BorderRadius.circular(24.r),
                  child: Stack(
                    children: [
                      // Base image
                      Image.network(
                        property['image'],
                        height: 230.h,
                        width: double.infinity,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) => Container(
                          height: 230.h,
                          width: double.infinity,
                          color: kGreyColor.withOpacity(0.3),
                          child: Icon(Icons.image, size: 50.sp, color: kGreyColor),
                        ),
                      ),

                      // Combined overlay with rounded corners
                      Container(
                        height: 230.h,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(24.r),
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.black.withOpacity(0.1),
                              Colors.transparent,
                              Colors.transparent,
                              Colors.black.withOpacity(0.1),
                            ],
                            stops: const [0.0, 0.3, 0.7, 1.0],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                // Favorite button
                Positioned(
                  top: 20.h,
                  right: 20.w,
                  child: GestureDetector(
                    onTap: onFavoriteTap,
                    child: Icon(
                      isFavorite ? Icons.favorite : Icons.favorite_border,
                      color: isFavorite ? kRedColor : kWhiteColor,
                      size: 24.sp,
                    ),
                  ),
                ),

                // Price tag
                Positioned(
                  bottom: 16.h,
                  right: 16.w,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
                    decoration: BoxDecoration(
                      color: kWhiteColor,
                      borderRadius: BorderRadius.circular(16.r),
                      boxShadow: [
                        BoxShadow(
                          color: kBlackColor.withOpacity(0.1),
                          blurRadius: 4.r,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        Text(
                          '\$',
                          style: kRoboto600(context, fontSize: 12.sp),
                        ),
                        SizedBox(width: 2.w),
                        Text(
                          property['price'],
                          style: kRoboto600(context, fontSize: 12.sp),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),

            // Property info
            Padding(
              padding: EdgeInsets.only(top: 10.h, bottom: 8.h, left: 3.w, right: 3.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Title
                  Text(
                    property['title'],
                    style: kRoboto700(context, fontSize: 16.sp),
                  ),

                  // Rating
                  Row(
                    children: [
                      Icon(
                        Icons.star_border_rounded,
                        color: kButtonGreenColor,
                        size: 18.sp,
                      ),
                      SizedBox(width: 4.w),
                      Text(
                        property['rating'].toString(),
                        style: kRoboto700(context, fontSize: 14.sp),
                      ),
                      SizedBox(width: 4.w),
                      Text(
                        '(${property['reviews']} Reviews)',
                        style: kRoboto400(context, fontSize: 14.sp, color: kGreyColorText),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
