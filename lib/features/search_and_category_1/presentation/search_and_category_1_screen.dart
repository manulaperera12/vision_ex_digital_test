import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vision_ex_digital_assignment_manula/core/reusable/custom_header.dart';
import 'package:vision_ex_digital_assignment_manula/features/search_and_category_1/presentation/bloc/data_bloc.dart';
import 'package:vision_ex_digital_assignment_manula/features/search_and_category_1/presentation/widgets/featured_section.dart';
import 'package:vision_ex_digital_assignment_manula/features/search_and_category_1/presentation/widgets/new_offers_section.dart';
import 'package:vision_ex_digital_assignment_manula/utils/colors.dart';

import '../../../injector.dart';
import '../../category_3/category_3_screen.dart';

class SearchAndCategory1ScreenWrapper extends StatelessWidget {
  const SearchAndCategory1ScreenWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<DataBloc>(
          create: (context) => sl<DataBloc>(),
        ),
      ],
      child: SearchAndCategory1Screen(),
    );
  }
}


class SearchAndCategory1Screen extends StatefulWidget {
  const SearchAndCategory1Screen({super.key});

  @override
  State<SearchAndCategory1Screen> createState() => _SearchAndCategory1ScreenState();
}

class _SearchAndCategory1ScreenState extends State<SearchAndCategory1Screen> with TickerProviderStateMixin {
  // Animation controllers
  late AnimationController _headerAnimationController;
  late Animation<Offset> _headerSlideAnimation;
  late AnimationController _offersAnimationController;
  late Animation<Offset> _offersSlideAnimation;

  @override
  void initState() {
    super.initState();

    context.read<DataBloc>().add(InitialDataEvent());

    // Initialize header animation controller
    _headerAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 4000),
    );

    // Create slide animation for header
    _headerSlideAnimation = Tween<Offset>(
      begin: const Offset(0, -1), // Start from above the screen
      end: Offset.zero,           // End at normal position
    ).animate(CurvedAnimation(
      parent: _headerAnimationController,
      curve: Curves.easeOutBack,
    ));

    // Initialize offers animation controller
    _offersAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 4000),
    );

    // Create slide animation for offers
    _offersSlideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.1), // Start from below the screen
      end: Offset.zero,           // End at normal position
    ).animate(CurvedAnimation(
      parent: _offersAnimationController,
      curve: Curves.easeOutBack,
    ));

    // Start the header animation after the first frame is built
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _headerAnimationController.forward();
      _offersAnimationController.forward(); // Start offers animation
    });
  }

  @override
  void dispose() {
    _headerAnimationController.dispose();
    _offersAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteColor,
      body: Column(
        children: [
          // Animated header
          SlideTransition(
            position: _headerSlideAnimation,
            child: CustomHeader(
              userName: 'Stanislav',
              avatarText: 'S',
              hasNotification: true,
              onMenuTap: () {
                debugPrint('Menu tapped');
              },
              onAvatarTap: () {
                debugPrint('Avatar tapped');
              },
              onSearchTap: () {
                debugPrint('Search bar tapped');
              },
              backgroundColor: kYellowColor,
            ),
          ),

          Expanded(
            child: SingleChildScrollView(
              child: SlideTransition(
                position: _offersSlideAnimation,
                child: Column(
                  children: [
                    SizedBox(height: 4.h),

                    // Featured section
                    FeaturedSection(
                      onViewAllTap: () {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) => const Category3Screen(),
                        ));
                      },
                      onPropertyTap: (property) {
                        debugPrint('Property tapped: ${property['title']}');
                      },
                    ),

                    SizedBox(height: 8.h),

                    // Animated New Offers Section
                    NewOffersSection(
                      onViewAllTap: () {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) => const Category3Screen(),
                        ));
                      },
                      onPropertyTap: (property) {
                        debugPrint('Property tapped: ${property['title']}');
                      },
                      onFavoriteTap: (property) {
                        debugPrint('Favorite toggled for: ${property['title']}');
                      },
                    ),

                    SizedBox(height: 24.h),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}