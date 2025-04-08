import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'colors.dart';

TextStyle kRoboto400(BuildContext context, {Color color = kGreyColorText, double? fontSize, double? height}) {
  return TextStyle(
    fontFamily: 'Roboto',
    fontSize: fontSize ?? 12.sp,
    fontWeight: FontWeight.w400,
    fontStyle: FontStyle.normal,
    color: color,
  );
}

TextStyle kRoboto600(BuildContext context, {Color color = kBlackColor, double? fontSize, double? height}) {
  return TextStyle(
    fontFamily: 'Roboto',
    fontSize: fontSize ?? 14.sp,
    fontWeight: FontWeight.w600,
    fontStyle: FontStyle.normal,
    color: color,
  );
}

TextStyle kRoboto700(BuildContext context, {Color color = kBlackColor, double? fontSize, double? height}) {
  return TextStyle(
    fontFamily: 'Roboto',
    fontSize: fontSize ?? 18.sp,
    fontWeight: FontWeight.w700,
    fontStyle: FontStyle.normal,
    color: color,
  );
}