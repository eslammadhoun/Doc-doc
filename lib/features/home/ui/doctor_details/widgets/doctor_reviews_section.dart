import 'package:flutter/material.dart';
import 'package:flutter_complete_project/core/helpers/spacing.dart';
import 'package:flutter_complete_project/features/home/ui/doctor_details/widgets/review_card.dart';

class DoctorReviewsSection extends StatelessWidget {
  const DoctorReviewsSection({super.key});

  static const List<ReviewCard> _reviews = [
    ReviewCard(
      reviewerName: 'Jane Cooper',
      date: 'Today',
      rating: 5,
      avatarAsset: 'assets/images/doctor_1.png',
      comment:
          'As someone who lives in a remote area with limited access to '
          'healthcare, this telemedicine app has been a game changer for me. '
          'I can easily schedule virtual appointments with doctors and get '
          'the care I need without having to travel long distances.',
    ),
    ReviewCard(
      reviewerName: 'Robert Fox',
      date: 'Today',
      rating: 5,
      avatarAsset: 'assets/images/doctor_image.png',
      comment:
          'I was initially skeptical about using a telemedicine app but this '
          'app has exceeded my expectations. The doctors are highly '
          'qualified and provide excellent care.',
    ),
    ReviewCard(
      reviewerName: 'Jacob Jones',
      date: 'Today',
      rating: 5,
      avatarAsset: 'assets/images/onboarding_doctor.png',
      comment:
          'I was initially skeptical about using a telemedicine app but this '
          'app has exceeded my expectations. The doctors are highly '
          'qualified and provide excellent care.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for (final review in _reviews) ...[review, verticalSpace(16)],
      ],
    );
  }
}
