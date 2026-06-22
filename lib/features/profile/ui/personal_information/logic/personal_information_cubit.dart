import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_complete_project/core/networkingv2/api_result.dart';
import 'package:flutter_complete_project/features/profile/data/models/update_profile_request_body.dart';
import 'package:flutter_complete_project/features/profile/data/repos/profile_repo.dart';
import 'package:flutter_complete_project/features/profile/ui/personal_information/logic/personal_information_state.dart';

class PersonalInformationCubit extends Cubit<PersonalInformationState> {
  final ProfileRepo profileRepo;

  PersonalInformationCubit({required this.profileRepo})
      : super(PersonalInformationState());

  Future<void> updateProfile(UpdateProfileRequestBody body) async {
    emit(state.copyWith(updateStatus: UpdateProfileStatus.loading));

    final ApiResult<void> result = await profileRepo.updateProfile(body);

    result.when(
      success: (_) => emit(
        state.copyWith(updateStatus: UpdateProfileStatus.success),
      ),
      failure: (dynamic error) => emit(
        state.copyWith(
          updateStatus: UpdateProfileStatus.failure,
          updateErrorModel: error,
        ),
      ),
    );
  }
}
