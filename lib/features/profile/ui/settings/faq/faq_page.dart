import 'package:flutter/material.dart';
import 'package:flutter_complete_project/core/theming/colors.dart';
import 'package:flutter_complete_project/core/theming/styles.dart';
import 'package:flutter_complete_project/features/profile/ui/settings/faq/widgets/faq_item.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FaqPage extends StatefulWidget {
  const FaqPage({super.key});

  @override
  State<FaqPage> createState() => _FaqPageState();
}

class _FaqPageState extends State<FaqPage> {
  int _expandedIndex = 0;

  static const List<Map<String, String>> _faqItems = [
    {
      'question': "What should I expect during a doctor's appointment?",
      'answer':
          "During a doctor's appointment, you can expect to discuss your medical history, current symptoms or concerns, and any medications or treatments you are taking. The doctor will likely perform a physical exam and may order additional tests or procedures if necessary.",
    },
    {
      'question': "What should I bring to my doctor's appointment?",
      'answer':
          "You should bring your ID, insurance card, a list of current medications, and any relevant medical records or test results.",
    },
    {
      'question': 'What if I need to cancel or reschedule my appointment?',
      'answer':
          "You can cancel or reschedule your appointment through the app or by contacting the clinic directly. Please try to give at least 24 hours notice.",
    },
    {
      'question': 'How do I make an appointment with a doctor?',
      'answer':
          "You can make an appointment through the app by selecting a doctor, choosing an available time slot, and confirming your booking.",
    },
    {
      'question': "How early should I arrive for my doctor's appointment?",
      'answer':
          "It is recommended to arrive 10-15 minutes before your scheduled appointment to complete any necessary paperwork.",
    },
    {
      'question': "How long will my doctor's appointment take?",
      'answer':
          "A typical appointment lasts between 15-30 minutes, though this can vary depending on the type of visit and complexity of your concerns.",
    },
    {
      'question': "How much will my doctor's appointment cost?",
      'answer':
          "The cost depends on your insurance plan and the type of visit. You can check estimated costs in the app before booking.",
    },
    {
      'question': 'What should I look for in a good doctor?',
      'answer':
          "Look for a doctor with good reviews, relevant experience, board certifications, and a communication style that makes you comfortable.",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            _buildNavbar(),
            Expanded(
              child: ListView.separated(
                padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 20.h),
                itemCount: _faqItems.length,
                separatorBuilder: (_, _) => SizedBox(height: 12.h),
                itemBuilder: (context, index) {
                  final item = _faqItems[index];
                  return FaqItem(
                    question: item['question']!,
                    answer: item['answer']!,
                    isExpanded: _expandedIndex == index,
                    onTap: () => setState(
                      () =>
                          _expandedIndex = _expandedIndex == index ? -1 : index,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNavbar() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Container(
              width: 40.w,
              height: 40.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.r),
                border: Border.all(color: ColorsManager.lighterGrey),
              ),
              child: Center(
                child: SvgPicture.asset(
                  'assets/svgs/Chevron-left.svg',
                  width: 24.w,
                  height: 24.h,
                  colorFilter: const ColorFilter.mode(
                    ColorsManager.darkBlue,
                    BlendMode.srcIn,
                  ),
                ),
              ),
            ),
          ),
          Text('FAQ', style: TextStyles.font18SemiBoldNearBlack),
          Container(
            width: 40.w,
            height: 40.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.r),
              border: Border.all(color: ColorsManager.lighterGrey),
            ),
            child: Center(
              child: SvgPicture.asset(
                'assets/svgs/search-normal.svg',
                width: 24.w,
                height: 24.h,
                colorFilter: const ColorFilter.mode(
                  ColorsManager.darkBlue,
                  BlendMode.srcIn,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
