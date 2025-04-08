import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/colors.dart';
import '../../../utils/font.dart';
import 'new_offers_card.dart';

class NewOffersSection extends StatelessWidget {
  final VoidCallback? onViewAllTap;
  final Function(Map<String, dynamic>)? onPropertyTap;
  final Function(Map<String, dynamic>)? onFavoriteTap;

  const NewOffersSection({super.key, this.onViewAllTap, this.onPropertyTap, this.onFavoriteTap});

  // Hardcoded property data
  static final List<Map<String, dynamic>> _newOffers = [
    {'image': 'https://images.unsplash.com/photo-1570129477492-45c003edd2be', 'price': '1250', 'title': 'Apartment 3 rooms', 'rating': 4.9, 'reviews': 29, 'isFavorite': false},
    {'image': 'https://images.unsplash.com/photo-1600596542815-ffad4c1539a9', 'price': '950', 'title': 'House with garden', 'rating': 4.7, 'reviews': 18, 'isFavorite': true},
    {'image': 'https://images.unsplash.com/photo-1512917774080-9991f1c4c750', 'price': '1450', 'title': 'Modern villa', 'rating': 5.0, 'reviews': 42, 'isFavorite': false},
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        // Header row
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 26.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('New offers', style: kRoboto700(context, fontSize: 20.sp)),
              GestureDetector(onTap: onViewAllTap, child: Text('View all', style: kRoboto400(context, fontSize: 14.sp, color: kGreyColorText))),
            ],
          ),
        ),

        // List of property offers
        ListView.builder(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: _newOffers.length,
          itemBuilder: (context, index) {
            final property = _newOffers[index];
            return NewOfferCard(
              property: property,
              isFavorite: property['isFavorite'],
              onTap: onPropertyTap != null ? () => onPropertyTap!(property) : null,
              onFavoriteTap: onFavoriteTap != null ? () => onFavoriteTap!(property) : null,
            );
          },
        ),
      ],
    );
  }
}
