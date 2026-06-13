import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_complete_project/core/di/dependancy_injection.dart';
import 'package:flutter_complete_project/features/home/data/repos/home_repo.dart';
import 'package:flutter_complete_project/features/home/ui/home/home_page.dart';
import 'package:flutter_complete_project/features/home/ui/home/logic/home_cubit.dart';
import 'package:flutter_complete_project/features/main/ui/logic/main_cubit.dart';
import 'package:flutter_complete_project/features/main/ui/logic/main_state.dart';
import 'package:flutter_complete_project/features/main/ui/widgets/bottom_nav_bar.dart';
import 'package:flutter_complete_project/features/main/ui/widgets/placeholder_screen.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: BlocSelector<MainCubit, MainState, int>(
        selector: (state) => state.selectedIndex,
        builder: (context, selectedIndex) {
          return IndexedStack(
            index: selectedIndex,
            children: [
              BlocProvider<HomeCubit>(
                create: (_) =>
                    HomeCubit(homeRepo: sl<HomeRepo>())..getHomeData(),
                child: const HomePage(),
              ),
              const PlaceholderScreen(title: 'Inbox'),
              const PlaceholderScreen(title: 'Search'),
              const PlaceholderScreen(title: 'Appointments'),
              const PlaceholderScreen(title: 'Profile'),
            ],
          );
        },
      ),
      bottomNavigationBar: BlocSelector<MainCubit, MainState, int>(
        selector: (state) => state.selectedIndex,
        builder: (context, selectedIndex) {
          return BottomNavBar(
            selectedIndex: selectedIndex,
            onTabSelected: (index) =>
                context.read<MainCubit>().changeTab(index),
          );
        },
      ),
    );
  }
}
