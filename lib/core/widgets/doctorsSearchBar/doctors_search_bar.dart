import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_complete_project/core/helpers/spacing.dart';
import 'package:flutter_complete_project/core/theming/colors.dart';
import 'package:flutter_complete_project/core/theming/styles.dart';
import 'package:flutter_complete_project/core/widgets/app_text_form_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class DoctorsSearchBar extends StatefulWidget {
  final Function(String searchQuery) searchFunction;
  final VoidCallback? onSortTap;
  final VoidCallback? onClearTap;
  const DoctorsSearchBar({
    super.key,
    required this.searchFunction,
    this.onSortTap,
    this.onClearTap,
  });

  @override
  State<DoctorsSearchBar> createState() => _DoctorsSearchBarState();
}

class _DoctorsSearchBarState extends State<DoctorsSearchBar> {
  late final TextEditingController searchController;
  Timer? _debounce;

  @override
  void initState() {
    super.initState();
    searchController = TextEditingController();
  }

  void _onUserSearching({required String searchQuery}) {
    _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 300), () async {
      await widget.searchFunction(searchQuery);
    });
    setState(() {});
  }

  @override
  void dispose() {
    super.dispose();
    searchController.dispose();
    _debounce?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.zero,
      child: Row(
        children: [
          Expanded(
            child: AppTextFormField(
              hintText: 'Search',
              controller: searchController,
              validator: (value) {},
              hintStyle: TextStyles.font12MediumLightGrey,
              prefixIcon: Icon(
                Icons.search,
                color: ColorsManager.lightGrey,
                size: 24.r,
              ),
              formFieldColor: ColorsManager.searchBarGrey,
              contentPadding: EdgeInsets.symmetric(vertical: 13.h),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.r),
                borderSide: BorderSide.none,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.r),
                borderSide: BorderSide.none,
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.r),
                borderSide: BorderSide.none,
              ),
              onChanged: (value) =>
                  _onUserSearching(searchQuery: searchController.text),
              suffixIcon: searchController.text.isNotEmpty
                  ? InkWell(
                      onTap: () {
                        searchController.clear();
                        if (widget.onClearTap != null) {
                          widget.onClearTap?.call();
                          return;
                        }
                        _onUserSearching(searchQuery: '');
                      },
                      child: Icon(Icons.cancel),
                    )
                  : null,
            ),
          ),
          horizontalSpace(12),
          GestureDetector(
            onTap: widget.onSortTap,
            child: SvgPicture.asset(
              'assets/svgs/sort.svg',
              color: ColorsManager.darkBlue,
            ),
          ),
        ],
      ),
    );
  }
}
