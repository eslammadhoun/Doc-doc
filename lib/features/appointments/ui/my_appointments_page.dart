import 'package:flutter/material.dart';
import 'package:flutter_complete_project/core/helpers/spacing.dart';
import 'package:flutter_complete_project/core/theming/colors.dart';
import 'package:flutter_complete_project/core/theming/styles.dart';
import 'package:flutter_complete_project/features/appointments/ui/widgets/upcoming_appointments.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MyAppointmentsPage extends StatefulWidget {
  const MyAppointmentsPage({super.key});

  @override
  State<MyAppointmentsPage> createState() => _MyAppointmentsPageState();
}

class _MyAppointmentsPageState extends State<MyAppointmentsPage>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          _buildNavbar(),
          verticalSpace(16),
          TabBar(
            controller: _tabController,
            labelStyle: TextStyles.font14BoldBlue,
            labelColor: ColorsManager.mainBlue,
            unselectedLabelStyle: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w700,
              color: ColorsManager.mediumGrey,
            ),
            unselectedLabelColor: ColorsManager.mediumGrey,
            indicatorColor: ColorsManager.mainBlue,
            indicatorWeight: 2,
            dividerColor: ColorsManager.lighterGrey,
            dividerHeight: 2,
            padding: EdgeInsets.symmetric(horizontal: 8.w),
            tabs: const [
              Tab(text: 'Upcoming'),
              Tab(text: 'Completed'),
              Tab(text: 'Cancelled'),
            ],
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                UpcomingAppointments(),
                _buildEmptyTab('No completed appointments'),
                _buildEmptyTab('No cancelled appointments'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNavbar() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildNavButton(
            child: Icon(
              Icons.chevron_left,
              size: 24.w,
              color: ColorsManager.darkBlue,
            ),
            onTap: () => Navigator.maybePop(context),
          ),
          Text('My Appointment', style: TextStyles.font18SemiBold),
          _buildNavButton(
            child: SvgPicture.asset(
              'assets/svgs/search-normal.svg',
              width: 24.w,
              height: 24.w,
              color: ColorsManager.darkBlue,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNavButton({required Widget child, VoidCallback? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 40.w,
        height: 40.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          border: Border.all(color: ColorsManager.lighterGrey),
        ),
        child: Center(child: child),
      ),
    );
  }

  Widget _buildEmptyTab(String message) {
    return Center(child: Text(message, style: TextStyles.font14BoldMediumGrey));
  }
}
