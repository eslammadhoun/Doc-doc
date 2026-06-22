import 'package:flutter/material.dart';
import 'package:flutter_complete_project/features/profile/ui/medical_record/widgets/medical_record_entry.dart';
import 'package:flutter_complete_project/features/profile/ui/medical_record/widgets/medical_record_navbar.dart';
import 'package:flutter_complete_project/features/profile/ui/medical_record/widgets/medical_record_section.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MedicalRecordPage extends StatelessWidget {
  const MedicalRecordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            const MedicalRecordNavbar(),
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: Column(
                  children: [
                    SizedBox(height: 16.h),
                    MedicalRecordSection(
                      title: 'This Month',
                      entries: const [
                        MedicalRecordEntryData(
                          date: 'Feb 25',
                          title: 'End of observation',
                        ),
                        MedicalRecordEntryData(
                          date: 'Feb 25',
                          title: 'Blood Analysis',
                          details: [
                            'red blood cell : 4.10 million cells/mcL',
                            'hemogoblin : 142 grams/L',
                            'hematocrit : 33.6%',
                            'white blood cells : 3.850 cells/mcL',
                          ],
                        ),
                        MedicalRecordEntryData(
                          date: 'Feb 25',
                          title: 'Blood Analysis',
                          details: [
                            'red blood cell : 3.90 million cells/mcL',
                            'hemogoblin : 122 grams/L',
                            'hematocrit : 47.7%',
                            'white blood cells : 4.300 cells/mcL',
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 32.h),
                    MedicalRecordSection(
                      title: 'January',
                      entries: const [
                        MedicalRecordEntryData(
                          date: 'Feb 25',
                          title: 'End of observation',
                        ),
                        MedicalRecordEntryData(
                          date: 'Feb 25',
                          title: 'Blood Analysis',
                          details: [
                            'red blood cell : 4.30 million cells/mcL',
                            'hemogoblin : 132 grams/L',
                            'hematocrit : 37.7%',
                            'white blood cells : 4.700 cells/mcL',
                          ],
                        ),
                        MedicalRecordEntryData(
                          date: 'Feb 25',
                          title: 'Blood Analysis',
                          details: [
                            'red blood cell : 3.90 million cells/mcL',
                            'hemogoblin : 118 grams/L',
                            'hematocrit : 38.7%',
                            'white blood cells : 4.500 cells/mcL',
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 24.h),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
