import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_complete_project/core/theming/colors.dart';

Widget imageWidget(String url) {
  return CachedNetworkImage(
    imageUrl: url,
    fit: BoxFit.cover,
    placeholder: (context, url) =>
        Center(child: CircularProgressIndicator(color: ColorsManager.mainBlue)),
    errorWidget: (context, url, error) =>
        Image.asset('assets/images/doctor_1.png', fit: BoxFit.cover),
  );
}
