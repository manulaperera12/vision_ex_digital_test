import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vision_ex_digital_assignment_manula/utils/colors.dart';
import 'package:vision_ex_digital_assignment_manula/utils/font.dart';

class CustomHeader extends StatelessWidget {
  final String? userName;
  final String? avatarText;
  final bool hasNotification;
  final VoidCallback? onMenuTap;
  final VoidCallback? onAvatarTap;
  final VoidCallback? onSearchTap;
  final Color? backgroundColor;
  final bool isCategory3Screen;

  const CustomHeader({
    super.key,
    this.userName,
    this.avatarText,
    this.hasNotification = false,
    this.onMenuTap,
    this.onAvatarTap,
    this.onSearchTap,
    this.backgroundColor,
    this.isCategory3Screen = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
                    GestureDetector(
                      onTap: onMenuTap,
                      child: SvgPicture.asset(
                        'assets/svg/menu_home.svg',
                        width: 50.w,
                        height: 50.h,
                        colorFilter: const ColorFilter.mode(
                          kBlackColor,
                          BlendMode.srcIn,
                        ),
                      ),
                    ),

                    // User greeting and avatar
                    Row(
                      children: [
                        // Greeting text
                        Text(
                          'Hi, $userName',
                          style: kRoboto600(context, fontSize: 16.sp),
                        ),

                        SizedBox(width: 10.w),

                        GestureDetector(
                          onTap: onAvatarTap,
                          child: Stack(
                            children: [
                              CircleAvatar(
                                radius: 20.r,
                                backgroundColor: kGreyColor,
                                child: Text(
                                  avatarText ?? '',
                                  style: kRoboto600(context, fontSize: 16.sp, color: kBlackColor),
                                ),
                              ),
                              if (hasNotification)
                                Positioned(
                                  top: 0,
                                  right: 0,
                                  child: Container(
                                    width: 10.w,
                                    height: 10.h,
                                    decoration: BoxDecoration(
                                      color: kRedColor,
                                      shape: BoxShape.circle,
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),

              SizedBox(height: 16.h),

              // Search bar
              Row(
                children: [
                  Visibility(
                    visible: isCategory3Screen,
                    child: GestureDetector(
                      onTap: onMenuTap,
                      child: CircleAvatar(
                        radius: 24.r,
                        backgroundColor: kBlackColor,
                        child: SvgPicture.asset(
                          'assets/svg/menu_home.svg',
                          width: 50.w,
                          height: 50.h,
                          colorFilter: const ColorFilter.mode(
                            kWhiteColor,
                            BlendMode.srcIn,
                          ),
                        ),
                      ),
                    ),
                  ),

                  SizedBox(width: isCategory3Screen ? 11.w : 0), // Add spacing if menu icon is visible

                  // Expanded search bar
                  Expanded(
                    child: GestureDetector(
                      onTap: onSearchTap,
                      child: Container(
                        height: 50.h,
                        padding: EdgeInsets.symmetric(horizontal: 16.w),
                        decoration: BoxDecoration(
                          color: kWhiteColor,
                          borderRadius: BorderRadius.circular(24.r),
                        ),
                        child: Row(
                          children: [
                            SvgPicture.asset(
                              'assets/svg/search_icon.svg',
                              width: 24.w,
                              height: 24.h,
                            ),
                            SizedBox(width: 10.w),
                            Text(
                              'Search',
                              style: kRoboto600(context, fontSize: 16.sp, color: kGreyColorText),
                            ),
                          ],
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