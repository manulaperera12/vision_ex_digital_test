import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/reusable/new_offers_card.dart';
import '../../../../utils/colors.dart';
import '../../../../utils/font.dart';

class NewOffersSection extends StatelessWidget {
  final VoidCallback? onViewAllTap;
  final Function(Map<String, dynamic>)? onPropertyTap;
  final Function(Map<String, dynamic>)? onFavoriteTap;
  final bool isCategory3Screen;

  const NewOffersSection({super.key, this.onViewAllTap, this.onPropertyTap, this.onFavoriteTap, this.isCategory3Screen = false});

  // Hardcoded property data
  static final List<Map<String, dynamic>> _newOffers = [
    {'image': 'https://images.unsplash.com/photo-1570129477492-45c003edd2be', 'price': '1250', 'title': 'Apartment 3 rooms', 'rating': 4.9, 'reviews': 29, 'isFavorite': false},
    {'image': 'https://images.unsplash.com/photo-1600596542815-ffad4c1539a9', 'price': '950', 'title': 'House with garden', 'rating': 4.7, 'reviews': 18, 'isFavorite': true},
    {'image': 'https://images.unsplash.com/photo-1512917774080-9991f1c4c750', 'price': '1450', 'title': 'Modern villa', 'rating': 5.0, 'reviews': 42, 'isFavorite': false},
  ];

  static final List<Map<String, dynamic>> _popularRentOffers = [
    {'image': 'https://images.unsplash.com/photo-1570129477492-45c003edd2be', 'bedRooms': '3', 'bathrooms': '3', 'title': 'Apartment 7 rooms', 'price': '950', 'isFavorite': false, 'address': 'Russia, Moscow'},
    {'image': 'https://images.unsplash.com/photo-1600596542815-ffad4c1539a9', 'bedRooms': '3', 'bathrooms': '6', 'price': '950', 'title': 'House with garden', 'isFavorite': true, 'address': 'Russia, Moscow'},
    {'image': 'https://images.unsplash.com/photo-1512917774080-9991f1c4c750', 'bedRooms': '3', 'bathrooms': '7', 'price': '1450', 'title': 'Modern villa', 'isFavorite': false, 'address': 'Russia, Moscow'},
  ];

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
              Visibility(visible: !isCategory3Screen,child: GestureDetector(onTap: onViewAllTap, child: Text('View all', style: kRoboto400(context, fontSize: 14.sp, color: kGreyColorText)))),
            ],
          ),
        ),

        // List of property offers
        ListView.builder(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: !isCategory3Screen ? _newOffers.length : _popularRentOffers.length,
          itemBuilder: (context, index) {
            final property = _newOffers[index];
            final popularRentOffersProperty = _popularRentOffers[index];
            return NewOfferCard(
              property: !isCategory3Screen ? property : popularRentOffersProperty,
              isFavorite: !isCategory3Screen ? property['isFavorite'] : popularRentOffersProperty['isFavorite'],
              onTap: onPropertyTap != null ? () => onPropertyTap!(property) : null,
              onFavoriteTap: onFavoriteTap != null ? () => onFavoriteTap!(property) : null,
              isCategory3Screen: isCategory3Screen,
            );
          },
        ),
      ],
    );
  }
}
