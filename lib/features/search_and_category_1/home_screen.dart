import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vision_ex_digital_assignment_manula/features/search_and_category_1/widgets/custom_header.dart';
import 'package:vision_ex_digital_assignment_manula/features/search_and_category_1/widgets/featured_section.dart';
import 'package:vision_ex_digital_assignment_manula/features/search_and_category_1/widgets/new_offers_card.dart';
import 'package:vision_ex_digital_assignment_manula/features/search_and_category_1/widgets/new_offers_section.dart';
import 'package:vision_ex_digital_assignment_manula/utils/colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {
  // Animation controller
  late AnimationController _animationController;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();

    // Initialize animation controller
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2000),
    );

    // Create slide animation
    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, -1), // Start from above the screen
      end: Offset.zero,           // End at normal position
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeOutBack, // Use a bouncy curve for better effect
    ));

    // Start the animation after the first frame is built
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _animationController.forward();
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
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
            position: _slideAnimation,
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
            ),
          ),

          // Content area - needs to be in Expanded
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 4.h),

                  // Featured section
                  FeaturedSection(
                    onViewAllTap: () {
                      debugPrint('View all featured properties tapped');
                    },
                    onPropertyTap: (property) {
                      debugPrint('Property tapped: ${property['title']}');
                    },
                  ),

                  SizedBox(height: 8.h),

                  // New offers section
                  NewOffersSection(
                    onViewAllTap: () {
                      debugPrint('View all offers tapped');
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
        ],
      ),
    );
  }
}