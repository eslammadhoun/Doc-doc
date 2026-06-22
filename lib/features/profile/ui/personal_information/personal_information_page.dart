import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_complete_project/core/models/user_model.dart';
import 'package:flutter_complete_project/core/theming/colors.dart';
import 'package:flutter_complete_project/core/theming/styles.dart';
import 'package:flutter_complete_project/core/widgets/app_text_button.dart';
import 'package:flutter_complete_project/features/profile/data/models/update_profile_request_body.dart';
import 'package:flutter_complete_project/features/profile/ui/personal_information/logic/personal_information_cubit.dart';
import 'package:flutter_complete_project/features/profile/ui/personal_information/logic/personal_information_state.dart';
import 'package:flutter_complete_project/features/profile/ui/personal_information/widgets/personal_info_avatar.dart';
import 'package:flutter_complete_project/features/profile/ui/personal_information/widgets/personal_info_gender_selector.dart';
import 'package:flutter_complete_project/features/profile/ui/personal_information/widgets/personal_info_navbar.dart';
import 'package:flutter_complete_project/features/profile/ui/personal_information/widgets/personal_info_phone_field.dart';
import 'package:flutter_complete_project/features/profile/ui/personal_information/widgets/personal_info_text_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PersonalInformationPage extends StatefulWidget {
  final UserModel user;

  const PersonalInformationPage({super.key, required this.user});

  @override
  State<PersonalInformationPage> createState() =>
      _PersonalInformationPageState();
}

class _PersonalInformationPageState extends State<PersonalInformationPage> {
  late final TextEditingController _nameController;
  late final TextEditingController _emailController;
  late final TextEditingController _phoneController;
  late String _selectedGender;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.user.name);
    _emailController = TextEditingController(text: widget.user.email);
    _phoneController = TextEditingController(text: widget.user.phone);
    _selectedGender = widget.user.gender.toLowerCase() == 'female'
        ? 'female'
        : 'male';
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  void _onSave() {
    final body = UpdateProfileRequestBody(
      name: _nameController.text.trim(),
      email: _emailController.text.trim(),
      phone: _phoneController.text.trim(),
      gender: _selectedGender,
    );
    context.read<PersonalInformationCubit>().updateProfile(body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            const PersonalInfoNavbar(),
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Column(
                  children: [
                    SizedBox(height: 40.h),
                    const PersonalInfoAvatar(),
                    SizedBox(height: 50.h),
                    PersonalInfoTextField(
                      controller: _nameController,
                      hintText: 'Full Name',
                    ),
                    SizedBox(height: 16.h),
                    PersonalInfoTextField(
                      controller: _emailController,
                      hintText: 'Email',
                    ),
                    SizedBox(height: 16.h),
                    PersonalInfoPhoneField(controller: _phoneController),
                    SizedBox(height: 16.h),
                    PersonalInfoGenderSelector(
                      selectedGender: _selectedGender,
                      onChanged: (value) =>
                          setState(() => _selectedGender = value),
                    ),
                    SizedBox(height: 24.h),
                    Text(
                      'When you set up your personal information settings, you should take care to provide accurate information.',
                      style: TextStyles.font12RegularGrey.copyWith(
                        color: ColorsManager.grey,
                        height: 1.6,
                        letterSpacing: 0.2,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            _buildSaveButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildSaveButton() {
    return BlocConsumer<PersonalInformationCubit, PersonalInformationState>(
      listenWhen: (previous, current) =>
          previous.updateStatus != current.updateStatus,
      listener: (context, state) {
        if (state.updateStatus == UpdateProfileStatus.success) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Profile updated successfully'),
              backgroundColor: Colors.green,
            ),
          );
          Navigator.pop(context, true);
        } else if (state.updateStatus == UpdateProfileStatus.failure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.updateErrorModel.getAllMessages()),
              backgroundColor: Colors.red,
            ),
          );
        }
      },
      buildWhen: (previous, current) =>
          previous.updateStatus != current.updateStatus,
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
          child: AppTextButton(
            buttonText: 'Save',
            textStyle: TextStyles.font16SemiBold,
            onPressed: _onSave,
            child: state.updateStatus == UpdateProfileStatus.loading
                ? SizedBox(
                    width: 24.w,
                    height: 24.h,
                    child: const CircularProgressIndicator(
                      color: Colors.white,
                      strokeWidth: 2,
                    ),
                  )
                : null,
          ),
        );
      },
    );
  }
}
