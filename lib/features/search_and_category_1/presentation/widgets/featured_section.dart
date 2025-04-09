import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vision_ex_digital_assignment_manula/features/search_and_category_1/presentation/widgets/property_card.dart';
import '../../../../utils/font.dart';
import '../../data/model/data_model.dart';

class FeaturedSection extends StatelessWidget {
  final VoidCallback? onViewAllTap;
  final Function(DataModel)? onPropertyTap;
  final List<DataModel> featuredProperties;
  final bool isLoading;

  const FeaturedSection({
    super.key,
    this.onViewAllTap,
    this.onPropertyTap,
    required this.featuredProperties,
    this.isLoading = false,
  });


  @override
  Widget build(BuildContext context) {
    debugPrint("#3213 isLoading FeaturedSection: $isLoading");
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
                  isLoading: isLoading,
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}