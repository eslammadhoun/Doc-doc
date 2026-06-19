import 'package:flutter/material.dart';
import 'package:flutter_complete_project/core/theming/colors.dart';
import 'package:flutter_complete_project/core/theming/styles.dart';
import 'package:flutter_complete_project/features/inbox/ui/new_message/new_message_screen.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class InboxNavbar extends StatelessWidget {
  const InboxNavbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _NavButton(
          onTap: () => Navigator.maybePop(context),
          child: SvgPicture.asset(
            'assets/svgs/Chevron-left.svg',
            width: 24.w,
            height: 24.h,
          ),
        ),
        Text('Message', style: TextStyles.font18SemiBold),
        _NavButton(
          onTap: () => showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            backgroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(top: Radius.circular(24.r)),
            ),
            builder: (_) => const NewMessageSheet(),
          ),
          child: SvgPicture.asset('assets/svgs/message-add.svg'),
        ),
      ],
    );
  }
}

class _NavButton extends StatelessWidget {
  final Widget child;
  final VoidCallback? onTap;

  const _NavButton({required this.child, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 40.w,
        height: 40.h,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: ColorsManager.lighterGrey),
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Center(child: child),
      ),
    );
  }
}
