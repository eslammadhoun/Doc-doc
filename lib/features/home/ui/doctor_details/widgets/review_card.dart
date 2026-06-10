import 'package:flutter/material.dart';
import 'package:flutter_complete_project/core/helpers/spacing.dart';
import 'package:flutter_complete_project/core/theming/styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ReviewCard extends StatelessWidget {
  final String reviewerName;
  final String date;
  final int rating;
  final String comment;
  final String avatarAsset;

  const ReviewCard({
    super.key,
    required this.reviewerName,
    required this.date,
    required this.rating,
    required this.comment,
    required this.avatarAsset,
  });

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20.r),
            child: Image.asset(avatarAsset, width: 40.r, height: 40.r),
          ),
          horizontalSpace(10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      reviewerName,
                      style: TextStyles.font16SemiBoldDarkBlue,
                    ),
                    Text(date, style: TextStyles.font12RegularMediumGrey),
                  ],
                ),
                verticalSpace(8),
                Row(
                  children: List.generate(
                    rating,
                    (index) => Padding(
                      padding: EdgeInsets.only(right: 5.w),
                      child: SvgPicture.asset(
                        'assets/svgs/magic-star.svg',
                        width: 20.r,
                        height: 20.r,
                      ),
                    ),
                  ),
                ),
                verticalSpace(8),
                Text(comment, style: TextStyles.font12RegularGrey),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
