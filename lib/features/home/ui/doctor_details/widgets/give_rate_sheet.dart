import 'package:flutter/material.dart';
import 'package:flutter_complete_project/core/helpers/spacing.dart';
import 'package:flutter_complete_project/core/theming/colors.dart';
import 'package:flutter_complete_project/core/theming/styles.dart';
import 'package:flutter_complete_project/core/widgets/app_text_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class GiveRateSheet extends StatefulWidget {
  const GiveRateSheet({super.key});

  @override
  State<GiveRateSheet> createState() => _GiveRateSheetState();
}

class _GiveRateSheetState extends State<GiveRateSheet> {
  static const int _starsCount = 5;
  int _selectedRating = 0;
  final TextEditingController _reviewController = TextEditingController();

  @override
  void dispose() {
    _reviewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(24.r),
            topRight: Radius.circular(24.r),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            verticalSpace(12),
            Container(
              width: 58.w,
              height: 4.h,
              decoration: BoxDecoration(
                color: ColorsManager.lighterGrey,
                borderRadius: BorderRadius.circular(8.r),
              ),
            ),
            verticalSpace(16),
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: ColorsManager.lighterGrey),
                ),
              ),
              child: Text(
                'Give Rate',
                textAlign: TextAlign.center,
                style: TextStyles.font18SemiBold,
              ),
            ),
            verticalSpace(24),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(_starsCount, (index) {
                final bool isFilled = index < _selectedRating;
                return GestureDetector(
                  onTap: () => setState(() => _selectedRating = index + 1),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 4.w),
                    child: SvgPicture.asset(
                      'assets/svgs/star-rating.svg',
                      width: 40.r,
                      height: 40.r,
                      colorFilter: ColorFilter.mode(
                        isFilled
                            ? ColorsManager.warningYellow
                            : ColorsManager.inactiveGrey,
                        BlendMode.srcIn,
                      ),
                    ),
                  ),
                );
              }),
            ),
            verticalSpace(24),
            Text(
              'Share your feedback about the doctor',
              textAlign: TextAlign.center,
              style: TextStyles.font16MediumDarkBlue,
            ),
            verticalSpace(24),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: TextFormField(
                controller: _reviewController,
                maxLines: 3,
                style: TextStyles.font14RegularDarkBlue,
                decoration: InputDecoration(
                  hintText: 'Your review',
                  hintStyle: TextStyles.font12RegularMediumGrey,
                  filled: true,
                  fillColor: ColorsManager.surfaceGrey,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.r),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
            verticalSpace(24),
            Padding(
              padding: EdgeInsets.fromLTRB(24.w, 0, 24.w, 16.h),
              child: AppTextButton(
                buttonText: 'Done',
                textStyle: TextStyles.font16SemiBoldWhite,
                onPressed: () => Navigator.of(context).pop(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
