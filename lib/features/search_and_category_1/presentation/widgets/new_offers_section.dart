import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/reusable/new_offers_card.dart';
import '../../../../utils/colors.dart';
import '../../../../utils/font.dart';
import '../../data/model/data_model.dart';

class NewOffersSection extends StatelessWidget {
  final VoidCallback? onViewAllTap;
  final Function(DataModel)? onPropertyTap;
  final Function(DataModel)? onFavoriteTap;
  final bool isCategory3Screen;
  final List<DataModel> newOffers;
  final List<DataModel> popularRentOffers;

  const NewOffersSection({super.key, this.onViewAllTap, this.onPropertyTap, this.onFavoriteTap, this.isCategory3Screen = false, required this.newOffers, required this.popularRentOffers});

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
              Text(!isCategory3Screen ? 'New offers' : "Popular rent offers", style: kRoboto700(context, fontSize: 20.sp)),
              Visibility(visible: !isCategory3Screen, child: GestureDetector(onTap: onViewAllTap, child: Text('View all', style: kRoboto400(context, fontSize: 12.sp, color: kGreyColorText)))),
            ],
          ),
        ),

        // List of property offers
        ListView.builder(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: !isCategory3Screen ? newOffers.length : popularRentOffers.length,
          itemBuilder: (context, index) {
            final property = newOffers[index];
            final popularRentOffersProperty = popularRentOffers[index];
            return NewOfferCard(
              property: !isCategory3Screen ? property : popularRentOffersProperty,
              // isFavorite: !isCategory3Screen ? property['isFavorite'] : popularRentOffersProperty['isFavorite'],
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
