import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_complete_project/core/helpers/spacing.dart';
import 'package:flutter_complete_project/core/theming/colors.dart';
import 'package:flutter_complete_project/core/theming/styles.dart';
import 'package:flutter_complete_project/features/inbox/ui/conversation/logic/conversation_cubit.dart';
import 'package:flutter_complete_project/features/inbox/ui/conversation/logic/conversation_state.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ChatInputBar extends StatefulWidget {
  final String receiverId;
  const ChatInputBar({super.key, required this.receiverId});

  @override
  State<ChatInputBar> createState() => _ChatInputBarState();
}

class _ChatInputBarState extends State<ChatInputBar> {
  late final TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onSend() {
    final text = _controller.text.trim();
    if (text.isEmpty) return;

    context.read<ConversationCubit>().sendMessage(text: text);
    _controller.clear();
    context.read<ConversationCubit>().changeIsTyping(false);
  }

  @override
  Widget build(BuildContext context) {
    return BlocSelector<ConversationCubit, ConversationState, bool>(
      selector: (state) => state.istyping,
      builder: (context, isTyping) => Container(
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(top: BorderSide(color: ColorsManager.searchBarGrey)),
        ),
        child: Row(
          children: [
            Expanded(
              child: Container(
                height: 70.h,
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16.r),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withAlpha(12),
                      blurRadius: 30,
                      offset: Offset(0, -5.h),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    SvgPicture.asset(
                      'assets/svgs/smile.svg',
                      color: ColorsManager.mediumGrey,
                    ),
                    horizontalSpace(12),
                    Expanded(
                      child: Row(
                        children: [
                          Expanded(
                            child: TextFormField(
                              controller: _controller,
                              style: TextStyles.font14RegularDarkBlue,
                              decoration: InputDecoration(
                                hintText: 'Type a message ...',
                                hintStyle: TextStyles.font14RegularMediumGrey,
                                border: InputBorder.none,
                              ),
                              onChanged: (String value) => context
                                  .read<ConversationCubit>()
                                  .changeIsTyping(value.isNotEmpty),
                              onFieldSubmitted: (_) => _onSend(),
                            ),
                          ),
                          horizontalSpace(12),
                          SvgPicture.asset(
                            'assets/svgs/paperclip.svg',
                            color: ColorsManager.mediumGrey,
                            width: 20,
                          ),
                          horizontalSpace(12),
                          SvgPicture.asset(
                            'assets/svgs/camera.svg',
                            color: ColorsManager.mediumGrey,
                            width: 20,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            horizontalSpace(12),
            GestureDetector(
              onTap: _onSend,
              child: Container(
                padding: EdgeInsets.all(16.r),
                decoration: const BoxDecoration(
                  color: ColorsManager.mainBlue,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: SvgPicture.asset(
                    isTyping
                        ? 'assets/svgs/send-2.svg'
                        : 'assets/svgs/microphone.svg',
                    width: 20.w,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
