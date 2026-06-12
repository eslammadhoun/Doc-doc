import 'package:flutter/material.dart';
import 'package:flutter_complete_project/core/helpers/spacing.dart';
import 'package:flutter_complete_project/core/theming/styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BookingInfoTile extends StatelessWidget {
  final String iconAsset;
  final Color iconBackgroundColor;
  final String title;
  final List<String> lines;

  const BookingInfoTile({
    super.key,
    required this.iconAsset,
    required this.iconBackgroundColor,
    required this.title,
    required this.lines,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 40.r,
          height: 40.r,
          decoration: BoxDecoration(
            color: iconBackgroundColor,
            borderRadius: BorderRadius.circular(12.r),
          ),
          alignment: Alignment.center,
          child: SvgPicture.asset(iconAsset, width: 20.r, height: 20.r),
        ),
        horizontalSpace(12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: TextStyles.font14SemiBoldDarkBlue),
              verticalSpace(4),
              ...lines.map(
                (line) => Padding(
                  padding: EdgeInsets.only(top: 2.h),
                  child: Text(line, style: TextStyles.font12RegularGrey),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
