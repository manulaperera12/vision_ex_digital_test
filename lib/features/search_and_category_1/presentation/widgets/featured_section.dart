import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vision_ex_digital_assignment_manula/features/search_and_category_1/presentation/widgets/property_card.dart';
import '../../../../utils/font.dart';
import '../../data/model/data_model.dart';

class FeaturedSection extends StatelessWidget {
  final VoidCallback? onViewAllTap;
  final Function(DataModel)? onPropertyTap;
  final List<DataModel> featuredProperties;

  const FeaturedSection({
    super.key,
    this.onViewAllTap,
    this.onPropertyTap,
    required this.featuredProperties,
  });

  // Hardcoded property data using a simple List of Maps
  static final List<Map<String, String>> _featuredProperties = [
    {
      'image': 'https://images.unsplash.com/photo-1512917774080-9991f1c4c750',
      'price': '580',
      'title': 'Rent 3 room',
      'subtitle': 'apartment in the center',
    },
    {
      'image': 'https://images.unsplash.com/photo-1570129477492-45c003edd2be',
      'price': '750',
      'title': 'Apartment',
      'subtitle': '4 rooms',
    },
    {
      'image': 'https://images.unsplash.com/photo-1600585154340-be6161a56a0c',
      'price': '680',
      'title': 'Apartment in city',
      'subtitle': 'center',
    },
  ];



  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Header row
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Featured',
                style: kRoboto700(context),
              ),
              GestureDetector(
                onTap: onViewAllTap,
                child: Text(
                  'View all',
                  style: kRoboto400(context),
                ),
              ),
            ],
          ),
        ),

        // Horizontal list of properties
        SizedBox(
          height: 225.h,
          child: ListView.builder(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            scrollDirection: Axis.horizontal,
            itemCount: featuredProperties.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.only(
                  right: index < featuredProperties.length - 1 ? 12.w : 0,
                ),
                child: PropertyCard(
                  property: featuredProperties[index],
                  onTap: onPropertyTap != null
                      ? () => onPropertyTap!(featuredProperties[index])
                      : null,
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}