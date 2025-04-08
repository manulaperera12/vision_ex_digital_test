import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vision_ex_digital_assignment_manula/features/welcome/widgets/options_container.dart';
import 'package:vision_ex_digital_assignment_manula/utils/colors.dart';
import 'package:vision_ex_digital_assignment_manula/utils/font.dart';

import '../../core/reusable/custom_button.dart';
import '../../core/reusable/typing_text.dart';
import '../search_and_category_1/search_and_category_1_screen.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  final List<Map<String, dynamic>> optionsList = [
    {'label': 'Rent', 'icon': "assets/svg/rent_icon.svg", 'color': kCreamColor},
    {'label': 'Buy', 'icon': "assets/svg/buy_icon_new.svg", 'color': kYellowColor},
    {'label': 'Sell', 'icon': "assets/svg/sell_new.svg", 'color': kGreenColor},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage('assets/images/welcome.png'), fit: BoxFit.cover, colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.74), BlendMode.darken)),
            ),
          ),

          // Content
          SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 20.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // App Bar
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.0.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SvgPicture.asset('assets/svg/homzes_logo.svg', width: 96.w, height: 21.h),

                        GestureDetector(
                          onTap: () {
                            debugPrint('#32432 menu icon tapped');
                          },
                          child: SvgPicture.asset('assets/svg/menu_icon.svg', width: 50.w, height: 50.h),
                        ),
                      ],
                    ),
                  ),

                  Spacer(),

                  // Middle section with text
                  Expanded(
                    child: Center(
                      child: Padding(padding: EdgeInsets.all(24.0.w),
                          // child: Text(
                          //     'Find the best\nplace for you',
                          //     style: kRoboto700(context, fontSize: 36.sp, color: kWhiteColor),
                          //     textAlign: TextAlign.center,
                          // ),
                        child: TypewriterText(
                          text: 'Find the best\nplace for you',
                          style: kRoboto700(context, fontSize: 36.sp, color: kWhiteColor),
                          textAlign: TextAlign.center,
                          typingSpeed: Duration(milliseconds: 80),
                          fadeDuration: Duration(milliseconds: 500),
                          pauseBetweenLoops: Duration(seconds: 3),
                          delayBeforeStart: Duration(milliseconds: 500),
                        ),
                      ),
                    ),
                  ),

                  // Bottom Section with options
                  Column(
                    children: [
                      // Option buttons
                      Padding(
                        padding: EdgeInsets.only(left: 20.0.w),
                        child: SizedBox(
                          height: 172.h,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: optionsList.length,
                            itemBuilder: (context, index) {
                              final option = optionsList[index];
                              return Padding(
                                padding: EdgeInsets.only(right: index < optionsList.length - 1 ? 12.w : 20.w),
                                child: OptionsContainer(
                                  color: option['color'],
                                  icon: option['icon'],
                                  label: option['label'],
                                  onTap: () {
                                    debugPrint('#32432 option: ${option['label']} tapped');
                                  },
                                ),
                              );
                            },
                          ),
                        ),
                      ),

                      SizedBox(height: 20.h),

                      // Create account button
                      Padding(padding: EdgeInsets.symmetric(horizontal: 20.0.w), child: CustomButton(text: 'Create an account', onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => SearchAndCategory1Screen(),));
                      })),

                      SizedBox(height: 10.h),

                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
