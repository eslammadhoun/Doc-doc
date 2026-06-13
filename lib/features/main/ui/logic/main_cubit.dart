import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_complete_project/features/main/ui/logic/main_state.dart';

class MainCubit extends Cubit<MainState> {
  MainCubit() : super(const MainState());

  void changeTab(int index) {
    if (index == state.selectedIndex) return;
    emit(state.copyWith(selectedIndex: index));
  }
}
