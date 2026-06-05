import 'package:flutter/material.dart';
import 'package:flutter_complete_project/core/widgets/image_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DoctorMapPin extends StatelessWidget {
  final String? imageUrl;
  final VoidCallback? onTap;
  final bool isSelected;

  const DoctorMapPin({
    super.key,
    this.imageUrl,
    this.onTap,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        width: isSelected ? 80.w : 50.w,
        height: isSelected ? 80.h : 50.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(isSelected ? 20.r : 12.r),
          border: Border.all(
            color: isSelected ? const Color(0xFF3B82F6) : Colors.white,
            width: isSelected ? 3 : 2,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.12),
              blurRadius: 6,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular((isSelected ? 20.r : 12.r - 2).r),
          child: imageUrl != null && imageUrl!.isNotEmpty
              ? AppCachedImage(imageUrl: imageUrl!)
              : Image.asset('assets/images/doctor_1.png', fit: BoxFit.cover),
        ),
      ),
    );
  }
}
