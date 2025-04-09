import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
import 'package:vision_ex_digital_assignment_manula/features/search_and_category_1/data/model/data_model.dart';
import '../../../../utils/colors.dart';
import '../../../../utils/font.dart';

class PropertyCard extends StatelessWidget {
  final DataModel property;
  final VoidCallback? onTap;
  final bool isLoading;

  const PropertyCard({
    super.key,
    required this.property,
    this.onTap,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    debugPrint("#3213 isLoading: $isLoading");

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 150.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24.r),
          // color: kWhiteColor,
          // boxShadow: [
          //   BoxShadow(
          //     color: kBlackColor.withOpacity(0.05),
          //     blurRadius: 10,
          //     offset: const Offset(0, 3),
          //   ),
          // ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // Property image with price badge
            Stack(
              children: [
                // Image
                ClipRRect(
                  borderRadius: BorderRadius.circular(24.r),
                  child: CachedNetworkImage(
                    imageUrl: property.image,
                    height: 150.h,
                    width: 150.w,
                    fit: BoxFit.cover,
                    placeholder: (context, url) => Shimmer.fromColors(
                      baseColor: kBaseColor,
                      highlightColor: kHighlightColor,
                      child: Container(
                        height: 150.h,
                        width: 150.w,
                        color: kWhiteColor,
                      ),
                    ),
                    errorWidget: (context, url, error) => Container(
                      height: 140.h,
                      width: 170.w,
                      color: kGreyColor.withOpacity(0.3),
                      child: Icon(Icons.image, size: 50.sp, color: kGreyColor),
                    ),
                  ),
                ),

                // Price badge
                Positioned(
                  bottom: 8.h,
                  right: 8.w,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 3.h),
                    decoration: BoxDecoration(
                      color: kWhiteColor,
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    child: Row(
                      children: [
                        Text(
                          "\$ ${property.price}",
                          style: kRoboto700(context, fontSize: 12.sp),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),

            // Property info
            Padding(
              padding: EdgeInsets.only(top: 12.h, left: 3.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,

                children: [
                  Text(
                    property.title,
                    style: kRoboto600(context, fontSize: 14.sp),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    property.location,
                    style: kRoboto600(context, fontSize: 14.sp),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
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