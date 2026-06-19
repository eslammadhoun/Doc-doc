import 'package:flutter/material.dart';
import 'package:flutter_complete_project/core/theming/colors.dart';
import 'package:flutter_complete_project/features/main/ui/widgets/nav_bar_item.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BottomNavBar extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onTabSelected;

  const BottomNavBar({
    super.key,
    required this.selectedIndex,
    required this.onTabSelected,
  });

  static const int searchTabIndex = 2;
  static const int profileTabIndex = 4;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 105.h,
      child: Stack(
        alignment: Alignment.bottomCenter,
        clipBehavior: Clip.none,
        children: [
          Container(
            height: 70.h,
            decoration: const BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Color(0x0D000000),
                  blurRadius: 15,
                  offset: Offset(0, -2),
                ),
              ],
            ),
            child: Row(
              children: [
                Expanded(
                  child: NavBarItem(
                    iconAsset: 'assets/svgs/home-2.svg',
                    isSelected: selectedIndex == 0,
                    onTap: () => onTabSelected(0),
                  ),
                ),
                Expanded(
                  child: NavBarItem(
                    iconAsset: 'assets/svgs/message-text.svg',
                    isSelected: selectedIndex == 1,
                    showBadge: true,
                    onTap: () => onTabSelected(1),
                  ),
                ),
                Expanded(child: SizedBox(width: 56.w)),
                Expanded(
                  child: NavBarItem(
                    iconAsset: 'assets/svgs/calendar-2-bold.svg',
                    isSelected: selectedIndex == 3,
                    onTap: () => onTabSelected(3),
                  ),
                ),
                Expanded(
                  child: _ProfileNavItem(
                    isSelected: selectedIndex == profileTabIndex,
                    onTap: () => onTabSelected(profileTabIndex),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 10.h,
            child: GestureDetector(
              onTap: () => onTabSelected(searchTabIndex),
              child: Container(
                width: 72.w,
                height: 72.h,
                decoration: BoxDecoration(
                  color: ColorsManager.mainBlue,
                  borderRadius: BorderRadius.circular(28.r),
                  border: BoxBorder.all(color: Colors.white, width: 7),
                ),
                child: Center(
                  child: SvgPicture.asset(
                    'assets/svgs/search-normal.svg',
                    width: 24.w,
                    height: 24.h,
                    colorFilter: const ColorFilter.mode(
                      Colors.white,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ProfileNavItem extends StatelessWidget {
  final bool isSelected;
  final VoidCallback onTap;

  const _ProfileNavItem({required this.isSelected, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Center(
        child: Container(
          width: 24.w,
          height: 24.h,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: ColorsManager.lighterGrey,
            border: isSelected
                ? Border.all(color: ColorsManager.mainBlue, width: 1.5)
                : null,
          ),
          child: Image.asset('assets/images/profile.png', fit: BoxFit.cover),
        ),
      ),
    );
  }
}
