import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_complete_project/core/helpers/app_preferences.dart';
import 'package:flutter_complete_project/core/networkingv2/api_result.dart';
import 'package:flutter_complete_project/core/routing/app_router.dart';
import 'package:flutter_complete_project/core/routing/routes.dart';
import 'package:flutter_complete_project/features/profile/data/models/get_profile_response_model.dart';
import 'package:flutter_complete_project/features/profile/data/repos/profile_repo.dart';
import 'package:flutter_complete_project/features/profile/ui/logic/profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final ProfileRepo profileRepo;
  ProfileCubit({required this.profileRepo}) : super(ProfileState());

  Future<void> getUserProfile() async {
    emit(state.copyWith(getUserProfileStatus: ProfileRequestStatus.loading));

    final ApiResult<GetProfileResponseModel> userProfileResult =
        await profileRepo.getUserProfile();

    userProfileResult.when(
      success: (userProfileModel) => emit(
        state.copyWith(
          getUserProfileStatus: ProfileRequestStatus.success,
          user: userProfileModel.user[0],
        ),
      ),
      failure: (dynamic error) => emit(
        state.copyWith(
          getUserProfileStatus: ProfileRequestStatus.failure,
          getUserProfileErrorModel: error,
        ),
      ),
    );
  }

  Future<void> logout() async {
    emit(state.copyWith(logoutStatus: ProfileRequestStatus.loading));

    final ApiResult<void> logoutResult = await profileRepo.logout();
    logoutResult.when(
      success: (void result) async {
        emit(state.copyWith(logoutStatus: ProfileRequestStatus.success));
        await AppPreferences.clearAllData();
        AppRouter.globalNavigatorKey.currentState?.pushNamedAndRemoveUntil(
          Routes.loginScreen,
          (route) => false,
        );
      },
      failure: (dynamic error) => emit(
        state.copyWith(
          logoutStatus: ProfileRequestStatus.failure,
          logoutErrorModel: error,
        ),
      ),
    );
  }
}
