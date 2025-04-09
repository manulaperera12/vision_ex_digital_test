import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vision_ex_digital_assignment_manula/core/reusable/custom_header.dart';
import 'package:vision_ex_digital_assignment_manula/utils/colors.dart';

import '../../utils/font.dart';
import '../search_and_category_1/data/model/data_model.dart';
import '../search_and_category_1/presentation/widgets/new_offers_section.dart';

class Category3Screen extends StatefulWidget {
  final List<DataModel> offerProperties;

  const Category3Screen({super.key, required this.offerProperties});

  @override
  State<Category3Screen> createState() => _Category3ScreenState();
}

class _Category3ScreenState extends State<Category3Screen> with TickerProviderStateMixin {
  // Animation controllers
  late AnimationController _headerAnimationController;
  late Animation<Offset> _headerSlideAnimation;
  late AnimationController _offersAnimationController;
  late Animation<Offset> _offersSlideAnimation;

  @override
  void initState() {
    super.initState();

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
              onMenuTap: () {
                debugPrint('Menu tapped');
              },
              onSearchTap: () {
                debugPrint('Search bar tapped');
              },
              isCategory3Screen: true,
            ),
          ),

          Expanded(
            child: SingleChildScrollView(
              child: SlideTransition(
                position: _offersSlideAnimation,
                child: Column(
                  children: [
                    // Animated New Offers Section
                    NewOffersSection(
                      onViewAllTap: () {
                        debugPrint('View all offers tapped');
                      },
                      onPropertyTap: (property) {
                        debugPrint('Property tapped: ${property.title}');
                      },
                      onFavoriteTap: (property) {
                        debugPrint('Favorite toggled for: ${property.title}');
                      },
                      isCategory3Screen: true,
                      newOffers: widget.offerProperties,
                      popularRentOffers: widget.offerProperties,
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